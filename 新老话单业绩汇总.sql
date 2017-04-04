--定义新老用户

select c.clt_code,cast(year(min(c.calldate)) as varchar)+'-'+cast(month(min(c.calldate)) as varchar) yymm
into #cltType
from dfss_bi..calldetails c
group by c.clt_code

union all

select c.clt_code,cast(year(min(c.calldate)) as varchar)+'-'+cast(month(min(c.calldate)) as varchar) yymm
from dfss_bi..calldetails_2015 c
group by c.clt_code

--拨打数量

select cast(year(c.calldate) as varchar)+'-'+cast(month(c.calldate) as varchar) yymm
,c.clt_code,count(*)
from dfss_bi..calldetails c
where c.calldate>='2016-3-21'
group by c.calldate,c.clt_code

union all


