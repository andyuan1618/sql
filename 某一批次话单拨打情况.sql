select count(distinct t.clt_code) '������'
,isnull(sum(case when t.firstcalldate is not null then 1 else 0 end),0) '������'
,isnull(sum(t.isgetthrough),0) '�ײ���ͨ��'
,isnull(sum(t.isenterprocess),0) '�ײ���Ч����'
,isnull(sum(t.requireamount),0) '�����ܶ�'
,isnull(sum(case when t.RequireAmount>0 then 1 else 0 end),0) '����ͻ���'
from dfss_bi..TelemarketingDetail t
where t.batchid=1050 and t.branch='�ൺ'