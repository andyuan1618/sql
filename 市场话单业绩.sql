select isnull(sum(f.fee),0) fee2
from
(
select distinct s.clt_code clt_code
,isnull(sum(s.amount),0) fee
from dfss_bi..ServiceFeeDetails s
left join dfss_bi..userinfo u
on s.clt_code=u.clt_code
where u.FromWebsite='ÊÐ³¡' and s.dealtime between '2016-5-1' and '2016-5-31 23:59:59' and u.importdate between '2016-5-1' and '2016-5-31 23:59:59'
group by s.clt_code
) f
