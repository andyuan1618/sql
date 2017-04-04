select count(distinct t.clt_code) '话单量'
,isnull(sum(case when t.firstcalldate is not null then 1 else 0 end),0) '拨打量'
,isnull(sum(t.isgetthrough),0) '首拨接通量'
,isnull(sum(t.isenterprocess),0) '首拨有效进程'
,isnull(sum(t.requireamount),0) '需求总额'
,isnull(sum(case when t.RequireAmount>0 then 1 else 0 end),0) '需求客户数'
from dfss_bi..TelemarketingDetail t
where t.batchid=1050 and t.branch='青岛'