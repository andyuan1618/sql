/* 拨打情况 */

select distinct c.clt_code
,case when isnull(sum(c.isgetthrough),0)>0 then 1 else 0 end dialon
into #calls
from dfss_bi..calldetails c
where c.calldate>='2016-6-16'
group by c.clt_code

/* 有效进程 */

select distinct st.cltcode clt_code
,case when st.afterexestatus in (1,2,3,4,5,6) then 1 else 0 end effect
into #status
from dfss_bi..customerexestatuschangehistoryid_combined st
where st.CreateTime>='2016-6-16'  /* 日期按需求更改 */
group by st.cltcode,st.preexestatus,st.afterexestatus

/* 批次话单（按需求更改批次和城市）*/

select count(distinct t.clt_code) '话单量'
,isnull(sum(case when l.clt_code is not null then 1 else 0 end),0) '拨打量'
,isnull(sum(l.dialon),0) '接通量'
,isnull(sum(case when s.clt_code is not null then s.effect else 0 end),0) '有效进程'
,isnull(sum(t.requireamount),0) '需求总额'
,isnull(sum(case when t.requireamount>0 then 1 else 0 end),0) '有需求客户数'
,case when count(distinct t.clt_code)=0 then 0 else isnull(sum(case when l.clt_code is not null then 1 else 0 end),0)*1./count(distinct t.clt_code) end '拨打率'
,case when isnull(sum(case when l.clt_code is not null then 1 else 0 end),0)=0 then 0 else isnull(sum(l.dialon),0)*1./isnull(sum(case when l.clt_code is not null then 1 else 0 end),0) end '接通率'
,case when isnull(sum(l.dialon),0)=0 then 0 else isnull(sum(case when s.clt_code is not null then s.effect else 0 end),0)*1./isnull(sum(l.dialon),0) end '转化率'
,case when isnull(sum(case when t.requireamount>0 then 1 else 0 end),0)=0 then 0 else isnull(sum(t.requireamount),0)*1./isnull(sum(case when t.requireamount>0 then 1 else 0 end),0) end '平均需求额'
from dfss_bi..TelemarketingDetail t
left join #calls l
on t.clt_code=l.clt_code
left join #status s
on t.clt_code=s.clt_code
where t.cltstatus<>1 and t.branch='苏州' and t.batchid in (341,342,348,351,352)

drop table #calls
drop table #status