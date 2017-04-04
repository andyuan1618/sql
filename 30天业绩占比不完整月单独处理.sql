select isnull(sum(h.fee),0) '30ÃÏ“µº®'
from
(
select distinct s.clt_code clt_code
,year(s.dealtime) yy
,month(s.dealtime) mm
,isnull(sum(case when datediff(d,t.ImportDate,c.FinalArchiveTime)<=30 then s.amount else 0 end),0) fee
from dfss_bi..ServiceFeeDetails s
left join dfss_bi..CltContract c
on s.clt_code=c.clt_code
left join dfss_bi..TelemarketingDetail t
on s.clt_code=t.clt_code
where s.dealtime between '2016-5-12' and '2016-6-12 23:59:59' and s.amount>0 and t.cltstatus<>1
group by s.clt_code,year(s.dealtime),month(s.dealtime)
) h

select isnull(sum(s.amount),0) totalfee
from dfss_bi..ServiceFeeDetails s
where s.dealtime between '2016-5-12' and '2016-6-12 23:59:59'

