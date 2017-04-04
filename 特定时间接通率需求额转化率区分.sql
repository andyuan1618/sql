select clt_code clt_code
,case when isnull(sum(isgetthrough),0)>=1 then 1 else 0 end dialon
into #calls
from dfss_bi..calldetails
where calldate between '2016-1-1' and '2016-4-26 23:59:59'
group by clt_code

select t.branch 分公司
,case when t.salescnt <=1 and t.cltstatus <>3 then '新话单'
	  else '老话单' end 新老话单
,case when u.cmp_name='企业主' then '企业话单' else '需求话单' end 话单类型 
,isnull(count(*),0) 话单量
,isnull(sum(c.dialon),0) 接通量
,case when isnull(count(c.clt_code),0)=0 then 0 else isnull(sum(c.dialon),0)*1./isnull(count(c.clt_code),0) end 接通率
,isnull(sum(t.isgetthrough),0) 首拨接通量
,case when isnull(count(c.clt_code),0)=0 then 0 else isnull(sum(t.isgetthrough),0)*1./isnull(count(c.clt_code),0) end 首拨接通率
,isnull(sum(t.isenterprocess),0) 首拨有效进程量
,case when isnull(sum(t.isgetthrough),0)=0 then 0 else isnull(sum(t.isenterprocess),0)*1./isnull(sum(t.isgetthrough),0) end 首拨转化率
,isnull(sum(t.requireamount),0) 需求总额
,isnull(sum(case when t.requireamount>0 then 1 else 0 end),0) 有需求客户数
,case when isnull(sum(case when t.requireamount>0 then 1 else 0 end),0)=0 then 0 else isnull(sum(t.requireamount),0)*1./isnull(sum(case when t.requireamount>0 then 1 else 0 end),0) end 平均需求额度
from #calls c
left join telemarketingdetail t
on c.clt_code=t.clt_code
left join dfss_bi..userinfo u
on c.clt_code=u.clt_code
group by t.branch
,case when t.salescnt <=1 and t.cltstatus <>3 then '新话单'
	  else '老话单' end
,case when u.cmp_name='企业主' then '企业话单' else '需求话单' end

drop table #calls