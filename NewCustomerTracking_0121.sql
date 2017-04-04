/*
basic

 话单	分公司	导入日期	购买总价	购买单价	购买数量	废弃率	新增率	拨打率	接通率	转化率	平均需求额	15天业绩	30天业绩	45天业绩	累计业绩	首次拨打时间






*/			    





SELECT t.Batch				'话单'
,t.Branch 				'分公司'
,t.ImportDate			'导入日期'
,fc.cost				'购买总价'
,isnull(case when batchcnt=0 then 0 else fc.cost*1./fc.batchcnt end ,0)	 '购买单价'
,fc.batchcnt		 '购买数量'
,case when fc.batchcnt=0 then 0 else  (fc.batchcnt-t11.TotoalCount)*1./fc.batchcnt	end '废弃率'
,case when fc.batchcnt=0 then 0 else t11.SuccessCount*1./fc.batchcnt end			'新增率'
,sum(case when t.FirstCallDate is not null then 1 else 0 end)*1./t11.TotoalCount	'拨打率'
,case when sum(case when t.FirstCallDate is not null then 1 else 0 end)=0 then 0 else  sum(t.isGetThrough)*1./sum(case when t.FirstCallDate is not null then 1 else 0 end) end	'接通率'
,case when sum(t.isGetThrough)=0 then 0 else    sum(t.isEnterProcess)*1./ sum(t.isGetThrough) end 				'转化率'
,sum(t.requireamount)/sum(case when t.requireamount>0 then 1 else 0 end) 				'平均需求额'
,isnull(sum(t.ServiceTotal_5days),0)  '5天业绩'
,isnull(sum(t.ServiceTotal_15days),0)  '15天业绩'
,isnull(sum(t.ServiceTotal_30days),0)  '30天业绩'
,isnull(sum(t.ServiceTotal_45days),0)  '45天业绩'
,isnull(sum(t.ServiceTotal),0)  '总业绩'
,t8.FirstCall				'首次拨打时间'	

, (fc.batchcnt-t11.TotoalCount)  '废弃话单量' 
,t11.SuccessCount   '成功新增量'
,isnull(sum(case when t.FirstCallDate is not null then 1 else 0 end),0)    '拨打量'
,isnull(sum(t.isGetThrough) ,0)   '首拨接通量'
,isnull(sum(t.isEnterProcess),0)   '首拨有效进程量'
,isnull(sum(t.RequireAmount),0)    '需求额度'
,isnull(count(t.RequireAmount),0)    '客户数'
,sum(t.calls)  '拨打次数' 
, sum(t.getThroughs)  '接通次数' 


  
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


首拨需求投产比	业绩投产比	首拨需求利润率	业绩利润率
9、首拨需求投产比=购买数量*（1-废弃率）*拨打率*接通率*转化率*平均需求额*315/10/((购买总价+购买数量*2）*拨打率)
10、n天业绩投产比=n天已拨打粒子业绩/（n天已拨打粒子量*购买单价+n天已拨打粒子量*2）；经确认，粒子量就是话单量的意思。
12、首拨需求利润率=（购买数量*（1-废弃率）*拨打率*接通率*转化率*平均需求额*315/10-购买总价*拨打率-购买数量*拨打率*2）/购买数量*拨打率
11、n天业绩利润率=（n天业绩-购买总价*拨打率）/(购买总数*拨打率)-2
*/




select  
b.*
--首拨需求投产比=购买数量*（1-废弃率）*拨打率*接通率*转化率*平均需求额*315/10/((购买总价+购买数量*2）*拨打率)

, b.购买数量*(1-b.废弃率)*b.拨打率*b.接通率*b.转化率*b.平均需求额*315/10/((B.购买总价+B.购买数量*2)*B.拨打率) '首拨需求投产比'

--首拨需求利润率=（购买数量*（1-废弃率）*拨打率*接通率*转化率*平均需求额*315/10-购买总价*拨打率-购买数量*拨打率*2）/购买数量*拨打率
,case when 购买数量*拨打率=0 then 0 else   (购买数量*(1-废弃率)*拨打率*接通率*转化率*平均需求额*315/10-购买总价*拨打率-购买数量*拨打率*2)/购买数量*拨打率 end '首拨需求利润率'

--n天业绩投产比=n天已拨打粒子业绩/（n天已拨打粒子量*购买单价+n天已拨打粒子量*2）
,CASE WHEN (拨打量*购买单价+拨打量*2)=0 THEN 0 ELSE 总业绩/(拨打量*购买单价+拨打量*2) END '业绩投产比'

--n天业绩利润率=（n天业绩-购买总价*拨打率）/(购买总数*拨打率)-2
,CASE WHEN (购买数量*拨打率)=0 THEN 0 ELSE (总业绩-购买总价*拨打率)/(购买数量*拨打率)-2 END '业绩利润率'

from #basic b



drop table #basic

