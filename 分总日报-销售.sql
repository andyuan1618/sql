select b.importdate '导入日期'
,b.remarks '话单性质'
,b.batch '文件'
,b.channel '渠道'
,b.branch '分公司'
,b.cost '购买总价'
,b.price '购买单价'
,b.batchcnt '购买数量'
,b.batchcnt-b.importcnt '废弃话单量'
,b.importcnt '导入总量'
,b.successcnt '成功新增量'
,b.successcnt-count(distinct t.clt_code) '未分配'
,count(distinct t.clt_code) '已分配'
,isnull(sum(case when t.FirstCallDate is not null then 1 else 0 end),0) '已拨打话单量'
,isnull(sum(t.isGetThrough),0) '首拨接通量'
,isnull(sum(t.isEnterProcess),0) '首拨有效进程量'
,isnull(c2.dialcount,0) '拨打次数'
,isnull(c2.dialoncount,0) '接通次数'
,isnull(c2.thirtysec,0) '30s通数'
,case when b.batchcnt=0 then 0 else (b.batchcnt-b.importcnt)*1./b.batchcnt end '废弃率'
,case when b.batchcnt=0 then 0 else b.successcnt*1./b.batchcnt end '新增率'
,case when b.successcnt=0 then 0 else count(distinct t.clt_code)*1./b.successcnt end '分配率'
,case when b.batchcnt=0 then 0 else isnull(sum(case when t.FirstCallDate is not null then 1 else 0 end),0)*1./(b.batchcnt-(b.batchcnt-b.importcnt)) end '拨打率'
,case when count(distinct t.clt_code)=0 then 0 else isnull(sum(case when t.FirstCallDate is not null then 1 else 0 end),0)*1./count(distinct t.clt_code) end '有效拨打率'
,case when sum(case when t.FirstCallDate is not null then 1 else 0 end)=0 then 0 else sum(t.isGetThrough)*1./sum(case when t.FirstCallDate is not null then 1 else 0 end) end '首拨接通率'
,case when isnull(c2.dialcount,0)=0 then 0 else isnull(c2.dialoncount,0)*1./isnull(c2.dialcount,0) end '有效接通率'
,case when isnull(sum(t.isGetThrough),0)=0 then 0 else isnull(sum(t.isEnterProcess),0)*1./isnull(sum(t.isGetThrough),0) end '首拨转化率'
,isnull(c2.thirtysecrate,0) '30s时长通话率'
,isnull(sum(t.requireamount),0) '需求总额'
,sum(case when t.requireamount>0 then 1 else 0 end) '客户数'
,isnull(sum(t.requireamount)/sum(case when t.requireamount>0 then 1 else 0 end),0) '平均需求额度'
,isnull(sum(t.ServiceTotal),0) '累计业绩'
,case when b.cost=0 then 0 else isnull(sum(t.ServiceTotal),0)*1./b.cost end 'ROI'
,case when b.batchcnt=0 then 0 else isnull(sum(t.ServiceTotal),0)*1./b.batchcnt end '单位粒子产能'
,isnull(sum(case when t.cltstatus=3 then 1 else 0 end),0) '公海'
,isnull(sum(case when t.cltstatus=4 then 1 else 0 end),0) '新话单'
,isnull(sum(case when t.cltstatus=5 then 1 else 0 end),0) '私海'
,isnull(sum(case when t.cltstatus=2 then 1 else 0 end),0) '废弃'
--,isnull(sum(case when t.cltstatus=6 then 1 else 0 end),0) '公海2'
from dfss_bi..batchinfo b
left join dfss_bi..telemarketingdetail t
on b.batch=t.batch
left join
(
select c1.batch
,isnull(sum(case when c1.calldate is not null then 1 else 0 end),0) dialcount
,isnull(sum(c1.isgetthrough),0) dialoncount
,isnull(sum(case when c1.billsecond>=30 then 1 else 0 end),0) thirtysec
,case when isnull(sum(c1.isgetthrough),0)=0 then 0 else isnull(sum(case when c1.billsecond>=30 then 1 else 0 end),0)*1./isnull(sum(c1.isgetthrough),0) end thirtysecrate
from 
(
select c.batch,c.clt_code,c.calldate,c.billsecond,c.isgetthrough
from dfss_bi..calldetails c

union all

select c.batch,c.clt_code,c.calldate,c.billsecond,c.isgetthrough
from dfss_bi..calldetails_2015 c
) c1
group by c1.batch
) c2
on t.batch=c2.batch
group by b.importdate,b.remarks,b.batch,b.channel,b.branch,b.cost,b.price,b.batchcnt,b.importcnt,b.successcnt,c2.dialcount,c2.dialoncount,c2.thirtysecrate,c2.thirtysec
order by b.importdate desc