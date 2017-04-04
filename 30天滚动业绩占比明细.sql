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

select distinct dr.contractcode 合同编号
,l.clt_code 客户编号
,dr.dealtime 成交日期
,l.importdate 导入日期
,l.finalarchivetime 归档日期
,isnull(sum(dr.thisserviceamount),0) 成交业绩
from dfssmng..dataresults dr
left join #clt l
on dr.contractcode=l.contractcode
where dr.thisserviceamount>0 and dr.dealtime>='2016-5-1'
group by dr.contractcode,l.clt_code,dr.dealtime,l.importdate,l.finalarchivetime


drop table #clt