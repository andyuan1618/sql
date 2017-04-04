/* 公海1话单 */

select distinct t.clt_code
,t.importdate
into #clt
from dfss_bi..telemarketingdetail t
where t.cltstatus=3 and t.importdate>='2015-1-1' and t.branch='成都'
group by t.clt_code,t.importdate

/* 拨打情况 */

select distinct c.clt_code
,isnull(sum(case when c.calldate is not null then 1 else 0 end),0) dial_num
,isnull(sum(c.isgetthrough),0) dialon_num
,isnull(sum(c.billsecond),0) billsec_total
,isnull(sum(case when c.billsecond>=30 then 1 else 0 end),0) billsec_30s_num
,case when isnull(sum(c.isgetthrough),0)=0 then 0 else isnull(sum(c.billsecond),0)*1./isnull(sum(c.isgetthrough),0) end billsec_avg
into #calls
from 
(
select clt_code,calldate,billsecond,isgetthrough from dfss_bi..calldetails
union all
select clt_code,calldate,billsecond,isgetthrough from dfss_bi..calldetails_2015
) c
left join dfss_bi..telemarketingdetail t
on c.clt_code=t.clt_code
where t.branch='成都'
group by c.clt_code

/* 指标 */

select p.clt_code
,p.importdate
,isnull(q.dial_num,0)
,isnull(q.dialon_num,0)
,isnull(q.billsec_total,0)
,isnull(q.billsec_30s_num,0)
,isnull(q.billsec_avg,0)
from #clt p
left join #calls q
on p.clt_code=q.clt_code
group by p.clt_code,p.importdate,q.dial_num,q.dialon_num,q.billsec_total,q.billsec_30s_num,q.billsec_avg
order by p.importdate desc

/* 删除临时表 */

drop table #calls
drop table #clt
