select cc.clt_code clt_code
into #calls
from dfss_bi..calldetails cc
left join dfss_bi..telemarketingdetail t
on cc.clt_code=t.clt_code
where cc.calldate between '2016-1-1' and '2016-4-1' and t.cltstatus<>1
group by cc.clt_code

select s.clt_code
,isnull(sum(case when datediff(d,t.importdate,s.dealtime)<=30 then s.amount else 0 end),0) totalfee
into #fee
from dfss_bi..servicefeedetails s
left join dfss_bi..TelemarketingDetail t
on s.clt_code=t.clt_code
where s.dealtime between '2016-1-1' and '2016-4-1'
group by s.clt_code

select t.branch 分公司
,case when t.salescnt <=1 and t.cltstatus <>3 then '新话单'
	  else '老话单' end 新老话单
,isnull(count(*),0) 话单量
,isnull(sum(f.totalfee),0) 业绩
,case when isnull(count(*),0)=0 then 0 else isnull(sum(f.totalfee),0)*1./isnull(count(*),0) end 单位粒子产能
from #calls c
left join telemarketingdetail t
on c.clt_code=t.clt_code
left join #fee f
on c.clt_code=f.clt_code
group by t.branch
,case when t.salescnt <=1 and t.cltstatus <>3 then '新话单'
	  else '老话单' end

drop table #calls
drop table #fee
