/* 需求额度 */

select t.clt_code
,r.rqr_amount
,'成都' city
into #rqr
from
(
select clt_code,min(rqr_id) min_rqr_id
from dfss_chengdu..sal_clt_require
group by clt_code
) t
inner join dfss_chengdu..sal_clt_require r
on r.rqr_id=t.min_rqr_id
left join dfss_chengdu..sal_clt_base b
on t.clt_code=b.clt_code
where b.create_date>='2016-6-1'
group by t.clt_code,b.create_date,r.rqr_amount

union all

select t.clt_code
,r.rqr_amount
,'广州' city
from
(
select clt_code,min(rqr_id) min_rqr_id
from dfss_guangzhou..sal_clt_require
group by clt_code
) t
inner join dfss_guangzhou..sal_clt_require r
on r.rqr_id=t.min_rqr_id
left join dfss_guangzhou..sal_clt_base b
on t.clt_code=b.clt_code
where b.create_date>='2016-6-1'
group by t.clt_code,b.create_date,r.rqr_amount

union all

select t.clt_code
,r.rqr_amount
,'杭州' city
from
(
select clt_code,min(rqr_id) min_rqr_id
from dfss_hangzhou..sal_clt_require
group by clt_code
) t
inner join dfss_hangzhou..sal_clt_require r
on r.rqr_id=t.min_rqr_id
left join dfss_hangzhou..sal_clt_base b
on t.clt_code=b.clt_code
where b.create_date>='2016-6-1'
group by t.clt_code,b.create_date,r.rqr_amount

union all

select t.clt_code
,r.rqr_amount
,'南京' city
from
(
select clt_code,min(rqr_id) min_rqr_id
from dfss_nanjing..sal_clt_require
group by clt_code
) t
inner join dfss_nanjing..sal_clt_require r
on r.rqr_id=t.min_rqr_id
left join dfss_nanjing..sal_clt_base b
on t.clt_code=b.clt_code
where b.create_date>='2016-6-1'
group by t.clt_code,b.create_date,r.rqr_amount

union all

select t.clt_code
,r.rqr_amount
,'宁波' city
from
(
select clt_code,min(rqr_id) min_rqr_id
from dfss_ningbo..sal_clt_require
group by clt_code
) t
inner join dfss_ningbo..sal_clt_require r
on r.rqr_id=t.min_rqr_id
left join dfss_ningbo..sal_clt_base b
on t.clt_code=b.clt_code
where b.create_date>='2016-6-1'
group by t.clt_code,b.create_date,r.rqr_amount

union all

select t.clt_code
,r.rqr_amount
,'青岛' city
from
(
select clt_code,min(rqr_id) min_rqr_id
from dfss_qingdao..sal_clt_require
group by clt_code
) t
inner join dfss_qingdao..sal_clt_require r
on r.rqr_id=t.min_rqr_id
left join dfss_qingdao..sal_clt_base b
on t.clt_code=b.clt_code
where b.create_date>='2016-6-1'
group by t.clt_code,b.create_date,r.rqr_amount

union all

select t.clt_code
,r.rqr_amount
,'上海' city
from
(
select clt_code,min(rqr_id) min_rqr_id
from dfss_shanghai..sal_clt_require
group by clt_code
) t
inner join dfss_shanghai..sal_clt_require r
on r.rqr_id=t.min_rqr_id
left join dfss_shanghai..sal_clt_base b
on t.clt_code=b.clt_code
where b.create_date>='2016-6-1'
group by t.clt_code,b.create_date,r.rqr_amount

union all

select t.clt_code
,r.rqr_amount
,'深圳' city
from
(
select clt_code,min(rqr_id) min_rqr_id
from dfss_shenzhen..sal_clt_require
group by clt_code
) t
inner join dfss_shenzhen..sal_clt_require r
on r.rqr_id=t.min_rqr_id
left join dfss_shenzhen..sal_clt_base b
on t.clt_code=b.clt_code
where b.create_date>='2016-6-1'
group by t.clt_code,b.create_date,r.rqr_amount

union all

select t.clt_code
,r.rqr_amount
,'苏州' city
from
(
select clt_code,min(rqr_id) min_rqr_id
from dfss_suzhou..sal_clt_require
group by clt_code
) t
inner join dfss_suzhou..sal_clt_require r
on r.rqr_id=t.min_rqr_id
left join dfss_suzhou..sal_clt_base b
on t.clt_code=b.clt_code
where b.create_date>='2016-6-1'
group by t.clt_code,b.create_date,r.rqr_amount

union all

select t.clt_code
,r.rqr_amount
,'无锡' city
from
(
select clt_code,min(rqr_id) min_rqr_id
from dfss_wuxi..sal_clt_require
group by clt_code
) t
inner join dfss_wuxi..sal_clt_require r
on r.rqr_id=t.min_rqr_id
left join dfss_wuxi..sal_clt_base b
on t.clt_code=b.clt_code
where b.create_date>='2016-6-1'
group by t.clt_code,b.create_date,r.rqr_amount

/* 048、065话单 */

select distinct s.clt_code
,substring(nf.filename,1,3) channel_id
,s.create_date
,'成都' city
into #clt
from dfss_chengdu..sal_clt_base s
left join dfss_chengdu..newcustomerbatchcode nb
on s.newcustomerbatchcodeid=nb.newcustomerbatchcodeid
left join dfss_chengdu..newcustomerfile nf
on nb.newcustomerfileid=nf.newcustomerfileid
where nf.filename like '048%' or nf.filename like '065%' and nf.createtime>='2016-6-1'
group by s.clt_code,nf.filename,s.create_date

union all

select distinct s.clt_code
,substring(nf.filename,1,3) channel_id
,s.create_date
,'广州' city
from dfss_guangzhou..sal_clt_base s
left join dfss_guangzhou..newcustomerbatchcode nb
on s.newcustomerbatchcodeid=nb.newcustomerbatchcodeid
left join dfss_guangzhou..newcustomerfile nf
on nb.newcustomerfileid=nf.newcustomerfileid
where nf.filename like '048%' or nf.filename like '065%' and nf.createtime>='2016-6-1'
group by s.clt_code,nf.filename,s.create_date

union all

select distinct s.clt_code
,substring(nf.filename,1,3) channel_id
,s.create_date
,'杭州' city
from dfss_hangzhou..sal_clt_base s
left join dfss_hangzhou..newcustomerbatchcode nb
on s.newcustomerbatchcodeid=nb.newcustomerbatchcodeid
left join dfss_hangzhou..newcustomerfile nf
on nb.newcustomerfileid=nf.newcustomerfileid
where nf.filename like '048%' or nf.filename like '065%' and nf.createtime>='2016-6-1'
group by s.clt_code,nf.filename,s.create_date

union all

select distinct s.clt_code
,substring(nf.filename,1,3) channel_id
,s.create_date
,'南京' city
from dfss_nanjing..sal_clt_base s
left join dfss_nanjing..newcustomerbatchcode nb
on s.newcustomerbatchcodeid=nb.newcustomerbatchcodeid
left join dfss_nanjing..newcustomerfile nf
on nb.newcustomerfileid=nf.newcustomerfileid
where nf.filename like '048%' or nf.filename like '065%' and nf.createtime>='2016-6-1'
group by s.clt_code,nf.filename,s.create_date

union all

select distinct s.clt_code
,substring(nf.filename,1,3) channel_id
,s.create_date
,'宁波' city
from dfss_ningbo..sal_clt_base s
left join dfss_ningbo..newcustomerbatchcode nb
on s.newcustomerbatchcodeid=nb.newcustomerbatchcodeid
left join dfss_ningbo..newcustomerfile nf
on nb.newcustomerfileid=nf.newcustomerfileid
where nf.filename like '048%' or nf.filename like '065%' and nf.createtime>='2016-6-1'
group by s.clt_code,nf.filename,s.create_date

union all

select distinct s.clt_code
,substring(nf.filename,1,3) channel_id
,s.create_date
,'青岛' city
from dfss_qingdao..sal_clt_base s
left join dfss_qingdao..newcustomerbatchcode nb
on s.newcustomerbatchcodeid=nb.newcustomerbatchcodeid
left join dfss_qingdao..newcustomerfile nf
on nb.newcustomerfileid=nf.newcustomerfileid
where nf.filename like '048%' or nf.filename like '065%' and nf.createtime>='2016-6-1'
group by s.clt_code,nf.filename,s.create_date

union all

select distinct s.clt_code
,substring(nf.filename,1,3) channel_id
,s.create_date
,'上海' city
from dfss_shanghai..sal_clt_base s
left join dfss_shanghai..newcustomerbatchcode nb
on s.newcustomerbatchcodeid=nb.newcustomerbatchcodeid
left join dfss_shanghai..newcustomerfile nf
on nb.newcustomerfileid=nf.newcustomerfileid
where nf.filename like '048%' or nf.filename like '065%' and nf.createtime>='2016-6-1'
group by s.clt_code,nf.filename,s.create_date

union all

select distinct s.clt_code
,substring(nf.filename,1,3) channel_id
,s.create_date
,'深圳' city
from dfss_shenzhen..sal_clt_base s
left join dfss_shenzhen..newcustomerbatchcode nb
on s.newcustomerbatchcodeid=nb.newcustomerbatchcodeid
left join dfss_shenzhen..newcustomerfile nf
on nb.newcustomerfileid=nf.newcustomerfileid
where nf.filename like '048%' or nf.filename like '065%' and nf.createtime>='2016-6-1'
group by s.clt_code,nf.filename,s.create_date

union all

select distinct s.clt_code
,substring(nf.filename,1,3) channel_id
,s.create_date
,'苏州' city
from dfss_suzhou..sal_clt_base s
left join dfss_suzhou..newcustomerbatchcode nb
on s.newcustomerbatchcodeid=nb.newcustomerbatchcodeid
left join dfss_suzhou..newcustomerfile nf
on nb.newcustomerfileid=nf.newcustomerfileid
where nf.filename like '048%' or nf.filename like '065%' and nf.createtime>='2016-6-1'
group by s.clt_code,nf.filename,s.create_date

union all

select distinct s.clt_code
,substring(nf.filename,1,3) channel_id
,s.create_date
,'无锡' city
from dfss_wuxi..sal_clt_base s
left join dfss_wuxi..newcustomerbatchcode nb
on s.newcustomerbatchcodeid=nb.newcustomerbatchcodeid
left join dfss_wuxi..newcustomerfile nf
on nb.newcustomerfileid=nf.newcustomerfileid
where nf.filename like '048%' or nf.filename like '065%' and nf.createtime>='2016-6-1'
group by s.clt_code,nf.filename,s.create_date

/* 话单需求额明细 */

select l.clt_code '话单'
,l.channel_id '渠道号'
,l.city '分公司'
,l.create_date '导入日期'
,isnull(r.rqr_amount,0) '需求额'
from #clt l
left join #rqr r
on l.clt_code=r.clt_code
where l.create_date>='2016-6-1'
group by l.clt_code,l.channel_id,l.city,l.create_date,r.rqr_amount

/* 删除临时表 */

drop table #rqr
drop table #clt