select t.branch '分公司'
,case when t.salescnt <=1 and t.cltstatus <>3 then '新话单'
	  else '老话单' end '话单类型'
,case when s.dealtime between '2016-1-1' and '2016-2-1' then '1月'
	  when s.dealtime between '2016-2-1' and '2016-3-1' then '2月'
	  when s.dealtime >= '2016-3-1' then '3月'
	  else '其他' end '月份'
,sum(cast(isnull(s.amount,0) as decimal(10,2))) '业绩'
from dfss_bi..telemarketingdetail t
left join dfss_bi..servicefeedetails s
on t.clt_code=s.clt_code
group by t.branch,case when t.salescnt <=1 and t.cltstatus <>3 then '新话单'
	  else '老话单' end,case when s.dealtime between '2016-1-1' and '2016-2-1' then '1月'
	  when s.dealtime between '2016-2-1' and '2016-3-1' then '2月'
	  when s.dealtime >= '2016-3-1' then '3月'
	  else '其他' end 