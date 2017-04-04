select b.Channel '渠道'
,count(*) '话单量'
,isnull(sum(t.ServiceTotal_30days),0) '30天业绩'
,case when count(*)=0 then 0 else isnull(sum(t.ServiceTotal_30days),0)*1./count(*) end '单位粒子产能'
from dfss_bi..TelemarketingDetail t
left join dfss_bi..BatchInfo b
on t.batch=b.batch
group by b.Channel