/* ����ǿ�������� */

/* ������� */

select distinct c1.clt_code
,c1.calldate firstcalldate
,case when c1.calldate is not null and c1.isgetthrough>0 then 1 else 0 end firstcalldialon
into #calls
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

/* �״β����ͨ��Ч���� */

select distinct h1.cltcode
,h1.createtime min_createtime
,case when h1.preexestatus in (10,0) and h1.afterexestatus in (1,2,3,4,5,6) and c.firstcalldialon=1 and h1.CreateTime>=c.firstcalldate then 1 else 0 end firstcalldialoneffect
into #effect
from dfss_bi..CustomerExeStatusChangeHistoryId_Combined h1
left join 
(
select distinct cltcode
,min(CustomerExeStatusChangeHistoryId) min_id 
from dfss_bi..CustomerExeStatusChangeHistoryId_Combined
where createtime between '2016-5-1' and '2016-5-31 23:59:59'
group by cltcode
) h2
on h1.cltcode=h2.cltcode and h1.CustomerExeStatusChangeHistoryId=h2.min_id
left join #calls c
on h1.cltcode=c.clt_code
where h1.createtime between '2016-5-1' and '2016-5-31 23:59:59'
group by h1.cltcode,h1.createtime,h1.PreExeStatus,h1.AfterExeStatus,c.firstcalldialon,c.firstcalldate

/* 5�µ����»���  &  5�������г����� */
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

--clt_type  1�����»��� 0�г�����


/* ���� */
select case when l.clt_type=1 then '�»���' else '�г�����' end ������Դ
,count(*) ��������������
,isnull(sum(case when e.firstcalldialoneffect=1 then 1 else 0 end),0) �����ײ���ͨ��Ч���̻�����
,isnull(sum(case when e.firstcalldialoneffect=0 then 1 else 0 end),0) �����ײ���ͨδ����Ч�滰����
from #clt l
left join #effect e
on l.clt_code=e.cltcode
group by case when l.clt_type=1 then '�»���' else '�г�����' end


drop table #effect
drop table #calls
drop table #clt

