select t.branch '分公司'
,case when t.salescnt <=1 and t.cltstatus <>3 then '新话单'
	  else '老话单' end '话单类型'
,count(*) '话单量'
from dfss_bi..telemarketingdetail t
where t.cltstatus =3 and t.salescnt>=6
group by t.branch,case when t.salescnt <=1 and t.cltstatus <>3 then '新话单'
	  else '老话单' end