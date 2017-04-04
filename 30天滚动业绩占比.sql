/* 话单信息 */

select distinct s.clt_code		--客户编号
,s.create_date importdate		--导入日期  
,s.fromwebsite		--判断非市场话单
,c.contractcode		--合同编号
,c.finalarchivetime		--合同归档日期
,'成都' branch
into #clt
from dfss_chengdu..sal_clt_base s
left join dfss_chengdu..contract c
on s.clt_code=c.cltcode
group by s.clt_code,s.create_date,s.fromwebsite,c.contractcode,c.finalarchivetime

union all

select distinct s.clt_code
,s.create_date importdate
,s.fromwebsite
,c.contractcode
,c.finalarchivetime
,'广州' branch
from dfss_guangzhou..sal_clt_base s
left join dfss_guangzhou..contract c
on s.clt_code=c.cltcode
group by s.clt_code,s.create_date,s.fromwebsite,c.contractcode,c.finalarchivetime

union all

select distinct s.clt_code
,s.create_date importdate
,s.fromwebsite
,c.contractcode
,c.finalarchivetime
,'杭州' branch
from dfss_hangzhou..sal_clt_base s
left join dfss_hangzhou..contract c
on s.clt_code=c.cltcode
group by s.clt_code,s.create_date,s.fromwebsite,c.contractcode,c.finalarchivetime

union all

select distinct s.clt_code
,s.create_date importdate
,s.fromwebsite
,c.contractcode
,c.finalarchivetime
,'南京' branch
from dfss_nanjing..sal_clt_base s
left join dfss_nanjing..contract c
on s.clt_code=c.cltcode
group by s.clt_code,s.create_date,s.fromwebsite,c.contractcode,c.finalarchivetime

union all

select distinct s.clt_code
,s.create_date importdate
,s.fromwebsite
,c.contractcode
,c.finalarchivetime
,'宁波' branch
from dfss_ningbo..sal_clt_base s
left join dfss_ningbo..contract c
on s.clt_code=c.cltcode
group by s.clt_code,s.create_date,s.fromwebsite,c.contractcode,c.finalarchivetime

union all

select distinct s.clt_code
,s.create_date importdate
,s.fromwebsite
,c.contractcode
,c.finalarchivetime
,'青岛' branch
from dfss_qingdao..sal_clt_base s
left join dfss_qingdao..contract c
on s.clt_code=c.cltcode
group by s.clt_code,s.create_date,s.fromwebsite,c.contractcode,c.finalarchivetime

union all

select distinct s.clt_code
,s.create_date importdate
,s.fromwebsite
,c.contractcode
,c.finalarchivetime
,'上海' branch
from dfss_shanghai..sal_clt_base s
left join dfss_shanghai..contract c
on s.clt_code=c.cltcode
group by s.clt_code,s.create_date,s.fromwebsite,c.contractcode,c.finalarchivetime

union all

select distinct s.clt_code
,s.create_date importdate
,s.fromwebsite
,c.contractcode
,c.finalarchivetime
,'深圳' branch
from dfss_shenzhen..sal_clt_base s
left join dfss_shenzhen..contract c
on s.clt_code=c.cltcode
group by s.clt_code,s.create_date,s.fromwebsite,c.contractcode,c.finalarchivetime

union all

select distinct s.clt_code
,s.create_date importdate
,s.fromwebsite
,c.contractcode
,c.finalarchivetime
,'苏州' branch
from dfss_suzhou..sal_clt_base s
left join dfss_suzhou..contract c
on s.clt_code=c.cltcode
group by s.clt_code,s.create_date,s.fromwebsite,c.contractcode,c.finalarchivetime

union all

select distinct s.clt_code
,s.create_date importdate
,s.fromwebsite
,c.contractcode
,c.finalarchivetime
,'无锡' branch
from dfss_wuxi..sal_clt_base s
left join dfss_wuxi..contract c
on s.clt_code=c.cltcode
group by s.clt_code,s.create_date,s.fromwebsite,c.contractcode,c.finalarchivetime


/* 业绩信息 */
select h.yy '成交年份'
,h.mm '成交月份'
,isnull(sum(h.fee_total),0) '当月新签总业绩'
,isnull(sum(h.fee_30),0) '30天滚动业绩'
,case when isnull(sum(h.fee_total),0)=0 then 0 else isnull(sum(h.fee_30),0)*1./isnull(sum(h.fee_total),0) end '30天滚动业绩占比'
from
(
select distinct dr.contractcode
,year(dr.dealtime) yy
,month(dr.dealtime) mm
,isnull(sum(dr.thisserviceamount),0) fee_total		--成交总业绩
,isnull(sum(case when datediff(d,l.importdate,l.finalarchivetime)<=30 and l.fromwebsite<>1 then dr.thisserviceamount else 0 end),0) fee_30  	--双条件判断：1、滚动30天  2、非市场话单，不符合条件的业绩重置0
from dfssmng..dataresults dr
left join #clt l
on dr.contractcode=l.contractcode
where dr.thisserviceamount>0
group by dr.contractcode,year(dr.dealtime),month(dr.dealtime)
) h
group by h.yy,h.mm

drop table #clt