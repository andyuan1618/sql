SELECT   hdb.*, 
YJB.ʵ�շ� AS ҵ�� ,
YJB.�ɽ�ʱ��


FROM 

(select
 '����'        �ֹ�˾,
 c.FileName �ļ�,
 C.CreateTime ��������ʱ��,
q.CREATE_DATE  ����ϵͳʱ��,
q.CLT_CODE �ͻ�����,
e.RQR_AMOUNT �ͻ�������
,c.[NewCltSourceType] ��������
,case q.CLT_TYPE  
when 1   then  '��ҵ��'
when 2   then  '���廧'

when 3   then  '��н��'
else '����' end  �ͻ����,
case q.[CLT_EXE_STATUS]	
when 0 then '����ϵ' 	
when 1 then '������' 	
when 10 then 'δ��ϵ' 	
when 2 then '������' 	
when 3 then '������' 	
when 4 then '��ǩԼ'	
when 5 then '����ɽ�'	
when 6 then '��Ա�ɽ�'	
else '����' end   ��ǰ���� 
from  DFSS_GUANGZHOU.[dbo].[SAL_CLT_BASE] q
LEFT join DFSS_GUANGZHOU.dbo.NewCustomerBatchCode bb ON q.NewCustomerBatchCodeID =bb.NewCustomerBatchCodeID
LEFT JOIN DFSS_GUANGZHOU.dbo.NewCustomerFile c ON c.NewCustomerFileID = bb.NewCustomerFileID
LEFT JOIN DFSS_GUANGZHOU.dbo.SAL_CLT_REQUIRE e ON q.CLT_CODE =e.CLT_CODE
union
select
 '����'        �ֹ�˾,
 c.FileName �ļ�,
  C.CreateTime ��������ʱ��,
q.CREATE_DATE  ����ϵͳʱ��,
q.CLT_CODE �ͻ�����,
e.RQR_AMOUNT �ͻ�������
,c.[NewCltSourceType] ��������
,case q.CLT_TYPE  
when 1   then  '��ҵ��'
when 2   then  '���廧'
when 3   then  '��н��'
else '����' end  �ͻ����,
case q.[CLT_EXE_STATUS]	
when 0 then '����ϵ' 	
when 1 then '������' 	
when 10 then 'δ��ϵ' 	
when 2 then '������' 	
when 3 then '������' 	
when 4 then '��ǩԼ'	
when 5 then '����ɽ�'	
when 6 then '��Ա�ɽ�'	
else '����' end   ��ǰ���� 
from DFSS_HANGZHOU.[dbo].[SAL_CLT_BASE] q
LEFT join DFSS_HANGZHOU.dbo.NewCustomerBatchCode bb ON q.NewCustomerBatchCodeID =bb.NewCustomerBatchCodeID
LEFT JOIN DFSS_HANGZHOU.dbo.NewCustomerFile c ON c.NewCustomerFileID = bb.NewCustomerFileID
LEFT JOIN DFSS_HANGZHOU.dbo.SAL_CLT_REQUIRE e ON q.CLT_CODE =e.CLT_CODE
union
select
 '�Ϸ�'        �ֹ�˾,
 c.FileName �ļ�,
  C.CreateTime ��������ʱ��,
q.CREATE_DATE  ����ϵͳʱ��,
q.CLT_CODE �ͻ�����,
e.RQR_AMOUNT �ͻ�������
,c.[NewCltSourceType] ��������
,case q.CLT_TYPE  
when 1   then  '��ҵ��'
when 2   then  '���廧'
when 3   then  '��н��'
else '����' end  �ͻ����,
case q.[CLT_EXE_STATUS]	
when 0 then '����ϵ' 	
when 1 then '������' 	
when 10 then 'δ��ϵ' 	
when 2 then '������' 	
when 3 then '������' 	
when 4 then '��ǩԼ'	
when 5 then '����ɽ�'	
when 6 then '��Ա�ɽ�'	
else '����' end   ��ǰ���� 
from DFSS_HEFEI.[dbo].[SAL_CLT_BASE] q
LEFT join DFSS_HEFEI.dbo.NewCustomerBatchCode bb ON q.NewCustomerBatchCodeID =bb.NewCustomerBatchCodeID
LEFT JOIN DFSS_HEFEI.dbo.NewCustomerFile c ON c.NewCustomerFileID = bb.NewCustomerFileID
LEFT JOIN DFSS_HEFEI.dbo.SAL_CLT_REQUIRE e ON q.CLT_CODE =e.CLT_CODE
union
select
 '�Ͼ�'        �ֹ�˾,
 c.FileName �ļ�,
  C.CreateTime ��������ʱ��,
q.CREATE_DATE  ����ϵͳʱ��,
q.CLT_CODE �ͻ�����,
e.RQR_AMOUNT �ͻ�������
,c.[NewCltSourceType] ��������
,case q.CLT_TYPE  
when 1   then  '��ҵ��'
when 2   then  '���廧'
when 3   then  '��н��'
else '����' end  �ͻ����,
case q.[CLT_EXE_STATUS]	
when 0 then '����ϵ' 	
when 1 then '������' 	
when 10 then 'δ��ϵ' 	
when 2 then '������' 	
when 3 then '������' 	
when 4 then '��ǩԼ'	
when 5 then '����ɽ�'	
when 6 then '��Ա�ɽ�'	
else '����' end   ��ǰ���� 
from DFSS_NANJING.[dbo].[SAL_CLT_BASE] q
LEFT JOIN DFSS_NANJING.dbo.NewCustomerBatchCode bb ON q.NewCustomerBatchCodeID =bb.NewCustomerBatchCodeID
LEFT JOIN DFSS_NANJING.dbo.NewCustomerFile c ON c.NewCustomerFileID = bb.NewCustomerFileID
LEFT JOIN DFSS_NANJING.dbo.SAL_CLT_REQUIRE e ON q.CLT_CODE =e.CLT_CODE
union
select
 '����'        �ֹ�˾,
 c.FileName �ļ�,
  C.CreateTime ��������ʱ��,
q.CREATE_DATE  ����ϵͳʱ��,
q.CLT_CODE �ͻ�����,
e.RQR_AMOUNT �ͻ�������
,c.[NewCltSourceType] ��������
,case q.CLT_TYPE  
when 1   then  '��ҵ��'
when 2   then  '���廧'
when 3   then  '��н��'
else '����' end  �ͻ����,
case q.[CLT_EXE_STATUS]	
when 0 then '����ϵ' 	
when 1 then '������' 	
when 10 then 'δ��ϵ' 	
when 2 then '������' 	
when 3 then '������' 	
when 4 then '��ǩԼ'	
when 5 then '����ɽ�'	
when 6 then '��Ա�ɽ�'	
else '����' end   ��ǰ���� 
from DFSS_NINGBO.[dbo].[SAL_CLT_BASE] q
LEFT JOIN DFSS_NINGBO.dbo.NewCustomerBatchCode bb ON q.NewCustomerBatchCodeID =bb.NewCustomerBatchCodeID
LEFT JOIN DFSS_NINGBO.dbo.NewCustomerFile c ON c.NewCustomerFileID = bb.NewCustomerFileID
LEFT JOIN DFSS_NINGBO.dbo.SAL_CLT_REQUIRE e ON q.CLT_CODE =e.CLT_CODE
union
select
 '�Ϻ�'        �ֹ�˾,
 c.FileName �ļ�,
  C.CreateTime ��������ʱ��,
q.CREATE_DATE  ����ϵͳʱ��,
q.CLT_CODE �ͻ�����,
e.RQR_AMOUNT �ͻ�������
,c.[NewCltSourceType] ��������
,case q.CLT_TYPE  
when 1   then  '��ҵ��'
when 2   then  '���廧'
when 3   then  '��н��'
else '����' end  �ͻ����,
case q.[CLT_EXE_STATUS]	
when 0 then '����ϵ' 	
when 1 then '������' 	
when 10 then 'δ��ϵ' 	
when 2 then '������' 	
when 3 then '������' 	
when 4 then '��ǩԼ'	
when 5 then '����ɽ�'	
when 6 then '��Ա�ɽ�'	
else '����' end   ��ǰ���� 
from DFSS_SHANGHAI.[dbo].[SAL_CLT_BASE] q
LEFT JOIN DFSS_SHANGHAI.dbo.NewCustomerBatchCode bb ON q.NewCustomerBatchCodeID =bb.NewCustomerBatchCodeID
LEFT JOIN DFSS_SHANGHAI.dbo.NewCustomerFile c ON c.NewCustomerFileID = bb.NewCustomerFileID
LEFT JOIN DFSS_SHANGHAI.dbo.SAL_CLT_REQUIRE e ON q.CLT_CODE =e.CLT_CODE
union
select
 '����'        �ֹ�˾,
 c.FileName �ļ�,
  C.CreateTime ��������ʱ��,
q.CREATE_DATE  ����ϵͳʱ��,
q.CLT_CODE �ͻ�����,
e.RQR_AMOUNT �ͻ�������
,c.[NewCltSourceType] ��������
,case q.CLT_TYPE  
when 1   then  '��ҵ��'
when 2   then  '���廧'
when 3   then  '��н��'
else '����' end  �ͻ����,
case q.[CLT_EXE_STATUS]	
when 0 then '����ϵ' 	
when 1 then '������' 	
when 10 then 'δ��ϵ' 	
when 2 then '������' 	
when 3 then '������' 	
when 4 then '��ǩԼ'	
when 5 then '����ɽ�'	
when 6 then '��Ա�ɽ�'	
else '����' end   ��ǰ���� 
from DFSS_SHENZHEN.[dbo].[SAL_CLT_BASE] q
LEFT join DFSS_SHENZHEN.dbo.NewCustomerBatchCode bb ON q.NewCustomerBatchCodeID =bb.NewCustomerBatchCodeID
LEFT JOIN DFSS_SHENZHEN.dbo.NewCustomerFile c ON c.NewCustomerFileID = bb.NewCustomerFileID
LEFT JOIN DFSS_SHENZHEN.dbo.SAL_CLT_REQUIRE e ON q.CLT_CODE =e.CLT_CODE
union
select
 '����'        �ֹ�˾,
 c.FileName �ļ�,
  C.CreateTime ��������ʱ��,
q.CREATE_DATE  ����ϵͳʱ��,
q.CLT_CODE �ͻ�����,
e.RQR_AMOUNT �ͻ�������
,c.[NewCltSourceType] ��������
,case q.CLT_TYPE  
when 1   then  '��ҵ��'
when 2   then  '���廧'
when 3   then  '��н��'
else '����' end  �ͻ����,
case q.[CLT_EXE_STATUS]	
when 0 then '����ϵ' 	
when 1 then '������' 	
when 10 then 'δ��ϵ' 	
when 2 then '������' 	
when 3 then '������' 	
when 4 then '��ǩԼ'	
when 5 then '����ɽ�'	
when 6 then '��Ա�ɽ�'	
else '����' end   ��ǰ���� 
from DFSS_SUZHOU.[dbo].[SAL_CLT_BASE] q
LEFT join DFSS_SUZHOU.dbo.NewCustomerBatchCode bb ON q.NewCustomerBatchCodeID =bb.NewCustomerBatchCodeID
LEFT JOIN DFSS_SUZHOU.dbo.NewCustomerFile c ON c.NewCustomerFileID = bb.NewCustomerFileID
LEFT JOIN DFSS_SUZHOU.dbo.SAL_CLT_REQUIRE e ON q.CLT_CODE =e.CLT_CODE
union
select
 '����'        �ֹ�˾,
 c.FileName �ļ�,
  C.CreateTime ��������ʱ��,
q.CREATE_DATE  ����ϵͳʱ��,
q.CLT_CODE �ͻ�����,
e.RQR_AMOUNT �ͻ�������
,c.[NewCltSourceType] ��������
,case q.CLT_TYPE  
when 1   then  '��ҵ��'
when 2   then  '���廧'
when 3   then  '��н��'
else '����' end  �ͻ����,
case q.[CLT_EXE_STATUS]	
when 0 then '����ϵ' 	
when 1 then '������' 	
when 10 then 'δ��ϵ' 	
when 2 then '������' 	
when 3 then '������' 	
when 4 then '��ǩԼ'	
when 5 then '����ɽ�'	
when 6 then '��Ա�ɽ�'	
else '����' end   ��ǰ���� 
from DFSS_WUXI.[dbo].[SAL_CLT_BASE] q
LEFT join DFSS_WUXI.dbo.NewCustomerBatchCode bb ON q.NewCustomerBatchCodeID =bb.NewCustomerBatchCodeID
LEFT JOIN DFSS_WUXI.dbo.NewCustomerFile c ON c.NewCustomerFileID = bb.NewCustomerFileID
LEFT JOIN DFSS_WUXI.dbo.SAL_CLT_REQUIRE e ON q.CLT_CODE =e.CLT_CODE ) hdb
LEFT JOIN  (SELECT  
[DataResultsId] �ɱ�ʶ��
,[DealTime] �ɽ�ʱ��
,ISNULL([ThisReceivables],0) �����տ�
,[ThisReceivablesTime] �����տ�ʱ��
,ISNULL(IntentionAmount,0) �����
,ISNULL(ThisServiceAmount,0)  ʵ�շ�
,[DealDepart] �ɽ����ű���
,[DealDepartLeader] �Ŷ��ܼ�
,[DealTeam] �ɽ��Ŷӱ���
,[DealTeamLeader] �ŶӾ���
,[DealSales] �ɽ�����
,ISNULL(SalesResult,0)   �ɽ�ҵ��
,[OperationsResult]  �г�ҵ��
-- ,[FinanceResult]   
,[ChannelTeam] �ͷ��Ŷ�
,[ChannelEmp] �ͷ�����
,ISNULL(ChannelResult,0)  �ͷ�ҵ��
,[RefundsTime]  ��ʷ�ɽ�����
,ISNULL(RefundsAmount,0)    �˷��ܶ�
,ISNULL(SalesRefundsAmount,0) Ӫ���˷�
,ISNULL(OperationsRefundsAmount,0)  �г��˷�
--,[FinanceRefundsAmount]  
,a.[ContractCode] ��ͬ��,
ttt.CltCode �ͻ�����
,CASE CityCode
WHEN 'GUANGZHOU' THEN '����'
WHEN 'HANGZHOU' THEN '����'
WHEN 'HEFEI' THEN '�Ϸ�'
WHEN 'NANJING' THEN '�Ͼ�'
WHEN 'NINGBO' THEN '����'
WHEN 'SHANGHAI' THEN '�Ϻ�'
WHEN 'SUZHOU' THEN '����'
WHEN 'WUXI' THEN '����'
WHEN 'SHENZHEN' THEN '����'
ELSE '����'
end ����
,a.[SubOrderId] �Ӷ������
,[SuccessChannelTeam]    ����Ŷӱ���
,[SuccessChannelEmp]    ��ɾ���
,ISNULL(SuccessChannelResult,0) ���ҵ��
,[DevelopChannelTeam]  ��չ�Ŷӱ���
,[DevelopChannelEmp]  ������չ
,ISNULL(DevelopChannelResult,0) ��չҵ��
,[DealDepartName]    �ɽ�����
,[DealTeamName]  �ɽ��Ŷ�
,[ServiceChannelName]   �ӵ��Ŷ�
,[DevelopChannelName]  ��չ�Ŷ�
,[SuccessChannelName]  ����Ŷ�
,[DealCompanyLeader]   Ӫ������
,[DealAreaLeader] Ӫ������
,[OperationTeam]  �г��Ŷ�
,[OperationLeader] �г��ܼ�
,[OperationServicer] �г��ͷ�
,[ChannelAreaLeader] �����ܼ�
,[ChannelTotalResult] ������ҵ��
,[GuquanTeam] ��Ȩ�Ŷ�
,[GuquanService]  ��Ȩ�ͷ�
,ISNULL(GuquanResult,0) ��Ȩҵ��
--,[ViewStatu] AS SOURCE
,CASE a.ViewStatu 
WHEN  1 THEN '����ϲ��'
WHEN  2 THEN 'Ӫ��ϲ��'
WHEN  3 THEN '��Աϲ��'
WHEN  4 THEN '��Ա����'
WHEN  5 THEN '��Ա����'
WHEN  6 THEN '��Ա�˷�'
WHEN  7 THEN '�����תҵ��'
WHEN  8 THEN '�ֶ�����ҵ��'
WHEN  9 THEN '���ҵ��'
WHEN  10 THEN '��������ϲ��'
WHEN  11 THEN '�������'
WHEN  12 THEN '��Ȩ'		
ELSE '����'
END 	 AS SOURCE
--,[FollowId] 
,[ServiceChannelLeader] �ӵ��ͷ��ܼ�,
[SuccessChannelLeader] ��ɷ����ܼ�,
[DevelopChannelLeader]  ��չ�ܼ�
,[RefundsContactCode]  �˷Ѻ�ͬ
--,[AddSourceId]
,[OrderId]  ������

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
 ON YJB.�ͻ�����= hdb.�ͻ�����
WHERE 
hdb.��������ʱ�� >'2015-08-01' AND hdb.��������ʱ��<'2015-10-30'
AND   hdb.�ͻ������� > 0

