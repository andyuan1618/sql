/* 话单质量统计表(周二\四) */

/* 市场话单 */
select distinct
u.branch branch
,u.clt_code clt_code
,u.importdate importdate  -- userinfo中的importdate系分配日期
into #clt
from dfss_bi..userinfo u
where u.fromwebsite='市场' and u.importdate>='2015-1-1' and u.branch in ('成都','广州','杭州','南京','宁波','青岛','上海','深圳','苏州','')
group by u.branch,u.clt_code,u.importdate


/* 首次拨打日期 */
select distinct
k.clt_code clt_code
,c.calldate firstcalldate
,case when isnull(c.billsec,0)>0 then 1 else 0 end dialon
,case when isnull(c.billsec,0)>0 and i.cltcode is not null then 1 else 0 end effect
into #firstcall
from
(
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_guangzhou..callbehaviorrealtime
union all
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_guangzhou..callbehaviorrealtime_2015
) c
inner join
(
select c.dst dst,min(c.callbehaviorrealtimeid) min_id
from
(
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_guangzhou..callbehaviorrealtime
union all
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_guangzhou..callbehaviorrealtime_2015
) c
group by c.dst
)c1
on c.callbehaviorrealtimeid=c1.min_id
right join dfss_guangzhou..sal_clt_lnkman k
on c.dst=k.lnk_mobile
left join 
(
select distinct cltcode
from dfss_guangzhou.dbo.customerexestatuschangehistoryid
where preexestatus=10 and afterexestatus in (1,2,3,4,5,6)
) i
on k.clt_code=i.cltcode
left join dfss_bi..userinfo u
on k.clt_code=u.clt_code
where u.FromWebsite='市场'
group by k.clt_code,c.calldate,c.billsec,i.cltcode

union all

select distinct
k.clt_code clt_code
,c.calldate firstcalldate
,case when isnull(c.billsec,0)>0 then 1 else 0 end dialon
,case when isnull(c.billsec,0)>0 and i.cltcode is not null then 1 else 0 end effect
from
(
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_chengdu..callbehaviorrealtime
union all
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_chengdu..callbehaviorrealtime_2015
) c
inner join
(
select c.dst dst,min(c.callbehaviorrealtimeid) min_id
from
(
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_chengdu..callbehaviorrealtime
union all
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_chengdu..callbehaviorrealtime_2015
) c
group by c.dst
)c1
on c.callbehaviorrealtimeid=c1.min_id
right join dfss_chengdu..sal_clt_lnkman k
on c.dst=k.lnk_mobile
left join 
(
select distinct cltcode
from dfss_chengdu.dbo.customerexestatuschangehistoryid
where preexestatus=10 and afterexestatus in (1,2,3,4,5,6)
) i
on k.clt_code=i.cltcode
left join dfss_bi..userinfo u
on k.clt_code=u.clt_code
where u.FromWebsite='市场'
group by k.clt_code,c.calldate,c.billsec,i.cltcode

union all

select distinct
k.clt_code clt_code
,c.calldate firstcalldate
,case when isnull(c.billsec,0)>0 then 1 else 0 end dialon
,case when isnull(c.billsec,0)>0 and i.cltcode is not null then 1 else 0 end effect
from
(
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_hangzhou..callbehaviorrealtime
union all
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_hangzhou..callbehaviorrealtime_2015
) c
inner join
(
select c.dst dst,min(c.callbehaviorrealtimeid) min_id
from
(
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_hangzhou..callbehaviorrealtime
union all
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_hangzhou..callbehaviorrealtime_2015
) c
group by c.dst
)c1
on c.callbehaviorrealtimeid=c1.min_id
right join dfss_hangzhou..sal_clt_lnkman k
on c.dst=k.lnk_mobile
left join 
(
select distinct cltcode
from dfss_hangzhou.dbo.customerexestatuschangehistoryid
where preexestatus=10 and afterexestatus in (1,2,3,4,5,6)
) i
on k.clt_code=i.cltcode
left join dfss_bi..userinfo u
on k.clt_code=u.clt_code
where u.FromWebsite='市场'
group by k.clt_code,c.calldate,c.billsec,i.cltcode

union all

select distinct
k.clt_code clt_code
,c.calldate firstcalldate
,case when isnull(c.billsec,0)>0 then 1 else 0 end dialon
,case when isnull(c.billsec,0)>0 and i.cltcode is not null then 1 else 0 end effect
from
(
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_ningbo..callbehaviorrealtime
union all
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_ningbo..callbehaviorrealtime_2015
) c
inner join
(
select c.dst dst,min(c.callbehaviorrealtimeid) min_id
from
(
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_ningbo..callbehaviorrealtime
union all
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_ningbo..callbehaviorrealtime_2015
) c
group by c.dst
)c1
on c.callbehaviorrealtimeid=c1.min_id
right join dfss_ningbo..sal_clt_lnkman k
on c.dst=k.lnk_mobile
left join 
(
select distinct cltcode
from dfss_ningbo.dbo.customerexestatuschangehistoryid
where preexestatus=10 and afterexestatus in (1,2,3,4,5,6)
) i
on k.clt_code=i.cltcode
left join dfss_bi..userinfo u
on k.clt_code=u.clt_code
where u.FromWebsite='市场'
group by k.clt_code,c.calldate,c.billsec,i.cltcode

union all

select distinct
k.clt_code clt_code
,c.calldate firstcalldate
,case when isnull(c.billsec,0)>0 then 1 else 0 end dialon
,case when isnull(c.billsec,0)>0 and i.cltcode is not null then 1 else 0 end effect
from
(
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_nanjing..callbehaviorrealtime
union all
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_nanjing..callbehaviorrealtime_2015
) c
inner join
(
select c.dst dst,min(c.callbehaviorrealtimeid) min_id
from
(
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_nanjing..callbehaviorrealtime
union all
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_nanjing..callbehaviorrealtime_2015
) c
group by c.dst
)c1
on c.callbehaviorrealtimeid=c1.min_id
right join dfss_nanjing..sal_clt_lnkman k
on c.dst=k.lnk_mobile
left join 
(
select distinct cltcode
from dfss_nanjing.dbo.customerexestatuschangehistoryid
where preexestatus=10 and afterexestatus in (1,2,3,4,5,6)
) i
on k.clt_code=i.cltcode
left join dfss_bi..userinfo u
on k.clt_code=u.clt_code
where u.FromWebsite='市场'
group by k.clt_code,c.calldate,c.billsec,i.cltcode

union all

select distinct
k.clt_code clt_code
,c.calldate firstcalldate
,case when isnull(c.billsec,0)>0 then 1 else 0 end dialon
,case when isnull(c.billsec,0)>0 and i.cltcode is not null then 1 else 0 end effect
from
(
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_qingdao..callbehaviorrealtime
union all
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_qingdao..callbehaviorrealtime_2015
) c
inner join
(
select c.dst dst,min(c.callbehaviorrealtimeid) min_id
from
(
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_qingdao..callbehaviorrealtime
union all
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_qingdao..callbehaviorrealtime_2015
) c
group by c.dst
)c1
on c.callbehaviorrealtimeid=c1.min_id
right join dfss_qingdao..sal_clt_lnkman k
on c.dst=k.lnk_mobile
left join 
(
select distinct cltcode
from dfss_qingdao.dbo.customerexestatuschangehistoryid
where preexestatus=10 and afterexestatus in (1,2,3,4,5,6)
) i
on k.clt_code=i.cltcode
left join dfss_bi..userinfo u
on k.clt_code=u.clt_code
where u.FromWebsite='市场'
group by k.clt_code,c.calldate,c.billsec,i.cltcode

union all

select distinct
k.clt_code clt_code
,c.calldate firstcalldate
,case when isnull(c.billsec,0)>0 then 1 else 0 end dialon
,case when isnull(c.billsec,0)>0 and i.cltcode is not null then 1 else 0 end effect
from
(
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_shenzhen..callbehaviorrealtime
union all
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_shenzhen..callbehaviorrealtime_2015
) c
inner join
(
select c.dst dst,min(c.callbehaviorrealtimeid) min_id
from
(
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_shenzhen..callbehaviorrealtime
union all
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_shenzhen..callbehaviorrealtime_2015
) c
group by c.dst
)c1
on c.callbehaviorrealtimeid=c1.min_id
right join dfss_shenzhen..sal_clt_lnkman k
on c.dst=k.lnk_mobile
left join 
(
select distinct cltcode
from dfss_shenzhen.dbo.customerexestatuschangehistoryid
where preexestatus=10 and afterexestatus in (1,2,3,4,5,6)
) i
on k.clt_code=i.cltcode
left join dfss_bi..userinfo u
on k.clt_code=u.clt_code
where u.FromWebsite='市场'
group by k.clt_code,c.calldate,c.billsec,i.cltcode

union all

select distinct
k.clt_code clt_code
,c.calldate firstcalldate
,case when isnull(c.billsec,0)>0 then 1 else 0 end dialon
,case when isnull(c.billsec,0)>0 and i.cltcode is not null then 1 else 0 end effect
from
(
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_shanghai..callbehaviorrealtime
union all
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_shanghai..callbehaviorrealtime_2015
) c
inner join
(
select c.dst dst,min(c.callbehaviorrealtimeid) min_id
from
(
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_shanghai..callbehaviorrealtime
union all
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_shanghai..callbehaviorrealtime_2015
) c
group by c.dst
)c1
on c.callbehaviorrealtimeid=c1.min_id
right join dfss_shanghai..sal_clt_lnkman k
on c.dst=k.lnk_mobile
left join 
(
select distinct cltcode
from dfss_shanghai.dbo.customerexestatuschangehistoryid
where preexestatus=10 and afterexestatus in (1,2,3,4,5,6)
) i
on k.clt_code=i.cltcode
left join dfss_bi..userinfo u
on k.clt_code=u.clt_code
where u.FromWebsite='市场'
group by k.clt_code,c.calldate,c.billsec,i.cltcode

union all

select distinct
k.clt_code clt_code
,c.calldate firstcalldate
,case when isnull(c.billsec,0)>0 then 1 else 0 end dialon
,case when isnull(c.billsec,0)>0 and i.cltcode is not null then 1 else 0 end effect
from
(
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_suzhou..callbehaviorrealtime
union all
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_suzhou..callbehaviorrealtime_2015
) c
inner join
(
select c.dst dst,min(c.callbehaviorrealtimeid) min_id
from
(
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_suzhou..callbehaviorrealtime
union all
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_suzhou..callbehaviorrealtime_2015
) c
group by c.dst
)c1
on c.callbehaviorrealtimeid=c1.min_id
right join dfss_suzhou..sal_clt_lnkman k
on c.dst=k.lnk_mobile
left join 
(
select distinct cltcode
from dfss_suzhou.dbo.customerexestatuschangehistoryid
where preexestatus=10 and afterexestatus in (1,2,3,4,5,6)
) i
on k.clt_code=i.cltcode
left join dfss_bi..userinfo u
on k.clt_code=u.clt_code
where u.FromWebsite='市场'
group by k.clt_code,c.calldate,c.billsec,i.cltcode

union all

select distinct
k.clt_code clt_code
,c.calldate firstcalldate
,case when isnull(c.billsec,0)>0 then 1 else 0 end dialon
,case when isnull(c.billsec,0)>0 and i.cltcode is not null then 1 else 0 end effect
from
(
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_wuxi..callbehaviorrealtime
union all
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_wuxi..callbehaviorrealtime_2015
) c
inner join
(
select c.dst dst,min(c.callbehaviorrealtimeid) min_id
from
(
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_wuxi..callbehaviorrealtime
union all
select callbehaviorrealtimeid,src,dst,billsec,calldate from dfss_wuxi..callbehaviorrealtime_2015
) c
group by c.dst
)c1
on c.callbehaviorrealtimeid=c1.min_id
right join dfss_wuxi..sal_clt_lnkman k
on c.dst=k.lnk_mobile
left join 
(
select distinct cltcode
from dfss_wuxi.dbo.customerexestatuschangehistoryid
where preexestatus=10 and afterexestatus in (1,2,3,4,5,6)
) i
on k.clt_code=i.cltcode
left join dfss_bi..userinfo u
on k.clt_code=u.clt_code
where u.FromWebsite='市场'
group by k.clt_code,c.calldate,c.billsec,i.cltcode

/* n天拨打量 */

select distinct
c.clt_code clt_code
,case when isnull(sum(case when c.calldate is not null then 1 else 0 end),0)>0 then 1 else 0 end 'dial'
,isnull(case when datediff(d,l.importdate,h.firstcalldate)<=15 then 1 else 0 end,0) 'call_15days'  /* 拨打量 */
,isnull(case when datediff(d,l.importdate,h.firstcalldate)<=30 then 1 else 0 end,0) 'call_30days'
,isnull(case when datediff(d,l.importdate,h.firstcalldate)<=45 then 1 else 0 end,0) 'call_45days'
,isnull(case when datediff(d,l.importdate,h.firstcalldate)<=60 then 1 else 0 end,0) 'call_60days'
,isnull(sum(case when datediff(d,l.importdate,c.calldate)<=15 then 1 else 0 end),0) 'call_total_15days'  /* 拨打次数 */
,isnull(sum(case when datediff(d,l.importdate,c.calldate)<=30 then 1 else 0 end),0) 'call_total_30days'
,isnull(sum(case when datediff(d,l.importdate,c.calldate)<=45 then 1 else 0 end),0) 'call_total_45days' 
,isnull(sum(case when datediff(d,l.importdate,c.calldate)<=60 then 1 else 0 end),0) 'call_total_60days'
into #n_day_call
from 
(
select batch,clt_code,calldate,billsecond,isgetthrough from dfss_bi..calldetails
union all
select batch,clt_code,calldate,billsecond,isgetthrough from dfss_bi..calldetails_2015
) c
left join dfss_bi..telemarketingdetail t
on c.clt_code=t.clt_code
left join #firstcall h
on c.clt_code=h.clt_code
left join #clt l
on c.clt_code=l.clt_code
where t.cltstatus=1 and l.importdate>='2015-1-1'
group by c.clt_code,l.importdate,h.firstcalldate


/* 60天业绩 */
 select t.clt_code clt_code
 ,isnull(sum(case when datediff(d,l.importdate,dr.dealtime)<=15 then dr.thisserviceamount else 0 end),0) 'servicetotal_15days'
 ,isnull(sum(case when datediff(d,l.importdate,dr.dealtime)<=30 then dr.thisserviceamount else 0 end),0) 'servicetotal_30days'
 ,isnull(sum(case when datediff(d,l.importdate,dr.dealtime)<=45 then dr.thisserviceamount else 0 end),0) 'servicetotal_45days'
 ,isnull(sum(case when datediff(d,l.importdate,dr.dealtime)<=60 then dr.thisserviceamount else 0 end),0) 'servicetotal_60days'
 ,isnull(sum(dr.thisserviceamount),0) 'servicetotal'
 into #fee
 from dfssmng..dataresults dr
 inner join dfss_bi..cltcontract ct
 on dr.contractcode=ct.contractcode
 right join dfss_bi..telemarketingdetail t
 on ct.clt_code=t.clt_code
 left join #clt l
 on ct.clt_code=l.clt_code
 where t.cltstatus=1 and l.importdate>='2015-1-1'
 group by t.clt_code
 

/* 有效进程需求额 */
select m.clt_code clt_code
,m.rqr_amount rqr_amount
into #rqr
from
(
select aa.clt_code clt_code,case when ab.rqr_amount>200 then 200 else ab.rqr_amount end rqr_amount				
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
select s.clt_code ,min(s.rqr_id) min_rqr_id						
from dfss_guangzhou.dbo.sal_clt_require  s  with(nolock)  						
group by s.clt_code						
) t						
inner join dfss_guangzhou.dbo.sal_clt_require  d  with(nolock)  on t.min_rqr_id=d.rqr_id) ab on aa.clt_code=ab.clt_code												
where isnull(aa.billsec,0)>0  and 						
(select count(1) from dfss_guangzhou.dbo.customerexestatuschangehistoryid (nolock) 						
where cltcode=aa.clt_code and preexestatus=10 and afterexestatus in (1,2,3,4,5,6))>0 	

union all

select aa.clt_code clt_code,case when ab.rqr_amount>200 then 200 else ab.rqr_amount end rqr_amount				
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
select s.clt_code ,min(s.rqr_id) min_rqr_id						
from dfss_chengdu.dbo.sal_clt_require  s  with(nolock)  						
group by s.clt_code						
) t						
inner join  dfss_chengdu.dbo.sal_clt_require  d  with(nolock)  on t.min_rqr_id=d.rqr_id) ab on aa.clt_code=ab.clt_code												
where isnull(aa.billsec,0)>0  and 						
(select count(1) from dfss_chengdu.dbo.customerexestatuschangehistoryid (nolock) 						
where cltcode=aa.clt_code and preexestatus=10 and afterexestatus in (1,2,3,4,5,6))>0

union all

select aa.clt_code clt_code,case when ab.rqr_amount>200 then 200 else ab.rqr_amount end rqr_amount				
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
select s.clt_code ,min(s.rqr_id) min_rqr_id						
from dfss_hangzhou.dbo.sal_clt_require  s  with(nolock)  						
group by s.clt_code						
) t						
inner join dfss_hangzhou.dbo.sal_clt_require  d  with(nolock)  on t.min_rqr_id=d.rqr_id) ab on aa.clt_code=ab.clt_code												
where isnull(aa.billsec,0)>0  and 						
(select count(1) from dfss_hangzhou.dbo.customerexestatuschangehistoryid (nolock) 						
where cltcode=aa.clt_code and preexestatus=10 and afterexestatus in (1,2,3,4,5,6))>0

union all

select aa.clt_code clt_code,case when ab.rqr_amount>200 then 200 else ab.rqr_amount end rqr_amount				
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
select s.clt_code,min(s.rqr_id) min_rqr_id						
from dfss_nanjing.dbo.sal_clt_require  s  with(nolock)  						
group by s.clt_code						
) t						
inner join  dfss_nanjing.dbo.sal_clt_require  d  with(nolock)  on t.min_rqr_id=d.rqr_id) ab on aa.clt_code=ab.clt_code												
where isnull(aa.billsec,0)>0  and 						
(select count(1) from dfss_nanjing.dbo.customerexestatuschangehistoryid (nolock) 						
where cltcode=aa.clt_code and preexestatus=10 and afterexestatus in (1,2,3,4,5,6))>0	

union all

select aa.clt_code clt_code,case when ab.rqr_amount>200 then 200 else ab.rqr_amount end rqr_amount				
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
select s.clt_code ,min(s.rqr_id) min_rqr_id						
from dfss_ningbo.dbo.sal_clt_require  s  with(nolock)  						
group by s.clt_code						
) t						
inner join  dfss_ningbo.dbo.sal_clt_require  d  with(nolock)  on t.min_rqr_id=d.rqr_id) ab on aa.clt_code=ab.clt_code												
where isnull(aa.billsec,0)>0  and 						
(select count(1) from dfss_ningbo.dbo.customerexestatuschangehistoryid (nolock) 						
where cltcode=aa.clt_code and preexestatus=10 and afterexestatus in (1,2,3,4,5,6))>0	

union all

select aa.clt_code clt_code,case when ab.rqr_amount>200 then 200 else ab.rqr_amount end rqr_amount				
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
select s.clt_code ,min(s.rqr_id) min_rqr_id						
from dfss_qingdao.dbo.sal_clt_require  s  with(nolock)  						
group by s.clt_code						
) t						
inner join  dfss_qingdao.dbo.sal_clt_require  d  with(nolock)  on t.min_rqr_id=d.rqr_id) ab on aa.clt_code=ab.clt_code												
where isnull(aa.billsec,0)>0  and 						
(select count(1) from dfss_qingdao.dbo.customerexestatuschangehistoryid (nolock) 						
where cltcode=aa.clt_code and preexestatus=10 and afterexestatus in (1,2,3,4,5,6))>0

union all

select aa.clt_code clt_code,case when ab.rqr_amount>200 then 200 else ab.rqr_amount end rqr_amount				
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
select s.clt_code ,min(s.rqr_id) min_rqr_id						
from dfss_shanghai.dbo.sal_clt_require  s  with(nolock)  						
group by s.clt_code						
) t						
inner join dfss_shanghai.dbo.sal_clt_require  d  with(nolock)  on t.min_rqr_id=d.rqr_id) ab on aa.clt_code=ab.clt_code												
where isnull(aa.billsec,0)>0  and 						
(select count(1) from dfss_shanghai.dbo.customerexestatuschangehistoryid (nolock) 						
where cltcode=aa.clt_code and preexestatus=10 and afterexestatus in (1,2,3,4,5,6))>0	

union all

select aa.clt_code clt_code,case when ab.rqr_amount>200 then 200 else ab.rqr_amount end rqr_amount				
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
select s.clt_code ,min(s.rqr_id) min_rqr_id						
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
select l.branch 分公司
,year(l.importdate) yy
,month(l.importdate) mm
,count(*) 话单量
,isnull(sum(y.dial),0) 已拨打话单量
,isnull(sum(h.dialon),0) 首拨接通话单量
,isnull(sum(case when n.rqr_amount is not null then 1 else 0 end),0) 首拨有效进程话单量
,isnull(sum(case when n.rqr_amount is not null then n.rqr_amount else 0 end),0)  首拨有效进程需求总额
,isnull(sum(case when n.rqr_amount is not null then 1 else 0 end),0) 首拨有需求客户数
,isnull(sum(x.servicetotal_15days),0) '15天业绩'
,isnull(sum(x.servicetotal_30days),0) '30天业绩'
,isnull(sum(x.servicetotal_45days),0) '45天业绩'
,isnull(sum(x.servicetotal_60days),0) '60天业绩'
,isnull(sum(x.servicetotal),0) 累计业绩
,isnull(sum(y.call_15days),0) '15天拨打量'
,isnull(sum(y.call_30days),0) '30天拨打量'
,isnull(sum(y.call_45days),0) '45天拨打量'
,isnull(sum(y.call_60days),0) '60天拨打量'
,isnull(sum(y.call_total_15days),0) '15天拨打次数'
,isnull(sum(y.call_total_30days),0) '30天拨打次数'
,isnull(sum(y.call_total_45days),0) '45天拨打次数'
,isnull(sum(y.call_total_60days),0) '60天拨打次数'
,case when count(*)=0 then 0 else isnull(sum(y.dial),0)*1./count(*) end 拨打率
,case when isnull(sum(y.dial),0)=0 then 0 else isnull(sum(h.dialon),0)*1./isnull(sum(y.dial),0) end 首拨接通率
,case when isnull(sum(h.dialon),0)=0 then 0 else isnull(sum(case when n.rqr_amount is not null then 1 else 0 end),0)*1./isnull(sum(h.dialon),0) end 首拨转化率
,case when isnull(sum(case when n.rqr_amount is not null then 1 else 0 end),0)=0 then 0 else isnull(sum(case when n.rqr_amount is not null then n.rqr_amount else 0 end),0)*1./isnull(sum(case when n.rqr_amount is not null then 1 else 0 end),0) end 首拨平均需求额
,case when (1375000/10+count(*)*2.)=0 then 0 else count(*)*(case when isnull(sum(y.dial),0)=0 then 0 else isnull(sum(h.dialon),0)*1./isnull(sum(y.dial),0) end)*(case when isnull(sum(h.dialon),0)=0 then 0 else isnull(sum(case when n.rqr_amount is not null then 1 else 0 end),0)*1./isnull(sum(h.dialon),0) end)*(case when isnull(sum(case when n.rqr_amount is not null then 1 else 0 end),0)=0 then 0 else isnull(sum(case when n.rqr_amount is not null then n.rqr_amount else 0 end),0)*1./isnull(sum(case when n.rqr_amount is not null then 1 else 0 end),0) end)*(358*1./10)/(1375000/10+count(*)*2.) end 首拨需求投产比
,case when isnull(sum(y.call_total_15days),0)=0 then 0 else isnull(sum(x.servicetotal_15days),0)*1./(1375000/10+isnull(sum(y.call_total_15days),0)*2) end '15天业绩投产比'
,case when isnull(sum(y.call_total_30days),0)=0 then 0 else isnull(sum(x.servicetotal_30days),0)*1./(1375000/10+isnull(sum(y.call_total_30days),0)*2) end '30天业绩投产比'
,case when isnull(sum(y.call_total_45days),0)=0 then 0 else isnull(sum(x.servicetotal_45days),0)*1./(1375000/10+isnull(sum(y.call_total_45days),0)*2) end '45天业绩投产比'
,case when isnull(sum(y.call_total_60days),0)=0 then 0 else isnull(sum(x.servicetotal_60days),0)*1./(1375000/10+isnull(sum(y.call_total_60days),0)*2) end '60天业绩投产比'
,case when isnull(sum(y.call_15days),0)=0 then 0 else isnull(sum(x.servicetotal_15days),0)*1./isnull(sum(y.call_15days),0)-100-isnull(sum(y.call_total_15days),0)*2/count(*) end '15天单位话单业绩利润'
,case when isnull(sum(y.call_30days),0)=0 then 0 else isnull(sum(x.servicetotal_30days),0)*1./isnull(sum(y.call_30days),0)-100-isnull(sum(y.call_total_30days),0)*2/count(*) end '30天单位话单业绩利润'
,case when isnull(sum(y.call_45days),0)=0 then 0 else isnull(sum(x.servicetotal_45days),0)*1./isnull(sum(y.call_45days),0)-100-isnull(sum(y.call_total_45days),0)*2/count(*) end '45天单位话单业绩利润'
,case when isnull(sum(y.call_60days),0)=0 then 0 else isnull(sum(x.servicetotal_60days),0)*1./isnull(sum(y.call_60days),0)-100-isnull(sum(y.call_total_60days),0)*2/count(*) end '60天单位话单业绩利润'
from #clt l
 
left join dfss_bi..telemarketingdetail t
on l.clt_code=t.clt_code

left join #n_day_call y
on l.clt_code=y.clt_code

left join #fee x
on l.clt_code=x.clt_code

left join #rqr n
on l.clt_code=n.clt_code

left join #firstcall h
on l.clt_code=h.clt_code

group by l.branch,year(l.importdate),month(l.importdate)

drop table #n_day_call
drop table #fee
drop table #rqr
drop table #firstcall
drop table #clt