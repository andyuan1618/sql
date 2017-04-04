/* 有效进程 */
select distinct s.cltcode
into #status
from dfss_shanghai..customerexestatuschangehistoryid s
where s.afterexestatus in (1,2,3,4,5,6) and s.createtime>='2016-5-1'

/* 需求额 */
select distinct r1.clt_code
,case when r1.rqr_amount>200 then 200 else r1.rqr_amount end rqr_amount
into #rqr
from dfss_shanghai..sal_clt_require r1
inner join 
(
select distinct clt_code
,min(rqr_id) min_rqr_id
from dfss_shanghai..sal_clt_require
group by clt_code
) r2
on r1.rqr_id=r2.min_rqr_id
where r1.rqr_amount>0
group by r1.clt_code,r1.rqr_amount

/* 顾问信息 */
select c.src
,h.emp_name
,c.dst
,l.clt_code
,b.clt_type
,p.rqr_amount
,case when sum(c.billsec)>0 then 1 else 0 end dialon
into #sales
from dfss_shanghai..callbehaviorrealtime c
left join dfss_shanghai..hrs_emp_base h
on c.src=substring(h.emp_code,3,4)
left join dfss_shanghai..sal_clt_lnkman l
on c.dst=l.lnk_mobile
left join dfss_shanghai..sal_clt_base b
on l.clt_code=b.clt_code
left join #rqr p
on l.clt_code=p.clt_code
where h.emp_name in ('吕乔琴','王瑶','徐冠雄','陈健','宋承奎','朱子健','王建辉','黄婉霞','祝雄伟') and c.calldate>='2016-5-1' and l.clt_code is not null
group by c.src,b.clt_type,h.emp_name,c.dst,l.clt_code,p.rqr_amount


/* 报表 */
select distinct m.emp_name '顾问'
,count(m.clt_code) '拨打话单量'
,isnull(sum(m.dialon),0) '接通话单量'
,isnull(sum(case when n.cltcode is not null then 1 else 0 end),0) '有效进程量'
,isnull(sum(m.rqr_amount),0) '需求总额'
,isnull(sum(case when m.rqr_amount is not null then 1 else 0 end),0) '需求客户数'
,isnull(sum(case when m.clt_type=1 then 1 else 0 end),0) '企业主数量'
,isnull(sum(case when m.clt_type=2 then 1 else 0 end),0) '个体户数量'
,isnull(sum(case when m.clt_type=3 then 1 else 0 end),0) '工薪族数量'
,case when count(m.clt_code)=0 then 0 else isnull(sum(m.dialon),0)*1./count(m.clt_code) end '接通率'
,case when isnull(sum(m.dialon),0)=0 then 0 else isnull(sum(case when n.cltcode is not null then 1 else 0 end),0)*1./isnull(sum(m.dialon),0) end '有效转化率'
,case when isnull(sum(case when m.rqr_amount is not null then 1 else 0 end),0)=0 then 0 else isnull(sum(m.rqr_amount),0)*1./isnull(sum(case when m.rqr_amount is not null then 1 else 0 end),0) end '平均需求额'
,case when count(m.clt_code)=0 then 0 else isnull(sum(case when m.clt_type=1 then 1 else 0 end),0)*1./count(m.clt_code) end '企业主占比'
,case when count(m.clt_code)=0 then 0 else isnull(sum(case when m.clt_type=2 then 1 else 0 end),0)*1./count(m.clt_code) end '个体户占比'
,case when count(m.clt_code)=0 then 0 else isnull(sum(case when m.clt_type=3 then 1 else 0 end),0)*1./count(m.clt_code) end '工薪族占比'
from #sales m
left join #status n
on m.clt_code=n.cltcode
group by m.emp_name

drop table #sales
drop table #rqr
drop table #status