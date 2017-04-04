/* 话单 */

select distinct t.clt_code
,e.emp_name sales
,case when t.firstcalldate is not null then 1 else 0 end dial
,t.isgetthrough dialon
,t.isenterprocess effect
,t.requireamount rqr_amount
,case when t.requireamount is not null and t.requireamount>0 then 1 else 0 end rqr_num
,u.role role
into #calls
from dfss_bi..telemarketingdetail t
left join dfss_bi..userinfo u
on t.clt_code=u.clt_code
left join dfss_bi..emp_name e
on u.clt_owner=e.emp_code
where t.batchid in (1715,1716,681)
group by t.clt_code,e.emp_name,t.firstcalldate,t.isgetthrough,t.isenterprocess,u.role,t.requireamount

/* 报表 */

select c.sales 顾问
,count(*) 话单总量
,isnull(sum(c.dial),0) 已拨打话单量
,isnull(sum(c.dialon),0) 首拨接通量
,isnull(sum(c.effect),0) 首拨有效进程量
,isnull(sum(case when c.rqr_amount is not null and c.rqr_amount>0 then c.rqr_amount else 0 end),0) 需求总额
,isnull(sum(case when c.rqr_amount is not null and c.rqr_amount>0 then 1 else 0 end),0) 需求客户数
,isnull(sum(case when c.role='企业主' then 1 else 0 end),0) 企业主数量
,isnull(sum(case when c.role='个体户' then 1 else 0 end),0) 个体户数量
,case when isnull(sum(c.dialon),0)=0 then 0 else isnull(sum(c.effect),0)*1./isnull(sum(c.dialon),0) end 首拨需求转化率
,case when isnull(sum(case when c.rqr_amount is not null and c.rqr_amount>0 then 1 else 0 end),0)=0 then 0 else isnull(sum(case when c.rqr_amount is not null and c.rqr_amount>0 then c.rqr_amount else 0 end),0)*1./isnull(sum(case when c.rqr_amount is not null and c.rqr_amount>0 then 1 else 0 end),0) end 平均需求额
,case when count(*)=0 then 0 else isnull(sum(case when c.role='企业主' then 1 else 0 end),0)*1./count(*) end 企业主占比
,case when count(*)=0 then 0 else isnull(sum(case when c.role='个体户' then 1 else 0 end),0)*1./count(*) end 个体户占比
from #calls c
group by c.sales

drop table #calls