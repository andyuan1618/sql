/* 市场话单 12548条 */

select distinct g.cltcode clt_code
,'成都' city
into #clt
from dfss_chengdu..clientstatuschangelog g
where createtime>'2016-06-20' and createtime<'2016-06-21' and memo='市场部申请划转数据'

union all

select distinct g.cltcode
,'广州' city
from dfss_guangzhou..clientstatuschangelog g
where createtime>'2016-06-20' and createtime<'2016-06-21' and memo='市场部申请划转数据'

union all

select distinct g.cltcode
,'杭州' city
from dfss_hangzhou..clientstatuschangelog g
where createtime>'2016-06-20' and createtime<'2016-06-21' and memo='市场部申请划转数据'

union all

select distinct g.cltcode
,'南京' city
from dfss_nanjing..clientstatuschangelog g
where createtime>'2016-06-20' and createtime<'2016-06-21' and memo='市场部申请划转数据'

union all

select distinct g.cltcode
,'宁波' city
from dfss_ningbo..clientstatuschangelog g
where createtime>'2016-06-20' and createtime<'2016-06-21' and memo='市场部申请划转数据'

union all

select distinct g.cltcode
,'青岛' city
from dfss_qingdao..clientstatuschangelog g
where createtime>'2016-06-20' and createtime<'2016-06-21' and memo='市场部申请划转数据'

union all

select distinct g.cltcode
,'上海' city
from dfss_shanghai..clientstatuschangelog g
where createtime>'2016-06-20' and createtime<'2016-06-21' and memo='市场部申请划转数据'

union all

select distinct g.cltcode
,'深圳' city
from dfss_shenzhen..clientstatuschangelog g
where createtime>'2016-06-20' and createtime<'2016-06-21' and memo='市场部申请划转数据'

union all

select distinct g.cltcode
,'苏州' city
from dfss_suzhou..clientstatuschangelog g
where createtime>'2016-06-20' and createtime<'2016-06-21' and memo='市场部申请划转数据'

union all

select distinct g.cltcode
,'无锡' city
from dfss_wuxi..clientstatuschangelog g
where createtime>'2016-06-20' and createtime<'2016-06-21' and memo='市场部申请划转数据'

/* 拨打情况 */

select distinct c.clt_code
,case when isnull(sum(c.isgetthrough),0)>0 then 1 else 0 end dialon
into #calls
from dfss_bi..calldetails c
where c.calldate>'2016-6-20'
group by c.clt_code

/* 有效进程 */

select distinct st.cltcode clt_code
,case when st.afterexestatus in (1,2,3,4,5,6) then 1 else 0 end effect
into #status
from dfss_bi..customerexestatuschangehistoryid_combined st
where st.createTime>'2016-6-20'  /* 日期按需求更改 */
group by st.cltcode,st.afterexestatus

/* 指标 */

select p.city '分公司'
,count(distinct p.clt_code) '话单量'
,isnull(sum(case when l.clt_code is not null then 1 else 0 end),0) '拨打量'
,isnull(sum(l.dialon),0) '接通量'
,isnull(sum(case when s.clt_code is not null then s.effect else 0 end),0) '有效进程'
,isnull(sum(t.requireamount),0) '需求总额'
,isnull(sum(case when t.requireamount>0 then 1 else 0 end),0) '有需求客户数'
,case when count(distinct t.clt_code)=0 then 0 else isnull(sum(case when l.clt_code is not null then 1 else 0 end),0)*1./count(distinct t.clt_code) end '拨打率'
,case when isnull(sum(case when l.clt_code is not null then 1 else 0 end),0)=0 then 0 else isnull(sum(l.dialon),0)*1./isnull(sum(case when l.clt_code is not null then 1 else 0 end),0) end '接通率'
,case when isnull(sum(l.dialon),0)=0 then 0 else isnull(sum(case when s.clt_code is not null then s.effect else 0 end),0)*1./isnull(sum(l.dialon),0) end '转化率'
,case when isnull(sum(case when t.requireamount>0 then 1 else 0 end),0)=0 then 0 else isnull(sum(t.requireamount),0)*1./isnull(sum(case when t.requireamount>0 then 1 else 0 end),0) end '平均需求额'
from #clt p
left join dfss_bi..telemarketingdetail t
on p.clt_code=t.clt_code
left join #calls l
on p.clt_code=l.clt_code
left join #status s
on p.clt_code=s.clt_code
group by p.city

/* 删除临时表 */
drop table #calls
drop table #status
drop table #clt
