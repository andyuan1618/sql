select t.batch '文件'
,t.branch '分公司'
,case when t.importdate between '2016-1-4' and '2016-1-14 23:59:59' and s.dealtime between '2016-1-4' and '2016-1-14 23:59:59' then sum(cast(isnull(s.amount,0) as decimal(10,2))) else 0 end  '1月业绩'
,case when t.importdate between '2016-2-16' and '2016-2-26 23:59:59' and s.dealtime between '2016-2-16' and '2016-2-26 23:59:59' then sum(cast(isnull(s.amount,0) as decimal(10,2))) else 0 end  '2月业绩'
,case when t.importdate between '2016-3-1' and '2016-3-11 23:59:59' and s.dealtime between '2016-3-1' and '2016-3-11 23:59:59' then sum(cast(isnull(s.amount,0) as decimal(10,2))) else 0 end  '3月业绩'
,case when t.importdate between '2016-4-5' and '2016-4-15 23:59:59' and s.dealtime between '2016-4-5' and '2016-4-15 23:59:59' then sum(cast(isnull(s.amount,0) as decimal(10,2))) else 0 end  '4月业绩'
from dfss_bi..telemarketingdetail t
left join dfss_bi..servicefeedetails s
on t.clt_code=s.clt_code
group by t.batch,t.branch,t.importdate,s.dealtime