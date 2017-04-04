/* 有效进程 */

select distinct st.cltcode clt_code
,case when st.afterexestatus in (1,2,3,4,5,6) then 1 else 0 end effect
into #status
from dfss_bi..customerexestatuschangehistoryid_combined st
where st.createtime between '2016-3-1' and '2016-3-31 23:59:59'  /* 日期按需求更改 */
group by st.cltcode,st.afterexestatus


/* 拨打情况 */

select distinct c.clt_code
,t.branch city
,case when t.importdate<'2016-3-1' then 0 else 1 end clt_type     /* 话单类型，1代表新话单，0代表老话单*/
,t.isgetthrough firstcall_dialon
,t.isenterprocess firstcall_effect
,case when isnull(sum(c.isgetthrough),0)>0 then 1 else 0 end dialon
,case when s.clt_code is not null then s.effect else 0 end effect
,t.requireamount rqr_amount
into #calls
from dfss_bi..calldetails c
left join dfss_bi..telemarketingdetail t
on c.clt_code=t.clt_code
left join #status s
on c.clt_code=s.clt_code
where c.calldate between '2016-3-1' and '2016-3-31 23:59:59' and t.cltstatus<>1 and t.importdate is not null and t.branch<>'合肥'
group by c.clt_code,t.branch,t.importdate,t.isgetthrough,isenterprocess,s.clt_code,s.effect,t.requireamount

/* 转化率及平均需求额 */

select l.city '分公司' 
,case when l.clt_type=1 then '新话单' else '老话单' end '话单类型'
,count(distinct l.clt_code) '拨打量'
,isnull(sum(case when l.clt_type=1 then l.firstcall_dialon else l.dialon end),0) '接通量'
,isnull(sum(case when l.clt_type=1 then l.firstcall_effect else l.effect end),0) '有效进程量'
,isnull(sum(case when l.rqr_amount is not null and l.rqr_amount>0 then l.rqr_amount else 0 end),0) '需求总额'
,isnull(sum(case when l.rqr_amount is not null and l.rqr_amount>0 then 1 else 0 end),0) '需求大于0客户数'
,case when isnull(sum(case when l.clt_type=1 then l.firstcall_dialon else l.dialon end),0)=0 then 0 else isnull(sum(case when l.clt_type=1 then l.firstcall_effect else l.effect end),0)*1./isnull(sum(case when l.clt_type=1 then l.firstcall_dialon else l.dialon end),0) end  '转化率'  /* 新话单为首拨转化率，老话单为有效转化率*/ 
,case when isnull(sum(case when l.rqr_amount is not null and l.rqr_amount>0 then 1 else 0 end),0)=0 then 0 else isnull(sum(case when l.rqr_amount is not null and l.rqr_amount>0 then l.rqr_amount else 0 end),0)*1./isnull(sum(case when l.rqr_amount is not null and l.rqr_amount>0 then 1 else 0 end),0) end '平均需求额'
from #calls l
group by l.city,case when l.clt_type=1 then '新话单' else '老话单' end

drop table #calls
drop table #status