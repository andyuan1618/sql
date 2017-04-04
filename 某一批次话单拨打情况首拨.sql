select distinct t.clt_code
,case when t.firstcalldate is not null then 1 else 0 end dial
,t.isgetthrough dialon
,t.isenterprocess effect
,t.requireamount rqr_amount
,case when t.RequireAmount>0 then 1 else 0 end rqr_num
into #calls
from dfss_bi..TelemarketingDetail t
where t.batchid=1050 and t.branch='�ൺ'
group by t.clt_code,t.firstcalldate,t.isgetthrough,t.isenterprocess,t.requireamount

select count(distinct l.clt_code) '������'
,isnull(sum(l.dial),0) '������'
,isnull(sum(l.dialon),0) '��ͨ��'
,isnull(sum(l.effect),0) '��Ч������'
,isnull(sum(l.rqr_amount),0) '�����ܶ�'
,isnull(sum(l.rqr_num),0) '�ͻ���'
from #calls l

drop table #calls