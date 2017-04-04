select t.branch company
,case when t.salescnt <=1 and t.cltstatus <>3 then 'news'
	  else 'olds' end ntype
,count(distinct c.clt_code) names
,sum(case when c.calldate is not null then 1 else 0 end) calls
,sum(c.isgetthrough) dialons
,case when sum(case when c.calldate is not null then 1 else 0 end)=0 then 0 else sum(c.isgetthrough)*1./sum(case when c.calldate is not null then 1 else 0 end) end rate_of_dialons
,sum(case when s.DealTime >= '2016-3-1' then cast(isnull(s.amount,0) as decimal(10,2)) else 0 end) sales
from dfss_bi..calldetails c
left join dfss_bi..telemarketingdetail t
on t.clt_code=c.clt_code
left join dfss_bi..servicefeedetails s
on t.clt_code=s.clt_code
where c.calldate >= '2016-3-1'
group by t.branch
,case when t.salescnt <=1 and t.cltstatus <>3 then 'news'
	  else 'olds' end

