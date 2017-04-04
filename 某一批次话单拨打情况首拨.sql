select distinct t.clt_code
,case when t.firstcalldate is not null then 1 else 0 end dial
,t.isgetthrough dialon
,t.isenterprocess effect
,t.requireamount rqr_amount
,case when t.RequireAmount>0 then 1 else 0 end rqr_num
into #calls
from dfss_bi..TelemarketingDetail t
where t.batchid=1050 and t.branch='青岛'
group by t.clt_code,t.firstcalldate,t.isgetthrough,t.isenterprocess,t.requireamount

select count(distinct l.clt_code) '话单量'
,isnull(sum(l.dial),0) '拨打量'
,isnull(sum(l.dialon),0) '接通量'
,isnull(sum(l.effect),0) '有效进程量'
,isnull(sum(l.rqr_amount),0) '需求总额'
,isnull(sum(l.rqr_num),0) '客户数'
from #calls l

drop table #calls