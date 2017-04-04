/* 话单质量统计表(周二\四) */

/* 首次拨打日期 */

select e.clt_code clt_code
,e.firstcalldate firstcalldate
into #firstcall
from
(
select distinct   /* 广州 */  
a.clt_code clt_code
,d.firstcalldate firstcalldate
from dfss_guangzhou..sal_clt_base a
left join dfss_guangzhou..sal_clt_lnkman b
on a.clt_code=b.clt_code
left join
(
select distinct c.dst dst
,min(c.calldate) firstcalldate
from
(
select src,dst,billsec,calldate,userfield
from dfss_guangzhou..callbehaviorrealtime
union all
select src,dst,billsec,calldate,userfield
from dfss_guangzhou..callbehaviorrealtime_2015
) c
group by c.dst
) d
on b.lnk_mobile=d.dst
group by a.clt_code,d.firstcalldate

union all

select distinct  /* 成都 */
a.clt_code clt_code
,d.firstcalldate firstcalldate
from dfss_chengdu..sal_clt_base a
left join dfss_chengdu..sal_clt_lnkman b
on a.clt_code=b.clt_code
left join
(
select distinct c.dst dst
,min(c.calldate) firstcalldate
from
(
select src,dst,billsec,calldate,userfield
from dfss_chengdu..callbehaviorrealtime
union all
select src,dst,billsec,calldate,userfield
from dfss_chengdu..callbehaviorrealtime_2015
) c
group by c.dst
) d
on b.lnk_mobile=d.dst
group by a.clt_code,d.firstcalldate

union all

select distinct   /* 杭州 */
a.clt_code clt_code
,d.firstcalldate firstcalldate
from dfss_hangzhou..sal_clt_base a
left join dfss_hangzhou..sal_clt_lnkman b
on a.clt_code=b.clt_code
left join
(
select distinct c.dst dst
,min(c.calldate) firstcalldate
from
(
select src,dst,billsec,calldate,userfield
from dfss_hangzhou..callbehaviorrealtime
union all
select src,dst,billsec,calldate,userfield
from dfss_hangzhou..callbehaviorrealtime_2015
) c
group by c.dst
) d
on b.lnk_mobile=d.dst
group by a.clt_code,d.firstcalldate

union all

select distinct   /* 南京 */
a.clt_code clt_code
,d.firstcalldate firstcalldate
from dfss_nanjing..sal_clt_base a
left join dfss_nanjing..sal_clt_lnkman b
on a.clt_code=b.clt_code
left join
(
select distinct c.dst dst
,min(c.calldate) firstcalldate
from
(
select src,dst,billsec,calldate,userfield
from dfss_nanjing..callbehaviorrealtime
union all
select src,dst,billsec,calldate,userfield
from dfss_nanjing..callbehaviorrealtime_2015
) c
group by c.dst
) d
on b.lnk_mobile=d.dst
group by a.clt_code,d.firstcalldate

union all

select distinct		/* 宁波 */
a.clt_code clt_code
,d.firstcalldate firstcalldate
from dfss_ningbo..sal_clt_base a
left join dfss_ningbo..sal_clt_lnkman b
on a.clt_code=b.clt_code
left join
(
select distinct c.dst dst
,min(c.calldate) firstcalldate
from
(
select src,dst,billsec,calldate,userfield
from dfss_ningbo..callbehaviorrealtime
union all
select src,dst,billsec,calldate,userfield
from dfss_ningbo..callbehaviorrealtime_2015
) c
group by c.dst
) d
on b.lnk_mobile=d.dst
group by a.clt_code,d.firstcalldate

union all

select distinct		/* 青岛 */
a.clt_code clt_code
,d.firstcalldate firstcalldate
from dfss_qingdao..sal_clt_base a
left join dfss_qingdao..sal_clt_lnkman b
on a.clt_code=b.clt_code
left join
(
select distinct c.dst dst
,min(c.calldate) firstcalldate
from
(
select src,dst,billsec,calldate,userfield
from dfss_qingdao..callbehaviorrealtime
union all
select src,dst,billsec,calldate,userfield
from dfss_qingdao..callbehaviorrealtime_2015
) c
group by c.dst
) d
on b.lnk_mobile=d.dst
group by a.clt_code,d.firstcalldate

union all

select distinct		/* 上海 */
a.clt_code clt_code
,d.firstcalldate firstcalldate
from dfss_shanghai..sal_clt_base a
left join dfss_shanghai..sal_clt_lnkman b
on a.clt_code=b.clt_code
left join
(
select distinct c.dst dst
,min(c.calldate) firstcalldate
from
(
select src,dst,billsec,calldate,userfield
from dfss_shanghai..callbehaviorrealtime
union all
select src,dst,billsec,calldate,userfield
from dfss_shanghai..callbehaviorrealtime_2015
) c
group by c.dst
) d
on b.lnk_mobile=d.dst
group by a.clt_code,d.firstcalldate

union all

select distinct		/* 深圳 */
a.clt_code clt_code
,d.firstcalldate firstcalldate
from dfss_shenzhen..sal_clt_base a
left join dfss_shenzhen..sal_clt_lnkman b
on a.clt_code=b.clt_code
left join
(
select distinct c.dst dst
,min(c.calldate) firstcalldate
from
(
select src,dst,billsec,calldate,userfield
from dfss_shenzhen..callbehaviorrealtime
union all
select src,dst,billsec,calldate,userfield
from dfss_shenzhen..callbehaviorrealtime_2015
) c
group by c.dst
) d
on b.lnk_mobile=d.dst
group by a.clt_code,d.firstcalldate

union all

select distinct		/* 苏州 */
a.clt_code clt_code
,d.firstcalldate firstcalldate
from dfss_suzhou..sal_clt_base a
left join dfss_suzhou..sal_clt_lnkman b
on a.clt_code=b.clt_code
left join
(
select distinct c.dst dst
,min(c.calldate) firstcalldate
from
(
select src,dst,billsec,calldate,userfield
from dfss_suzhou..callbehaviorrealtime
union all
select src,dst,billsec,calldate,userfield
from dfss_suzhou..callbehaviorrealtime_2015
) c
group by c.dst
) d
on b.lnk_mobile=d.dst
group by a.clt_code,d.firstcalldate

union all

select distinct		/* 无锡 */
a.clt_code clt_code
,d.firstcalldate firstcalldate
from dfss_wuxi..sal_clt_base a
left join dfss_wuxi..sal_clt_lnkman b
on a.clt_code=b.clt_code
left join
(
select distinct c.dst dst
,min(c.calldate) firstcalldate
from
(
select src,dst,billsec,calldate,userfield
from dfss_wuxi..callbehaviorrealtime
union all
select src,dst,billsec,calldate,userfield
from dfss_wuxi..callbehaviorrealtime_2015
) c
group by c.dst
) d
on b.lnk_mobile=d.dst
group by a.clt_code,d.firstcalldate
) e
left join dfss_bi..telemarketingdetail t
on e.clt_code=t.clt_code
where t.cltstatus<>1
group by e.clt_code,e.firstcalldate


/* n天拨打量 */
select p.batch
,isnull(sum(p.call_15),0) 'call_15days'
,isnull(sum(p.call_30),0) 'call_30days'
,isnull(sum(p.call_45),0) 'call_45days'
,isnull(sum(p.call_60),0) 'call_60days'
,isnull(sum(p.call_total_15),0) 'call_total_15days'
,isnull(sum(p.call_total_30),0) 'call_total_30days'
,isnull(sum(p.call_total_45),0) 'call_total_45days'
,isnull(sum(p.call_total_60),0) 'call_total_60days'
into #n_day_call
from 
(
select distinct
t.clt_code clt_code
,t.batch batch
,isnull(case when datediff(d,t.importdate,h.firstcalldate)<=15 then 1 else 0 end,0) 'call_15'  /* 拨打量 */
,isnull(case when datediff(d,t.importdate,h.firstcalldate)<=30 then 1 else 0 end,0) 'call_30'
,isnull(case when datediff(d,t.importdate,h.firstcalldate)<=45 then 1 else 0 end,0) 'call_45'
,isnull(case when datediff(d,t.importdate,h.firstcalldate)<=60 then 1 else 0 end,0) 'call_60'
,isnull(sum(case when datediff(d,t.importdate,c.calldate)<=15 then 1 else 0 end),0) 'call_total_15'  /* 拨打次数 */
,isnull(sum(case when datediff(d,t.importdate,c.calldate)<=30 then 1 else 0 end),0) 'call_total_30'
,isnull(sum(case when datediff(d,t.importdate,c.calldate)<=45 then 1 else 0 end),0) 'call_total_45' 
,isnull(sum(case when datediff(d,t.importdate,c.calldate)<=60 then 1 else 0 end),0) 'call_total_60'
from 
(
select batch,clt_code,calldate,billsecond,isgetthrough from dfss_bi..calldetails
union all
select batch,clt_code,calldate,billsecond,isgetthrough from dfss_bi..calldetails_2015
) c
inner join dfss_bi..telemarketingdetail t
on c.clt_code=t.clt_code
left join #firstcall h
on c.clt_code=h.clt_code
where t.cltstatus<>1 and t.importdate>='2015-1-1'
group by t.clt_code,t.batch,t.importdate,h.firstcalldate
) p
group by p.batch

/* 60天业绩 */
 select j.batch batch
,isnull(sum(j.fee_15),0) 'servicetotal_15days'
,isnull(sum(j.fee_30),0) 'servicetotal_30days'
,isnull(sum(j.fee_45),0) 'servicetotal_45days'
,isnull(sum(j.fee_60),0) 'servicetotal_60days'
,isnull(sum(j.fee_total),0) 'servicetotal'
into #fee
from(
 select t.clt_code clt_code
 ,t.batch batch
 ,isnull(sum(case when datediff(d,t.importdate,dr.dealtime)<=15 then dr.thisserviceamount else 0 end),0) fee_15
 ,isnull(sum(case when datediff(d,t.importdate,dr.dealtime)<=30 then dr.thisserviceamount else 0 end),0) fee_30
 ,isnull(sum(case when datediff(d,t.importdate,dr.dealtime)<=45 then dr.thisserviceamount else 0 end),0) fee_45
 ,isnull(sum(case when datediff(d,t.importdate,dr.dealtime)<=60 then dr.thisserviceamount else 0 end),0) fee_60
 ,isnull(sum(dr.thisserviceamount),0) fee_total
 from dfssmng..dataresults dr
 inner join dfss_bi..cltcontract ct
 on dr.contractcode=ct.contractcode
 inner join dfss_bi..telemarketingdetail t
 on ct.clt_code=t.clt_code
 where t.cltstatus<>1 and t.importdate>='2015-1-1'
 group by t.clt_code,t.batch
 ) j
 group by j.batch

 /* 有效进程需求额 */
select m.clt_code clt_code
,m.rqr_amount rqr_amount
into #rqr
from
(
select  aa.clt_code clt_code,case when ab.rqr_amount>200 then 200 else ab.rqr_amount end rqr_amount				
from (						
 select (select top 1 billsec from dfss_guangzhou.dbo.callbehaviorrealtime (nolock) where dst=lnk_mobile order by calldate) billsec,a.clt_code						
,clt_status						
from dfss_guangzhou.dbo.sal_clt_base a (nolock)						
left join dfss_guangzhou.dbo.sal_clt_lnkman b  with(nolock) on a.clt_code = b.clt_code						
) aa 						
inner join 						
(						
select t.clt_code,d.rqr_amount						
from						
(						
select  s.clt_code ,min(s.rqr_id) min_rqr_id						
from dfss_guangzhou.dbo.sal_clt_require  s  with(nolock)  						
group by s.clt_code						
) t						
inner join  dfss_guangzhou.dbo.sal_clt_require  d  with(nolock)  on t.min_rqr_id=d.rqr_id) ab on aa.clt_code=ab.clt_code												
where isnull(aa.billsec,0)>0  and 						
(select count(1) from dfss_guangzhou.dbo.customerexestatuschangehistoryid (nolock) 						
where cltcode=aa.clt_code and preexestatus=10 and afterexestatus in (1,2,3,4,5,6))>0 	

union all

select  aa.clt_code clt_code,case when ab.rqr_amount>200 then 200 else ab.rqr_amount end rqr_amount				
from (						
 select (select top 1 billsec from dfss_chengdu.dbo.callbehaviorrealtime (nolock) where dst=lnk_mobile order by calldate) billsec,a.clt_code						
,clt_status						
from dfss_chengdu.dbo.sal_clt_base a (nolock)						
left join dfss_chengdu.dbo.sal_clt_lnkman b  with(nolock) on a.clt_code = b.clt_code						
) aa 						
inner join 						
(						
select t.clt_code,d.rqr_amount						
from						
(						
select  s.clt_code ,min(s.rqr_id) min_rqr_id						
from dfss_chengdu.dbo.sal_clt_require  s  with(nolock)  						
group by s.clt_code						
) t						
inner join  dfss_chengdu.dbo.sal_clt_require  d  with(nolock)  on t.min_rqr_id=d.rqr_id) ab on aa.clt_code=ab.clt_code												
where isnull(aa.billsec,0)>0  and 						
(select count(1) from dfss_chengdu.dbo.customerexestatuschangehistoryid (nolock) 						
where cltcode=aa.clt_code and preexestatus=10 and afterexestatus in (1,2,3,4,5,6))>0

union all

select  aa.clt_code clt_code,case when ab.rqr_amount>200 then 200 else ab.rqr_amount end rqr_amount				
from (						
 select (select top 1 billsec from dfss_hangzhou.dbo.callbehaviorrealtime (nolock) where dst=lnk_mobile order by calldate) billsec,a.clt_code						
,clt_status						
from dfss_hangzhou.dbo.sal_clt_base a (nolock)						
left join dfss_hangzhou.dbo.sal_clt_lnkman b  with(nolock) on a.clt_code = b.clt_code						
) aa 						
inner join 						
(						
select t.clt_code,d.rqr_amount						
from						
(						
select  s.clt_code ,min(s.rqr_id) min_rqr_id						
from dfss_hangzhou.dbo.sal_clt_require  s  with(nolock)  						
group by s.clt_code						
) t						
inner join  dfss_hangzhou.dbo.sal_clt_require  d  with(nolock)  on t.min_rqr_id=d.rqr_id) ab on aa.clt_code=ab.clt_code												
where isnull(aa.billsec,0)>0  and 						
(select count(1) from dfss_hangzhou.dbo.customerexestatuschangehistoryid (nolock) 						
where cltcode=aa.clt_code and preexestatus=10 and afterexestatus in (1,2,3,4,5,6))>0

union all

select  aa.clt_code clt_code,case when ab.rqr_amount>200 then 200 else ab.rqr_amount end rqr_amount				
from (						
 select (select top 1 billsec from dfss_nanjing.dbo.callbehaviorrealtime (nolock) where dst=lnk_mobile order by calldate) billsec,a.clt_code						
,clt_status						
from dfss_nanjing.dbo.sal_clt_base a (nolock)						
left join dfss_nanjing.dbo.sal_clt_lnkman b  with(nolock) on a.clt_code = b.clt_code						
) aa 						
inner join 						
(						
select t.clt_code,d.rqr_amount						
from						
(						
select  s.clt_code ,min(s.rqr_id) min_rqr_id						
from dfss_nanjing.dbo.sal_clt_require  s  with(nolock)  						
group by s.clt_code						
) t						
inner join  dfss_nanjing.dbo.sal_clt_require  d  with(nolock)  on t.min_rqr_id=d.rqr_id) ab on aa.clt_code=ab.clt_code												
where isnull(aa.billsec,0)>0  and 						
(select count(1) from dfss_nanjing.dbo.customerexestatuschangehistoryid (nolock) 						
where cltcode=aa.clt_code and preexestatus=10 and afterexestatus in (1,2,3,4,5,6))>0	

union all

select  aa.clt_code clt_code,case when ab.rqr_amount>200 then 200 else ab.rqr_amount end rqr_amount				
from (						
 select (select top 1 billsec from dfss_ningbo.dbo.callbehaviorrealtime (nolock) where dst=lnk_mobile order by calldate) billsec,a.clt_code						
,clt_status						
from dfss_ningbo.dbo.sal_clt_base a (nolock)						
left join dfss_ningbo.dbo.sal_clt_lnkman b  with(nolock) on a.clt_code = b.clt_code						
) aa 						
inner join 						
(						
select t.clt_code,d.rqr_amount						
from						
(						
select  s.clt_code ,min(s.rqr_id) min_rqr_id						
from dfss_ningbo.dbo.sal_clt_require  s  with(nolock)  						
group by s.clt_code						
) t						
inner join  dfss_ningbo.dbo.sal_clt_require  d  with(nolock)  on t.min_rqr_id=d.rqr_id) ab on aa.clt_code=ab.clt_code												
where isnull(aa.billsec,0)>0  and 						
(select count(1) from dfss_ningbo.dbo.customerexestatuschangehistoryid (nolock) 						
where cltcode=aa.clt_code and preexestatus=10 and afterexestatus in (1,2,3,4,5,6))>0	

union all

select  aa.clt_code clt_code,case when ab.rqr_amount>200 then 200 else ab.rqr_amount end rqr_amount				
from (						
 select (select top 1 billsec from dfss_qingdao.dbo.callbehaviorrealtime (nolock) where dst=lnk_mobile order by calldate) billsec,a.clt_code						
,clt_status						
from dfss_qingdao.dbo.sal_clt_base a (nolock)						
left join dfss_qingdao.dbo.sal_clt_lnkman b  with(nolock) on a.clt_code = b.clt_code						
) aa 						
inner join 						
(						
select t.clt_code,d.rqr_amount						
from						
(						
select  s.clt_code ,min(s.rqr_id) min_rqr_id						
from dfss_qingdao.dbo.sal_clt_require  s  with(nolock)  						
group by s.clt_code						
) t						
inner join  dfss_qingdao.dbo.sal_clt_require  d  with(nolock)  on t.min_rqr_id=d.rqr_id) ab on aa.clt_code=ab.clt_code												
where isnull(aa.billsec,0)>0  and 						
(select count(1) from dfss_qingdao.dbo.customerexestatuschangehistoryid (nolock) 						
where cltcode=aa.clt_code and preexestatus=10 and afterexestatus in (1,2,3,4,5,6))>0

union all

select  aa.clt_code clt_code,case when ab.rqr_amount>200 then 200 else ab.rqr_amount end rqr_amount				
from (						
 select (select top 1 billsec from dfss_shanghai.dbo.callbehaviorrealtime (nolock) where dst=lnk_mobile order by calldate) billsec,a.clt_code						
,clt_status						
from dfss_shanghai.dbo.sal_clt_base a (nolock)						
left join dfss_shanghai.dbo.sal_clt_lnkman b  with(nolock) on a.clt_code = b.clt_code						
) aa 						
inner join 						
(						
select t.clt_code,d.rqr_amount						
from						
(						
select  s.clt_code ,min(s.rqr_id) min_rqr_id						
from dfss_shanghai.dbo.sal_clt_require  s  with(nolock)  						
group by s.clt_code						
) t						
inner join  dfss_shanghai.dbo.sal_clt_require  d  with(nolock)  on t.min_rqr_id=d.rqr_id) ab on aa.clt_code=ab.clt_code												
where isnull(aa.billsec,0)>0  and 						
(select count(1) from dfss_shanghai.dbo.customerexestatuschangehistoryid (nolock) 						
where cltcode=aa.clt_code and preexestatus=10 and afterexestatus in (1,2,3,4,5,6))>0	

union all

select  aa.clt_code clt_code,case when ab.rqr_amount>200 then 200 else ab.rqr_amount end rqr_amount				
from (						
 select (select top 1 billsec from dfss_shenzhen.dbo.callbehaviorrealtime (nolock) where dst=lnk_mobile order by calldate) billsec,a.clt_code						
,clt_status						
from dfss_shenzhen.dbo.sal_clt_base a (nolock)						
left join dfss_shenzhen.dbo.sal_clt_lnkman b  with(nolock) on a.clt_code = b.clt_code						
) aa 						
inner join 						
(						
select t.clt_code,d.rqr_amount						
from						
(						
select  s.clt_code ,min(s.rqr_id) min_rqr_id						
from dfss_shenzhen.dbo.sal_clt_require  s  with(nolock)  						
group by s.clt_code						
) t						
inner join  dfss_shenzhen.dbo.sal_clt_require  d  with(nolock)  on t.min_rqr_id=d.rqr_id) ab on aa.clt_code=ab.clt_code												
where isnull(aa.billsec,0)>0  and 						
(select count(1) from dfss_shenzhen.dbo.customerexestatuschangehistoryid (nolock) 						
where cltcode=aa.clt_code and preexestatus=10 and afterexestatus in (1,2,3,4,5,6))>0		

union all

select  aa.clt_code clt_code,case when ab.rqr_amount>200 then 200 else ab.rqr_amount end rqr_amount				
from (						
 select (select top 1 billsec from dfss_suzhou.dbo.callbehaviorrealtime (nolock) where dst=lnk_mobile order by calldate) billsec,a.clt_code						
,clt_status						
from dfss_suzhou.dbo.sal_clt_base a (nolock)						
left join dfss_suzhou.dbo.sal_clt_lnkman b  with(nolock) on a.clt_code = b.clt_code						
) aa 						
inner join 						
(						
select t.clt_code,d.rqr_amount						
from						
(						
select  s.clt_code ,min(s.rqr_id) min_rqr_id						
from dfss_suzhou.dbo.sal_clt_require  s  with(nolock)  						
group by s.clt_code						
) t						
inner join  dfss_suzhou.dbo.sal_clt_require  d  with(nolock)  on t.min_rqr_id=d.rqr_id) ab on aa.clt_code=ab.clt_code												
where isnull(aa.billsec,0)>0  and 						
(select count(1) from dfss_suzhou.dbo.customerexestatuschangehistoryid (nolock) 						
where cltcode=aa.clt_code and preexestatus=10 and afterexestatus in (1,2,3,4,5,6))>0				

union all

select  aa.clt_code clt_code,case when ab.rqr_amount>200 then 200 else ab.rqr_amount end rqr_amount				
from (						
 select (select top 1 billsec from dfss_wuxi.dbo.callbehaviorrealtime (nolock) where dst=lnk_mobile order by calldate) billsec,a.clt_code						
,clt_status						
from dfss_wuxi.dbo.sal_clt_base a (nolock)						
left join dfss_wuxi.dbo.sal_clt_lnkman b  with(nolock) on a.clt_code = b.clt_code						
) aa 						
inner join 						
(						
select t.clt_code,d.rqr_amount						
from						
(						
select  s.clt_code ,min(s.rqr_id) min_rqr_id						
from dfss_wuxi.dbo.sal_clt_require  s  with(nolock)  						
group by s.clt_code						
) t						
inner join  dfss_wuxi.dbo.sal_clt_require  d  with(nolock)  on t.min_rqr_id=d.rqr_id) ab on aa.clt_code=ab.clt_code												
where isnull(aa.billsec,0)>0  and 						
(select count(1) from dfss_wuxi.dbo.customerexestatuschangehistoryid (nolock) 						
where cltcode=aa.clt_code and preexestatus=10 and afterexestatus in (1,2,3,4,5,6))>0
) m
group by m.clt_code,m.rqr_amount

/* 指标 */
select b.importdate '导入日期'
,b.batch '文件'
,b.branch '分公司'
,b.channel '渠道'
,b.cost '购买总价'
,b.price '购买单价'
,b.batchcnt '购买数量'
,isnull(ceiling(b.batchcnt*1./10000),0)*10 '清洗费用'
,isnull(b.batchcnt-b.importcnt,0) '清洗话单量'
,b.importcnt '清洗剩余量'
,b.successcnt '成功入库量'
,isnull(sum(case when h.firstcalldate is not null then 1 else 0 end),0) '已拨打话单量'
,isnull(sum(t.isgetthrough),0) '首拨接通话单量'
,isnull(sum(t.isenterprocess),0) '首拨有效进程话单量'
,isnull(sum(case when n.rqr_amount is not null then n.rqr_amount else 0 end),0)  '首拨有效进程需求总额'
,isnull(sum(case when n.rqr_amount is not null then 1 else 0 end),0) '首拨有需求客户数'
,isnull(x.servicetotal_15days,0) '15天业绩'
,isnull(x.servicetotal_30days,0) '30天业绩'
,isnull(x.servicetotal_45days,0) '45天业绩'
,isnull(x.servicetotal_60days,0) '60天业绩'
,isnull(x.servicetotal,0) '累计业绩'
,isnull(y.call_15days,0) '15天拨打量'
,isnull(y.call_30days,0) '30天拨打量'
,isnull(y.call_45days,0) '45天拨打量'
,isnull(y.call_60days,0) '60天拨打量'
,isnull(y.call_total_15days,0) '15天拨打次数'
,isnull(y.call_total_30days,0) '30天拨打次数'
,isnull(y.call_total_45days,0) '45天拨打次数'
,isnull(y.call_total_60days,0) '60天拨打次数'
,datediff(d,b.importdate,getdate()-1) '入库天数'
,case when b.batchcnt=0 then 0 else b.importcnt*1./b.batchcnt end '清洗剩余率'
,case when b.batchcnt=0 then 0 else b.successcnt*1./b.batchcnt end '入库率'
,case when b.importcnt=0 then 0 else isnull(sum(case when h.firstcalldate is not null then 1 else 0 end),0)*1./b.importcnt end '拨打率'
,case when isnull(sum(case when h.firstcalldate is not null then 1 else 0 end),0)=0 then 0 else isnull(sum(t.isgetthrough),0)*1./isnull(sum(case when h.firstcalldate is not null then 1 else 0 end),0) end '首拨接通率'
,case when isnull(sum(t.isgetthrough),0)=0 then 0 else isnull(sum(t.isenterprocess),0)*1./isnull(sum(t.isgetthrough),0) end '首拨转化率'
,case when isnull(sum(t.isenterprocess),0)=0 then 0 else isnull(sum(case when n.rqr_amount is not null then n.rqr_amount else 0 end),0)*1./isnull(sum(t.isenterprocess),0) end '平均需求额'
,case when (b.cost+b.batchcnt*2+isnull(ceiling(b.batchcnt*1./10000),0)*10)=0 then 0 else (b.batchcnt*(case when b.batchcnt=0 then 0 else b.importcnt*1./b.batchcnt end)*(case when isnull(sum(case when h.firstcalldate is not null then 1 else 0 end),0)=0 then 0 else isnull(sum(t.isgetthrough),0)*1./isnull(sum(case when h.firstcalldate is not null then 1 else 0 end),0) end)*(case when isnull(sum(t.isgetthrough),0)=0 then 0 else isnull(sum(t.isenterprocess),0)*1./isnull(sum(t.isgetthrough),0) end)*(case when isnull(sum(t.isenterprocess),0)=0 then 0 else isnull(sum(case when n.rqr_amount is not null then n.rqr_amount else 0 end),0)*1./isnull(sum(t.isenterprocess),0) end))*(248/10)*1./(b.cost+b.batchcnt*2+ceiling(b.batchcnt*1./10000)*10) end  '首拨需求投产比'
,case when (b.cost+b.batchcnt*2+isnull(ceiling(b.batchcnt*1./10000),0)*10)=0 then 0 else isnull(x.servicetotal_15days,0)*1./(b.cost+b.batchcnt*2+isnull(ceiling(b.batchcnt*1./10000),0)*10) end '15天业绩投产比'
,case when (b.cost+b.batchcnt*2+isnull(ceiling(b.batchcnt*1./10000),0)*10)=0 then 0 else isnull(x.servicetotal_30days,0)*1./(b.cost+b.batchcnt*2+isnull(ceiling(b.batchcnt*1./10000),0)*10) end '30天业绩投产比'
,case when (b.cost+b.batchcnt*2+isnull(ceiling(b.batchcnt*1./10000),0)*10)=0 then 0 else isnull(x.servicetotal_45days,0)*1./(b.cost+b.batchcnt*2+isnull(ceiling(b.batchcnt*1./10000),0)*10) end '45天业绩投产比'
,case when (b.cost+b.batchcnt*2+isnull(ceiling(b.batchcnt*1./10000),0)*10)=0 then 0 else isnull(x.servicetotal_60days,0)*1./(b.cost+b.batchcnt*2+isnull(ceiling(b.batchcnt*1./10000),0)*10) end '60天业绩投产比'
,case when isnull(y.call_15days,0)=0 then 0 else ((case when b.batchcnt=0 then 0 else b.importcnt*1./b.batchcnt end)*isnull(x.servicetotal_15days,0)-isnull(y.call_15days,0)*b.price-isnull(y.call_total_15days,0)*2)*1./isnull(y.call_15days,0) end '15天单位话单业绩利润'
,case when isnull(y.call_30days,0)=0 then 0 else ((case when b.batchcnt=0 then 0 else b.importcnt*1./b.batchcnt end)*isnull(x.servicetotal_30days,0)-isnull(y.call_30days,0)*b.price-isnull(y.call_total_30days,0)*2)*1./isnull(y.call_30days,0) end '30天单位话单业绩利润'
,case when isnull(y.call_45days,0)=0 then 0 else ((case when b.batchcnt=0 then 0 else b.importcnt*1./b.batchcnt end)*isnull(x.servicetotal_45days,0)-isnull(y.call_45days,0)*b.price-isnull(y.call_total_45days,0)*2)*1./isnull(y.call_45days,0) end '45天单位话单业绩利润'
,case when isnull(y.call_60days,0)=0 then 0 else ((case when b.batchcnt=0 then 0 else b.importcnt*1./b.batchcnt end)*isnull(x.servicetotal_60days,0)-isnull(y.call_60days,0)*b.price-isnull(y.call_total_60days,0)*2)*1./isnull(y.call_60days,0) end '60天单位话单业绩利润'
,b.channelid 渠道编号
from dfss_bi..batchinfo b
 
left join dfss_bi..telemarketingdetail t
on b.batch=t.batch

left join #n_day_call y
on b.batch=y.batch

left join #fee x
on b.batch=x.batch

left join #rqr n
on t.clt_code=n.clt_code

left join #firstcall h
on t.clt_code=h.clt_code

where b.importdate>='2016-1-1'
group by b.importdate,b.batch,b.branch,b.channel,b.cost,b.price,b.batchcnt,b.importcnt,b.successcnt,x.servicetotal_15days,x.servicetotal_30days,x.servicetotal_45days,x.servicetotal_60days,x.servicetotal,y.call_15days,y.call_30days,y.call_45days,y.call_60days,y.call_total_15days,y.call_total_30days,y.call_total_45days,y.call_total_60days,b.channelid
order by b.importdate desc

drop table #n_day_call
drop table #fee
drop table #rqr
drop table #firstcall