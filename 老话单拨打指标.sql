/* ������� */
select h.clt_code clt_code
,h.dialon dialon
into #calls
from
(
select distinct
c.clt_code clt_code
,case when isnull(sum(c.isgetthrough),0)>0 then 1 else 0 end dialon
from dfss_bi..calldetails c
where c.calldate>='2016-6-1'
group by c.clt_code
) h
left join dfss_bi..telemarketingdetail t
on h.clt_code=t.clt_code
where t.importdate<'2016-6-1' and t.cltstatus<>1
group by h.clt_code,h.dialon


/* ҵ����� */
select s.clt_code clt_code
,isnull(sum(s.amount),0) fee
into #fee
from dfss_bi..servicefeedetails s
where s.dealtime>='2016-6-1'
group by s.clt_code

/* ��Ч���� */
select distinct st.cltcode clt_code
,case when st.afterexestatus in (1,2,3,4,5,6) then 1 else 0 end effect
into #status
from dfss_bi..customerexestatuschangehistoryid_combined st
where st.CreateTime>='2016-6-1'
group by st.cltcode,st.preexestatus,st.afterexestatus

/* ָ�� */
select t.branch �ֹ�˾
,count(*) ���򻰵���
,isnull(sum(f.fee),0) ��ǩҵ��
,isnull(sum(c.dialon),0) ��ͨ��
,isnull(sum(s.effect),0) ��Ч������
,isnull(sum(case when t.requireamount>0 then t.requireamount else 0 end),0) �����ܶ�
,isnull(sum(case when t.requireamount>0 then 1 else 0 end),0) ����ͻ�
from #calls c
left join dfss_bi..telemarketingdetail t
on c.clt_code=t.clt_code
left join #fee f
on c.clt_code=f.clt_code
left join #status s
on c.clt_code=s.clt_code
group by t.branch

drop table #calls
drop table #fee
drop table #status
