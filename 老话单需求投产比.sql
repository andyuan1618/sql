/* 老话单需求投产比 */

/* 拨打情况及需求额 */
select h.clt_code
,t.branch
,h.dialon
,t.requireamount
into #calls
from
(
select distinct
c.clt_code
,case when isnull(sum(c.isgetthrough),0)>0 then 1 else 0 end dialon
from dfss_bi..calldetails c
where c.calldate between '2016-6-1' and '2016-6-30 23:59:59'   -- 拨打日期 
group by c.clt_code
) h
left join dfss_bi..telemarketingdetail t
on h.clt_code=t.clt_code
where t.importdate<'2016-6-1' and t.cltstatus<>1    -- 导入日期 
group by h.clt_code,t.branch,h.dialon,t.requireamount

/* 有效进程 */
select distinct st.cltcode
,case when st.afterexestatus in (1,2,3,4,5,6) then 1 else 0 end effect
into #status
from dfss_bi..customerexestatuschangehistoryid_combined st
where st.createtime between '2016-6-1' and '2016-6-30 23:59:59'     -- 有效进程创建日期 
group by st.cltcode,st.preexestatus,st.afterexestatus

/* 指标 */
select c.branch 分公司
,count(*) 拨打话单量
,isnull(sum(c.dialon),0) 接通量
,isnull(sum(s.effect),0) 有效进程量
,isnull(sum(case when c.requireamount>0 then c.requireamount else 0 end),0) 需求总额
,isnull(sum(case when c.requireamount>0 then 1 else 0 end),0) 需求客户
,case when count(*)=0 then 0 else isnull(sum(c.dialon),0)*1./count(*) end 接通率
,case when isnull(sum(c.dialon),0)=0 then 0 else isnull(sum(s.effect),0)*1./isnull(sum(c.dialon),0) end 转化率
,case when isnull(sum(case when c.requireamount>0 then 1 else 0 end),0)=0 then 0 else isnull(sum(case when c.requireamount>0 then c.requireamount else 0 end),0)*1./isnull(sum(case when c.requireamount>0 then 1 else 0 end),0) end 平均需求额
,count(*)*(case when count(*)=0 then 0 else isnull(sum(c.dialon),0)*1./count(*) end)*(case when isnull(sum(c.dialon),0)=0 then 0 else isnull(sum(s.effect),0)*1./isnull(sum(c.dialon),0) end)*(case when isnull(sum(case when c.requireamount>0 then 1 else 0 end),0)=0 then 0 else isnull(sum(case when c.requireamount>0 then c.requireamount else 0 end),0)*1./isnull(sum(case when c.requireamount>0 then 1 else 0 end),0) end)*(248*1./10)*1./(count(*)*0.15+count(*)*2) 需求投产比
from #calls c
left join #status s
on c.clt_code=s.cltcode
group by c.branch

drop table #calls
drop table #status
