/* ����ǿ�������� */

/* ��ʷ��ͨ��� */

select distinct c.clt_code
,case when isnull(sum(c.isgetthrough),0)>0 then 1 else 0 end dialon_history
into #calls_history
from dfss_bi..calldetails c
where c.calldate between '2016-1-1' and '2016-4-30 23:59:59'
group by c.clt_code

/* ���²��򻰵� */

select distinct c.clt_code
,case when isnull(sum(c.isgetthrough),0)>0 then 1 else 0 end dialon
,ch.dialon_history
into #calls
from dfss_bi..calldetails c
left join #calls_history ch
on c.clt_code=ch.clt_code
where c.calldate between '2016-5-1' and '2016-5-31 23:59:59'
group by c.clt_code,ch.dialon_history

/* ��ʷ��Ч���� */

select distinct h.cltcode
into #status_history
from dfss_bi..customerexestatuschangehistoryid_combined h
where h.afterexestatus in (1,2,3,4,5,6) and h.createtime between '2016-1-1' and '2016-4-30 23:59:59'
group by h.cltcode


/* ������Ч���� */

select distinct h.cltcode
,case when sh.cltcode is not null then 1 else 0 end pre_status 
into #status
from dfss_bi..customerexestatuschangehistoryid_combined h
left join #status_history sh
on h.cltcode=sh.cltcode
where h.afterexestatus in (1,2,3,4,5,6) and h.createtime between '2016-5-1' and '2016-5-31 23:59:59'
group by h.cltcode,sh.cltcode

/* 5�µ�����г�����  &  5�������г����� */
select distinct t.clt_code
,1 clt_type
into #clt
from dfss_bi..telemarketingdetail t
--left join dfss_bi..userinfo u
--on t.clt_code=u.clt_code
where t.importdate between '2016-5-1' and '2016-5-31 23:59:59' and t.cltstatus<>1 --and u.importdate between '2016-5-1' and '2016-5-31 23:59:59'
group by t.clt_code

union all

select distinct u.clt_code
,0 clt_type
from dfss_bi..userinfo u
where u.fromwebsite='�г�' and u.importdate between '2016-5-1' and '2016-5-31 23:59:59'
group by u.clt_code

--clt_type  1������г����� 0�г�����

/* �״β������Ч���� */

select distinct c1.clt_code
,c1.calldate firstcalldate
into #calls_first
from dfss_bi..calldetails c1
inner join 
(
select distinct clt_code
,min(calldate) min_calldate
from dfss_bi..calldetails
where calldate between '2016-5-1' and '2016-5-31 23:59:59'
group by clt_code
) c2
on c1.clt_code=c2.clt_code and c1.calldate=c2.min_calldate
where c1.calldate between '2016-5-1' and '2016-5-31 23:59:59'
group by c1.clt_code,c1.calldate,c1.isgetthrough

select distinct h1.cltcode
,h1.createtime min_createtime
,case when h1.afterexestatus not in (1,2,3,4,5,6) then 1 else 0 end firstcalldialeffect
into #effect
from dfss_bi..customerexestatuschangehistoryid_combined h1
inner join 
(
select distinct h.cltcode
,min(customerexestatuschangehistoryid) min_id 
from dfss_bi..customerexestatuschangehistoryid_combined h
left join #calls_first f
on h.cltcode=f.clt_code
where h.createtime>=f.firstcalldate and h.createtime between '2016-5-1' and '2016-5-31 23:59:59'
group by h.cltcode
) h2
on h1.cltcode=h2.cltcode and h1.customerexestatuschangehistoryid=h2.min_id
where h1.createtime between '2016-5-1' and '2016-5-31 23:59:59'
group by h1.cltcode,h1.createtime,h1.preexestatus,h1.afterexestatus


/* ����--1 */

--������������

select case when l.clt_type=1 then '���г�����' else '�г�����' end ������Դ
,count(*) ��������������
from #clt l
group by case when l.clt_type=1 then '���г�����' else '�г�����' end

--���½�ͨ�Ҳ��������޳���ʷ��Ч���̣�

select case when u.fromwebsite='���г�' then '���г�����' else '�г�����' end ������Դ
,isnull(sum(case when s.cltcode is not null and s.pre_status=0 then 1 else 0 end),0) ���½�ͨ��Ч������
from #calls m
left join dfss_bi..userinfo u
on m.clt_code=u.clt_code
left join #status s
on m.clt_code=s.cltcode
where m.dialon=1 --and m.dialon_history=0
group by case when u.fromwebsite='���г�' then '���г�����' else '�г�����' end

--���½�ͨ�Ҳ������󣨰�����ʷ��Ч���̣�

select case when u.fromwebsite='���г�' then '���г�����' else '�г�����' end ������Դ
,isnull(sum(case when s.cltcode is not null then 1 else 0 end),0) ���½�ͨ��Ч������
from #calls m
left join dfss_bi..userinfo u
on m.clt_code=u.clt_code
left join #status s
on m.clt_code=s.cltcode
where m.dialon=1 --and m.dialon_history=0
group by case when u.fromwebsite='���г�' then '���г�����' else '�г�����' end

--���²������Ч����

select case when u.fromwebsite='���г�' then '���г�����' else '�г�����' end ������Դ
,isnull(sum(case when s.cltcode is null then 1 else 0 end),0) ���²������Ч����
from #calls m
left join dfss_bi..userinfo u
on m.clt_code=u.clt_code
left join #status s
on m.clt_code=s.cltcode
group by case when u.fromwebsite='���г�' then '���г�����' else '�г�����' end

--�����ײ�����Ч����

select case when u.fromwebsite='���г�' then '���г�����' else '�г�����' end ������Դ
,isnull(sum(case when e.cltcode is null or e.firstcalldialeffect=1 then 1 else 0 end),0) �����ײ�����Ч����
from #calls m
left join #effect e
on m.clt_code=e.cltcode
left join dfss_bi..userinfo u
on m.clt_code=u.clt_code
group by case when u.fromwebsite='���г�' then '���г�����' else '�г�����' end 

drop table #calls_first
drop table #effect
drop table #status_history
drop table #status
drop table #calls
drop table #calls_history
drop table #clt

