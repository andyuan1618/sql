
/*
分公司	话单来源	话单数量	拨打次数	接通次数	拨打率	接通率	需求转化率	平均需求额度	邀约率	谈单率	签约率	会员单均	外包单均	平均成交周期	人均产能

*/


create table #BianZhi
(
	CityName varchar(10) not null,
	TeamNum int not null
)

insert into #BianZhi
values ('广州',88),('杭州',89),('合肥',13),('南京',89),('宁波',86),('上海',85),('深圳',78),('苏州',120),('无锡',64),('青岛',25),('成都',21)



select  
u.Branch   '分公司'
,count(*)   '话单数量'
,count(*)*1./b1.TeamNum   '循环周期/天'
,sum(t.calls)   '拨打次数'
,sum(t.getThroughs)   '接通次数'
,sum(case when t.calls>0 then 1 else 0 end)*1./count(*)   '拨打率'
,sum(case when t.getThroughs>0 then 1 else 0 end)*1./count(*)  '接通率'
,sum(t.isEnterProcess)*1./count(*)   '需求转化率'
,case when sum(t.isEnterProcess)=0 then 0 else sum(case when t.requireamount>200 then 200 else t.requireamount end )*1./sum(t.isEnterProcess) end   '平均需求额度'
,case when sum(t.getThroughs)=0 then 0 else sum(case when t.firstinvitedate is not null then 1 else 0 end )*1./sum(t.getThroughs) end   '邀约率'
,case when sum(case when t.firstinvitedate is not null then 1 else 0 end )=0 then 0 else sum(case when t.finalarchivetime is not null then 1 else 0 end)*1./sum(case when t.firstinvitedate is not null then 1 else 0 end ) end '签约率'
,case when sum(case when t.MemberFee>0 then 1 else 0 end)=0 then 0 else sum(t.memberfee)*1./sum(case when t.MemberFee>0 then 1 else 0 end)  end  '会员单均'
,case when sum(case when t.OtherFee>0 then 1 else 0 end)=0 then 0 else sum(t.OtherFee)*1./sum(case when t.OtherFee>0 then 1 else 0 end) end   '非会员单均'
,isnull(avg(datediff(d,t.firstcalldate,t.finalarchivetime)),0)    '平均成交周期'
,case when count(distinct t.salescnt)=0 then 0 else isnull(sum(t.servicetotal)*1./count(distinct t.salescnt),0) end   '人均产能'
,sum(t.memberfee) '会员费'
,sum(t.OtherFee) '非会员费'
,sum(case when u.role='企业主' then 1 else 0 end) '企业主数量'
,case when count(*) =0 then 0 else (sum(case when u.role='企业主' then 1 else 0 end)*1.)/count(*) end  '企业主占比'
,count(distinct t.salescnt)  '成交销售数'
,sum(t.isEnterProcess)  '有需求用户数'
,sum(case when t.requireamount>200 then 200 else t.requireamount end )  '需求总额'
,sum(case when t.firstinvitedate is not null then 1 else 0 end ) '邀约数'
,sum(case when t.finalarchivetime is not null then 1 else 0 end) '成交数'
,sum(case when t.calls>0 then 1 else 0 end)  '拨打人数'
,sum(case when t.getThroughs>0 then 1 else 0 end)  '接通人数'    
,sum(case when t.MemberFee>0 then 1 else 0 end)  '成交会员'
,sum(case when t.OtherFee>0 then 1 else 0 end)  '成交非会员'       
from [DFSS_BI].[dbo].[TelemarketingDetail]  t
left join dfss_bi..UserInfo u on u.CLT_CODE=t.Clt_Code
left join
(
select b.CityName,b.TeamNum*200 'TeamNum'
from #BianZhi b 
) b1
on u.Branch=b1.CityName


where CltStatus in (1,3,4,5)
group by u.Branch,b1.TeamNum

drop table #BianZhi
