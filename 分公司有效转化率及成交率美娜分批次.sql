select distinct
g.clt_code clt_code
,g.batch batch
,isnull(sum(case when g.calldate is not null then 1 else 0 end),0) dial
,case when isnull(sum(g.isgetthrough),0)>0 then 1 else 0 end dialon
into #calls
from
(
select c.batch,c.clt_code,c.calldate,c.billsecond,c.isgetthrough
from dfss_bi..calldetails c

union all

select c.batch,c.clt_code,c.calldate,c.billsecond,c.isgetthrough
from dfss_bi..calldetails_2015 c
) g
group by g.clt_code,g.batch

select distinct
d.cltcode clt_code
,case when d.afterexestatus in (5,6) and d.createtime>='2015-1-1' then 1 else 0 end deal
into #status
from dfss_bi..CustomerExeStatusChangeHistoryId_Combined d
where d.AfterExeStatus in (1,2,3,4,5,6) and d.CreateTime>='2015-1-1'
group by d.cltcode,d.afterexestatus,d.createtime

select b.importdate 导入日期
,b.remarks 话单性质
,b.batch 文件
,b.channel 渠道
,b.branch 分公司
,isnull(sum(m.dial),0) 已拨打
,isnull(sum(m.dialon),0) 已接通
,isnull(sum(case when s.clt_code is not null then 1 else 0 end),0) 已转化
,isnull(sum(case when s.deal is not null then s.deal else 0 end),0) 已成交
,case when isnull(sum(m.dialon),0)=0 then 0 else isnull(sum(case when s.clt_code is not null then 1 else 0 end),0)*1./isnull(sum(m.dialon),0) end 有效转化率
,case when isnull(sum(case when s.clt_code is not null then 1 else 0 end),0)=0 then 0 else isnull(sum(case when s.deal is not null then s.deal else 0 end),0)*1./isnull(sum(case when s.clt_code is not null then 1 else 0 end),0) end 成交率
from dfss_bi..batchinfo b
left join #calls m
on b.batch=m.batch
left join #status s
on m.clt_code=s.clt_code
group by b.importdate,b.remarks,b.batch,b.channel,b.branch

drop table #calls
drop table #status