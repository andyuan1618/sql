SELECT   hdb.*, 
YJB.实收费 AS 业绩 ,
YJB.成交时间


FROM 

(select
 '广州'        分公司,
 c.FileName 文件,
 C.CreateTime 话单创建时间,
q.CREATE_DATE  导入系统时间,
q.CLT_CODE 客户编码,
e.RQR_AMOUNT 客户需求额度
,c.[NewCltSourceType] 话单类型
,case q.CLT_TYPE  
when 1   then  '企业主'
when 2   then  '个体户'

when 3   then  '工薪族'
else '其他' end  客户类别,
case q.[CLT_EXE_STATUS]	
when 0 then '已联系' 	
when 1 then '有需求' 	
when 10 then '未联系' 	
when 2 then '有意向' 	
when 3 then '已来访' 	
when 4 then '已签约'	
when 5 then '外包成交'	
when 6 then '会员成交'	
else '其他' end   当前进程 
from  DFSS_GUANGZHOU.[dbo].[SAL_CLT_BASE] q
LEFT join DFSS_GUANGZHOU.dbo.NewCustomerBatchCode bb ON q.NewCustomerBatchCodeID =bb.NewCustomerBatchCodeID
LEFT JOIN DFSS_GUANGZHOU.dbo.NewCustomerFile c ON c.NewCustomerFileID = bb.NewCustomerFileID
LEFT JOIN DFSS_GUANGZHOU.dbo.SAL_CLT_REQUIRE e ON q.CLT_CODE =e.CLT_CODE
union
select
 '杭州'        分公司,
 c.FileName 文件,
  C.CreateTime 话单创建时间,
q.CREATE_DATE  导入系统时间,
q.CLT_CODE 客户编码,
e.RQR_AMOUNT 客户需求额度
,c.[NewCltSourceType] 话单类型
,case q.CLT_TYPE  
when 1   then  '企业主'
when 2   then  '个体户'
when 3   then  '工薪族'
else '其他' end  客户类别,
case q.[CLT_EXE_STATUS]	
when 0 then '已联系' 	
when 1 then '有需求' 	
when 10 then '未联系' 	
when 2 then '有意向' 	
when 3 then '已来访' 	
when 4 then '已签约'	
when 5 then '外包成交'	
when 6 then '会员成交'	
else '其他' end   当前进程 
from DFSS_HANGZHOU.[dbo].[SAL_CLT_BASE] q
LEFT join DFSS_HANGZHOU.dbo.NewCustomerBatchCode bb ON q.NewCustomerBatchCodeID =bb.NewCustomerBatchCodeID
LEFT JOIN DFSS_HANGZHOU.dbo.NewCustomerFile c ON c.NewCustomerFileID = bb.NewCustomerFileID
LEFT JOIN DFSS_HANGZHOU.dbo.SAL_CLT_REQUIRE e ON q.CLT_CODE =e.CLT_CODE
union
select
 '合肥'        分公司,
 c.FileName 文件,
  C.CreateTime 话单创建时间,
q.CREATE_DATE  导入系统时间,
q.CLT_CODE 客户编码,
e.RQR_AMOUNT 客户需求额度
,c.[NewCltSourceType] 话单类型
,case q.CLT_TYPE  
when 1   then  '企业主'
when 2   then  '个体户'
when 3   then  '工薪族'
else '其他' end  客户类别,
case q.[CLT_EXE_STATUS]	
when 0 then '已联系' 	
when 1 then '有需求' 	
when 10 then '未联系' 	
when 2 then '有意向' 	
when 3 then '已来访' 	
when 4 then '已签约'	
when 5 then '外包成交'	
when 6 then '会员成交'	
else '其他' end   当前进程 
from DFSS_HEFEI.[dbo].[SAL_CLT_BASE] q
LEFT join DFSS_HEFEI.dbo.NewCustomerBatchCode bb ON q.NewCustomerBatchCodeID =bb.NewCustomerBatchCodeID
LEFT JOIN DFSS_HEFEI.dbo.NewCustomerFile c ON c.NewCustomerFileID = bb.NewCustomerFileID
LEFT JOIN DFSS_HEFEI.dbo.SAL_CLT_REQUIRE e ON q.CLT_CODE =e.CLT_CODE
union
select
 '南京'        分公司,
 c.FileName 文件,
  C.CreateTime 话单创建时间,
q.CREATE_DATE  导入系统时间,
q.CLT_CODE 客户编码,
e.RQR_AMOUNT 客户需求额度
,c.[NewCltSourceType] 话单类型
,case q.CLT_TYPE  
when 1   then  '企业主'
when 2   then  '个体户'
when 3   then  '工薪族'
else '其他' end  客户类别,
case q.[CLT_EXE_STATUS]	
when 0 then '已联系' 	
when 1 then '有需求' 	
when 10 then '未联系' 	
when 2 then '有意向' 	
when 3 then '已来访' 	
when 4 then '已签约'	
when 5 then '外包成交'	
when 6 then '会员成交'	
else '其他' end   当前进程 
from DFSS_NANJING.[dbo].[SAL_CLT_BASE] q
LEFT JOIN DFSS_NANJING.dbo.NewCustomerBatchCode bb ON q.NewCustomerBatchCodeID =bb.NewCustomerBatchCodeID
LEFT JOIN DFSS_NANJING.dbo.NewCustomerFile c ON c.NewCustomerFileID = bb.NewCustomerFileID
LEFT JOIN DFSS_NANJING.dbo.SAL_CLT_REQUIRE e ON q.CLT_CODE =e.CLT_CODE
union
select
 '宁波'        分公司,
 c.FileName 文件,
  C.CreateTime 话单创建时间,
q.CREATE_DATE  导入系统时间,
q.CLT_CODE 客户编码,
e.RQR_AMOUNT 客户需求额度
,c.[NewCltSourceType] 话单类型
,case q.CLT_TYPE  
when 1   then  '企业主'
when 2   then  '个体户'
when 3   then  '工薪族'
else '其他' end  客户类别,
case q.[CLT_EXE_STATUS]	
when 0 then '已联系' 	
when 1 then '有需求' 	
when 10 then '未联系' 	
when 2 then '有意向' 	
when 3 then '已来访' 	
when 4 then '已签约'	
when 5 then '外包成交'	
when 6 then '会员成交'	
else '其他' end   当前进程 
from DFSS_NINGBO.[dbo].[SAL_CLT_BASE] q
LEFT JOIN DFSS_NINGBO.dbo.NewCustomerBatchCode bb ON q.NewCustomerBatchCodeID =bb.NewCustomerBatchCodeID
LEFT JOIN DFSS_NINGBO.dbo.NewCustomerFile c ON c.NewCustomerFileID = bb.NewCustomerFileID
LEFT JOIN DFSS_NINGBO.dbo.SAL_CLT_REQUIRE e ON q.CLT_CODE =e.CLT_CODE
union
select
 '上海'        分公司,
 c.FileName 文件,
  C.CreateTime 话单创建时间,
q.CREATE_DATE  导入系统时间,
q.CLT_CODE 客户编码,
e.RQR_AMOUNT 客户需求额度
,c.[NewCltSourceType] 话单类型
,case q.CLT_TYPE  
when 1   then  '企业主'
when 2   then  '个体户'
when 3   then  '工薪族'
else '其他' end  客户类别,
case q.[CLT_EXE_STATUS]	
when 0 then '已联系' 	
when 1 then '有需求' 	
when 10 then '未联系' 	
when 2 then '有意向' 	
when 3 then '已来访' 	
when 4 then '已签约'	
when 5 then '外包成交'	
when 6 then '会员成交'	
else '其他' end   当前进程 
from DFSS_SHANGHAI.[dbo].[SAL_CLT_BASE] q
LEFT JOIN DFSS_SHANGHAI.dbo.NewCustomerBatchCode bb ON q.NewCustomerBatchCodeID =bb.NewCustomerBatchCodeID
LEFT JOIN DFSS_SHANGHAI.dbo.NewCustomerFile c ON c.NewCustomerFileID = bb.NewCustomerFileID
LEFT JOIN DFSS_SHANGHAI.dbo.SAL_CLT_REQUIRE e ON q.CLT_CODE =e.CLT_CODE
union
select
 '深圳'        分公司,
 c.FileName 文件,
  C.CreateTime 话单创建时间,
q.CREATE_DATE  导入系统时间,
q.CLT_CODE 客户编码,
e.RQR_AMOUNT 客户需求额度
,c.[NewCltSourceType] 话单类型
,case q.CLT_TYPE  
when 1   then  '企业主'
when 2   then  '个体户'
when 3   then  '工薪族'
else '其他' end  客户类别,
case q.[CLT_EXE_STATUS]	
when 0 then '已联系' 	
when 1 then '有需求' 	
when 10 then '未联系' 	
when 2 then '有意向' 	
when 3 then '已来访' 	
when 4 then '已签约'	
when 5 then '外包成交'	
when 6 then '会员成交'	
else '其他' end   当前进程 
from DFSS_SHENZHEN.[dbo].[SAL_CLT_BASE] q
LEFT join DFSS_SHENZHEN.dbo.NewCustomerBatchCode bb ON q.NewCustomerBatchCodeID =bb.NewCustomerBatchCodeID
LEFT JOIN DFSS_SHENZHEN.dbo.NewCustomerFile c ON c.NewCustomerFileID = bb.NewCustomerFileID
LEFT JOIN DFSS_SHENZHEN.dbo.SAL_CLT_REQUIRE e ON q.CLT_CODE =e.CLT_CODE
union
select
 '苏州'        分公司,
 c.FileName 文件,
  C.CreateTime 话单创建时间,
q.CREATE_DATE  导入系统时间,
q.CLT_CODE 客户编码,
e.RQR_AMOUNT 客户需求额度
,c.[NewCltSourceType] 话单类型
,case q.CLT_TYPE  
when 1   then  '企业主'
when 2   then  '个体户'
when 3   then  '工薪族'
else '其他' end  客户类别,
case q.[CLT_EXE_STATUS]	
when 0 then '已联系' 	
when 1 then '有需求' 	
when 10 then '未联系' 	
when 2 then '有意向' 	
when 3 then '已来访' 	
when 4 then '已签约'	
when 5 then '外包成交'	
when 6 then '会员成交'	
else '其他' end   当前进程 
from DFSS_SUZHOU.[dbo].[SAL_CLT_BASE] q
LEFT join DFSS_SUZHOU.dbo.NewCustomerBatchCode bb ON q.NewCustomerBatchCodeID =bb.NewCustomerBatchCodeID
LEFT JOIN DFSS_SUZHOU.dbo.NewCustomerFile c ON c.NewCustomerFileID = bb.NewCustomerFileID
LEFT JOIN DFSS_SUZHOU.dbo.SAL_CLT_REQUIRE e ON q.CLT_CODE =e.CLT_CODE
union
select
 '无锡'        分公司,
 c.FileName 文件,
  C.CreateTime 话单创建时间,
q.CREATE_DATE  导入系统时间,
q.CLT_CODE 客户编码,
e.RQR_AMOUNT 客户需求额度
,c.[NewCltSourceType] 话单类型
,case q.CLT_TYPE  
when 1   then  '企业主'
when 2   then  '个体户'
when 3   then  '工薪族'
else '其他' end  客户类别,
case q.[CLT_EXE_STATUS]	
when 0 then '已联系' 	
when 1 then '有需求' 	
when 10 then '未联系' 	
when 2 then '有意向' 	
when 3 then '已来访' 	
when 4 then '已签约'	
when 5 then '外包成交'	
when 6 then '会员成交'	
else '其他' end   当前进程 
from DFSS_WUXI.[dbo].[SAL_CLT_BASE] q
LEFT join DFSS_WUXI.dbo.NewCustomerBatchCode bb ON q.NewCustomerBatchCodeID =bb.NewCustomerBatchCodeID
LEFT JOIN DFSS_WUXI.dbo.NewCustomerFile c ON c.NewCustomerFileID = bb.NewCustomerFileID
LEFT JOIN DFSS_WUXI.dbo.SAL_CLT_REQUIRE e ON q.CLT_CODE =e.CLT_CODE ) hdb
LEFT JOIN  (SELECT  
[DataResultsId] 可标识列
,[DealTime] 成交时间
,ISNULL([ThisReceivables],0) 本次收款
,[ThisReceivablesTime] 本次收款时间
,ISNULL(IntentionAmount,0) 意向金
,ISNULL(ThisServiceAmount,0)  实收费
,[DealDepart] 成交部门编码
,[DealDepartLeader] 团队总监
,[DealTeam] 成交团队编码
,[DealTeamLeader] 团队经理
,[DealSales] 成交个人
,ISNULL(SalesResult,0)   成交业绩
,[OperationsResult]  市场业绩
-- ,[FinanceResult]   
,[ChannelTeam] 客服团队
,[ChannelEmp] 客服经理
,ISNULL(ChannelResult,0)  客服业绩
,[RefundsTime]  历史成交日期
,ISNULL(RefundsAmount,0)    退费总额
,ISNULL(SalesRefundsAmount,0) 营销退费
,ISNULL(OperationsRefundsAmount,0)  市场退费
--,[FinanceRefundsAmount]  
,a.[ContractCode] 合同号,
ttt.CltCode 客户编码
,CASE CityCode
WHEN 'GUANGZHOU' THEN '广州'
WHEN 'HANGZHOU' THEN '杭州'
WHEN 'HEFEI' THEN '合肥'
WHEN 'NANJING' THEN '南京'
WHEN 'NINGBO' THEN '宁波'
WHEN 'SHANGHAI' THEN '上海'
WHEN 'SUZHOU' THEN '苏州'
WHEN 'WUXI' THEN '无锡'
WHEN 'SHENZHEN' THEN '深圳'
ELSE '其他'
end 城市
,a.[SubOrderId] 子订单编号
,[SuccessChannelTeam]    完成团队编码
,[SuccessChannelEmp]    完成经理
,ISNULL(SuccessChannelResult,0) 完成业绩
,[DevelopChannelTeam]  发展团队编码
,[DevelopChannelEmp]  渠道拓展
,ISNULL(DevelopChannelResult,0) 发展业绩
,[DealDepartName]    成交部门
,[DealTeamName]  成交团队
,[ServiceChannelName]   接单团队
,[DevelopChannelName]  发展团队
,[SuccessChannelName]  完成团队
,[DealCompanyLeader]   营销分总
,[DealAreaLeader] 营销区总
,[OperationTeam]  市场团队
,[OperationLeader] 市场总监
,[OperationServicer] 市场客服
,[ChannelAreaLeader] 区域总监
,[ChannelTotalResult] 融资总业绩
,[GuquanTeam] 股权团队
,[GuquanService]  股权客服
,ISNULL(GuquanResult,0) 股权业绩
--,[ViewStatu] AS SOURCE
,CASE a.ViewStatu 
WHEN  1 THEN '渠道喜报'
WHEN  2 THEN '营销喜报'
WHEN  3 THEN '会员喜报'
WHEN  4 THEN '会员升级'
WHEN  5 THEN '会员降级'
WHEN  6 THEN '会员退费'
WHEN  7 THEN '意向金转业绩'
WHEN  8 THEN '手动新增业绩'
WHEN  9 THEN '拆分业绩'
WHEN  10 THEN '渠道二次喜报'
WHEN  11 THEN '财务顾问'
WHEN  12 THEN '股权'		
ELSE '其他'
END 	 AS SOURCE
--,[FollowId] 
,[ServiceChannelLeader] 接单客服总监,
[SuccessChannelLeader] 完成服务总监,
[DevelopChannelLeader]  发展总监
,[RefundsContactCode]  退费合同
--,[AddSourceId]
,[OrderId]  主订单

FROM DFSSMNG.[dbo].[DataResults] a
left JOIN ( SELECT  b.CltCode ,b.ContractCode  from DFSS_GUANGZHOU.[dbo].[Contract] b 
UNION 
SELECT  b.CltCode ,b.ContractCode  from DFSS_HANGZHOU.[dbo].[Contract] b 
UNION 
SELECT  b.CltCode ,b.ContractCode  from DFSS_HEFEI.[dbo].[Contract] b 
UNION 
SELECT  b.CltCode ,b.ContractCode  from DFSS_NANJING.[dbo].[Contract] b 
UNION 
SELECT  b.CltCode ,b.ContractCode  from DFSS_NINGBO.[dbo].[Contract] b 
UNION 
SELECT  b.CltCode ,b.ContractCode  from DFSS_SHANGHAI.[dbo].[Contract] b 
UNION 
SELECT  b.CltCode ,b.ContractCode  from DFSS_SHENZHEN.[dbo].[Contract] b 
UNION 
SELECT  b.CltCode ,b.ContractCode  from DFSS_SUZHOU.[dbo].[Contract] b 
UNION 
SELECT  b.CltCode ,b.ContractCode  from DFSS_WUXI.[dbo].[Contract] b ) ttt
ON ttt.ContractCode = a.ContractCode
WHERE  A.DealTime BETWEEN '2015-01-01' AND '2015-10-30') YJB
-- A.DealTime BETWEEN (select   dateadd(dd,-day(getdate()),getdate())) AND  CURRENT_TIMESTAMP) YJB
 ON YJB.客户编码= hdb.客户编码
WHERE 
hdb.话单创建时间 >'2015-08-01' AND hdb.话单创建时间<'2015-10-30'
AND   hdb.客户需求额度 > 0

