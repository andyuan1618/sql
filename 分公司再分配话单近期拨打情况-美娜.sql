/* ������� */

select distinct c.clt_code
,case when isnull(sum(c.isgetthrough),0)>0 then 1 else 0 end dialon
into #calls
from dfss_bi..calldetails c
where c.calldate>='2016-6-16'
group by c.clt_code

/* ��Ч���� */

select distinct st.cltcode clt_code
,case when st.afterexestatus in (1,2,3,4,5,6) then 1 else 0 end effect
into #status
from dfss_bi..customerexestatuschangehistoryid_combined st
where st.CreateTime>='2016-6-16'  /* ���ڰ�������� */
group by st.cltcode,st.preexestatus,st.afterexestatus

/* ���λ�����������������κͳ��У�*/

select count(distinct t.clt_code) '������'
,isnull(sum(case when l.clt_code is not null then 1 else 0 end),0) '������'
,isnull(sum(l.dialon),0) '��ͨ��'
,isnull(sum(case when s.clt_code is not null then s.effect else 0 end),0) '��Ч����'
,isnull(sum(t.requireamount),0) '�����ܶ�'
,isnull(sum(case when t.requireamount>0 then 1 else 0 end),0) '������ͻ���'
,case when count(distinct t.clt_code)=0 then 0 else isnull(sum(case when l.clt_code is not null then 1 else 0 end),0)*1./count(distinct t.clt_code) end '������'
,case when isnull(sum(case when l.clt_code is not null then 1 else 0 end),0)=0 then 0 else isnull(sum(l.dialon),0)*1./isnull(sum(case when l.clt_code is not null then 1 else 0 end),0) end '��ͨ��'
,case when isnull(sum(l.dialon),0)=0 then 0 else isnull(sum(case when s.clt_code is not null then s.effect else 0 end),0)*1./isnull(sum(l.dialon),0) end 'ת����'
,case when isnull(sum(case when t.requireamount>0 then 1 else 0 end),0)=0 then 0 else isnull(sum(t.requireamount),0)*1./isnull(sum(case when t.requireamount>0 then 1 else 0 end),0) end 'ƽ�������'
from dfss_bi..TelemarketingDetail t
left join #calls l
on t.clt_code=l.clt_code
left join #status s
on t.clt_code=s.clt_code
where t.cltstatus<>1 and t.branch='����' and t.batchid in (341,342,348,351,352)

drop table #calls
drop table #status