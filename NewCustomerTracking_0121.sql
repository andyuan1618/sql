/*
basic

 ����	�ֹ�˾	��������	�����ܼ�	���򵥼�	��������	������	������	������	��ͨ��	ת����	ƽ�������	15��ҵ��	30��ҵ��	45��ҵ��	�ۼ�ҵ��	�״β���ʱ��






*/			    





SELECT t.Batch				'����'
,t.Branch 				'�ֹ�˾'
,t.ImportDate			'��������'
,fc.cost				'�����ܼ�'
,isnull(case when batchcnt=0 then 0 else fc.cost*1./fc.batchcnt end ,0)	 '���򵥼�'
,fc.batchcnt		 '��������'
,case when fc.batchcnt=0 then 0 else  (fc.batchcnt-t11.TotoalCount)*1./fc.batchcnt	end '������'
,case when fc.batchcnt=0 then 0 else t11.SuccessCount*1./fc.batchcnt end			'������'
,sum(case when t.FirstCallDate is not null then 1 else 0 end)*1./t11.TotoalCount	'������'
,case when sum(case when t.FirstCallDate is not null then 1 else 0 end)=0 then 0 else  sum(t.isGetThrough)*1./sum(case when t.FirstCallDate is not null then 1 else 0 end) end	'��ͨ��'
,case when sum(t.isGetThrough)=0 then 0 else    sum(t.isEnterProcess)*1./ sum(t.isGetThrough) end 				'ת����'
,sum(t.requireamount)/sum(case when t.requireamount>0 then 1 else 0 end) 				'ƽ�������'
,isnull(sum(t.ServiceTotal_5days),0)  '5��ҵ��'
,isnull(sum(t.ServiceTotal_15days),0)  '15��ҵ��'
,isnull(sum(t.ServiceTotal_30days),0)  '30��ҵ��'
,isnull(sum(t.ServiceTotal_45days),0)  '45��ҵ��'
,isnull(sum(t.ServiceTotal),0)  '��ҵ��'
,t8.FirstCall				'�״β���ʱ��'	

, (fc.batchcnt-t11.TotoalCount)  '����������' 
,t11.SuccessCount   '�ɹ�������'
,isnull(sum(case when t.FirstCallDate is not null then 1 else 0 end),0)    '������'
,isnull(sum(t.isGetThrough) ,0)   '�ײ���ͨ��'
,isnull(sum(t.isEnterProcess),0)   '�ײ���Ч������'
,isnull(sum(t.RequireAmount),0)    '������'
,isnull(count(t.RequireAmount),0)    '�ͻ���'
,sum(t.calls)  '�������' 
, sum(t.getThroughs)  '��ͨ����' 


  
 into #basic

FROM [DFSS_BI].[dbo].[TelemarketingDetail] t with(nolock)
inner join 
(
SELECT  t.Batch
      ,min(t.FirstCallDate) FirstCall
FROM [DFSS_BI].[dbo].[TelemarketingDetail]  t
group by  t.Batch
) t8 	on t.batch=t8.batch


inner join DFSS_BI..UserInfo u  with(nolock) on t.Clt_Code=u.CLT_CODE
inner join dfss_bi..filecost fc  with(nolock) on fc.[filename]=t.Batch

--SUCCESSCOUNT
left join 
(

select t1.FileName,sum(t1.SuccessCount) 'SuccessCount',sum(t1.TotoalCount) 'TotoalCount'
from 
(


SELECT f.FileName,n.totoalcount,n.successcount
FROM [DFSS_GUANGZHOU].[dbo].[NewCustomerBatchCode] n  with(nolock)
inner join DFSS_GUANGZHOU..newcustomerfile f on n.NewCustomerFileID=f.NewCustomerFileID
where n.SuccessCount>10

union all

SELECT f.FileName,n.totoalcount,n.successcount
FROM [DFSS_hangzhou].[dbo].[NewCustomerBatchCode] n  with(nolock)
inner join DFSS_hangzhou..newcustomerfile f on n.NewCustomerFileID=f.NewCustomerFileID
where n.SuccessCount>10

union all

SELECT f.FileName,n.totoalcount,n.successcount
FROM [DFSS_hefei].[dbo].[NewCustomerBatchCode] n  with(nolock)
inner join DFSS_hefei..newcustomerfile f on n.NewCustomerFileID=f.NewCustomerFileID
where n.SuccessCount>10

union all

SELECT f.FileName,n.totoalcount,n.successcount
FROM [DFSS_NANJING].[dbo].[NewCustomerBatchCode] n  with(nolock)
inner join DFSS_NANJING..newcustomerfile f on n.NewCustomerFileID=f.NewCustomerFileID
where n.SuccessCount>10

union all

SELECT f.FileName,n.totoalcount,n.successcount
FROM [DFSS_NINGBO].[dbo].[NewCustomerBatchCode] n  with(nolock)
inner join DFSS_NINGBO..newcustomerfile f on n.NewCustomerFileID=f.NewCustomerFileID
where n.SuccessCount>10

union all

SELECT f.FileName,n.totoalcount,n.successcount
FROM [DFSS_SHANGHAI].[dbo].[NewCustomerBatchCode] n  with(nolock)
inner join DFSS_SHANGHAI..newcustomerfile f on n.NewCustomerFileID=f.NewCustomerFileID
where n.SuccessCount>10

union all

SELECT f.FileName,n.totoalcount,n.successcount
FROM [DFSS_SHENZHEN].[dbo].[NewCustomerBatchCode] n  with(nolock)
inner join DFSS_SHENZHEN..newcustomerfile f on n.NewCustomerFileID=f.NewCustomerFileID
where n.SuccessCount>10

union all

SELECT f.FileName,n.totoalcount,n.successcount
FROM [DFSS_SUZHOU].[dbo].[NewCustomerBatchCode] n  with(nolock)
inner join DFSS_SUZHOU..newcustomerfile f on n.NewCustomerFileID=f.NewCustomerFileID
where n.SuccessCount>10

union all

SELECT f.FileName,n.totoalcount,n.successcount
FROM [DFSS_WUXI].[dbo].[NewCustomerBatchCode] n  with(nolock)
inner join DFSS_WUXI..newcustomerfile f on n.NewCustomerFileID=f.NewCustomerFileID
where n.SuccessCount>10
 
)  t1  
 

group by t1.FileName
 
 
)  t11 on t11.FileName=t.Batch
 														 
group by  t.Batch,t.Branch,t.ImportDate,fc.cost,t11.TotoalCount,t11.SuccessCount ,fc.batchcnt,t8.FirstCall


/*


�ײ�����Ͷ����	ҵ��Ͷ����	�ײ�����������	ҵ��������
9���ײ�����Ͷ����=��������*��1-�����ʣ�*������*��ͨ��*ת����*ƽ�������*315/10/((�����ܼ�+��������*2��*������)
10��n��ҵ��Ͷ����=n���Ѳ�������ҵ��/��n���Ѳ���������*���򵥼�+n���Ѳ���������*2������ȷ�ϣ����������ǻ���������˼��
12���ײ�����������=����������*��1-�����ʣ�*������*��ͨ��*ת����*ƽ�������*315/10-�����ܼ�*������-��������*������*2��/��������*������
11��n��ҵ��������=��n��ҵ��-�����ܼ�*�����ʣ�/(��������*������)-2
*/




select  
b.*
--�ײ�����Ͷ����=��������*��1-�����ʣ�*������*��ͨ��*ת����*ƽ�������*315/10/((�����ܼ�+��������*2��*������)

, b.��������*(1-b.������)*b.������*b.��ͨ��*b.ת����*b.ƽ�������*315/10/((B.�����ܼ�+B.��������*2)*B.������) '�ײ�����Ͷ����'

--�ײ�����������=����������*��1-�����ʣ�*������*��ͨ��*ת����*ƽ�������*315/10-�����ܼ�*������-��������*������*2��/��������*������
,case when ��������*������=0 then 0 else   (��������*(1-������)*������*��ͨ��*ת����*ƽ�������*315/10-�����ܼ�*������-��������*������*2)/��������*������ end '�ײ�����������'

--n��ҵ��Ͷ����=n���Ѳ�������ҵ��/��n���Ѳ���������*���򵥼�+n���Ѳ���������*2��
,CASE WHEN (������*���򵥼�+������*2)=0 THEN 0 ELSE ��ҵ��/(������*���򵥼�+������*2) END 'ҵ��Ͷ����'

--n��ҵ��������=��n��ҵ��-�����ܼ�*�����ʣ�/(��������*������)-2
,CASE WHEN (��������*������)=0 THEN 0 ELSE (��ҵ��-�����ܼ�*������)/(��������*������)-2 END 'ҵ��������'

from #basic b



drop table #basic

