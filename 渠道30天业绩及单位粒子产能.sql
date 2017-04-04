select b.Channel '����'
,count(*) '������'
,isnull(sum(t.ServiceTotal_30days),0) '30��ҵ��'
,case when count(*)=0 then 0 else isnull(sum(t.ServiceTotal_30days),0)*1./count(*) end '��λ���Ӳ���'
from dfss_bi..TelemarketingDetail t
left join dfss_bi..BatchInfo b
on t.batch=b.batch
group by b.Channel