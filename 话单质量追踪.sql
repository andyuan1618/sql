select	year(c.CallDate) yy,				
        month(c.CallDate) mm,				
		u.Branch,				
		case when  year(c.CallDate)=year(u.importdate) and  month(c.CallDate)=month(u.importdate) then '��' else '��' end 'UserType',
		COUNT(DISTINCT c.Clt_Code)  '������'	
into #boda						
							
from							
(select *						
FROM [DFSS_BI].[dbo].[CallDetails] 				
 							
union 							
							
select *							
FROM [DFSS_BI].[dbo].[CallDetails_2015]			
where CallDate>'2015/7/1' 					
 )c 							
inner join dfss_bi..UserInfo u on c.Clt_Code = u.CLT_CODE	
group by year(c.CallDate) ,				
        month(c.CallDate) ,				
		case when  year(c.CallDate)=year(u.importdate) and  month(c.CallDate)=month(u.importdate) then '��' else '��' end	  ,				
		u.Branch					
							
							
							
select	year(c.CallDate) yy,				
        month(c.CallDate) mm,				
		u.Branch,				
		case when  year(c.CallDate)=year(u.importdate) and  month(c.CallDate)=month(u.importdate) then '��' else '��' end 'UserType',
		COUNT(DISTINCT c.Clt_Code)  '��ͨ��'	
							
into #jietong						
from (select *						
FROM [DFSS_BI].[dbo].[CallDetails] 				
 							
union 							
							
select *							
FROM [DFSS_BI].[dbo].[CallDetails_2015]			
where CallDate>'2015/7/1' 					
 ) c 							
inner join dfss_bi..UserInfo u on c.Clt_Code = u.CLT_CODE	
where c.IsGetThrough=1					
group by year(c.CallDate) ,				
        month(c.CallDate) ,				
		case when  year(c.CallDate)=year(u.importdate) and  month(c.CallDate)=month(u.importdate) then '��' else '��' end	,				
		u.Branch					
							
							
							
							
 --- ��Ч�û�						
							
							
  							
SELECT   year(c.createtime) yy ,month(c.createtime) mm,c.CITY ,
       case when  year(c.createtime)=year(u.importdate) and  month(c.createtime)=month(u.importdate) then '��' else '��' end 'UserType',
	   COUNT(DISTINCT C.CLTCODE) '��Ч�û�'		
into #youxiao						
							
FROM [DFSS_BI].[dbo].[CustomerExeStatusChangeHistoryId_Combined]	 c						
inner join dfss_bi..UserInfo u on c.CltCode = u.CLT_CODE	
where c.AfterExeStatus IN (1,2,3,4,5,6)			
group by year(c.createtime)  ,month(c.createtime) ,c.CITY ,	
       case when  year(c.createtime)=year(u.importdate) and  month(c.createtime)=month(u.importdate) then '��' else '��' end
							
	   						
							
							
							
SELECT   year(c.DealTime) yy ,month(c.DealTime) mm,u.Branch ,	
       case when  year(c.DealTime)=year(u.importdate) and  month(c.DealTime)=month(u.importdate) then '��' else '��' end 'UserType',
	   sum(c.amount) 'ҵ��'				
into #fee						
FROM dfss_bi..ServiceFeeDetails	 c						
inner join dfss_bi..UserInfo u on c.Clt_Code = u.CLT_CODE 	
where c.Amount>0						
group by year(c.DealTime)  ,month(c.DealTime) ,u.Branch ,	
       case when  year(c.DealTime)=year(u.importdate) and  month(c.DealTime)=month(u.importdate) then '��' else '��' end
							
							
							
							
select b.*,j.��ͨ��,y.��Ч�û�,f.ҵ��			
from #boda b						
left join #jietong j on b.Branch=j.Branch and b.yy=j.yy and b.mm=j.mm and b.UserType=j.UserType
left join #youxiao y on b.Branch=y.CITY and b.yy=y.yy and b.mm=y.mm and b.UserType=y.UserType
left join #fee f on b.Branch=f.Branch and b.yy=f.yy and b.mm=f.mm and b.UserType=f.UserType
							
drop table #boda						
drop table #fee						
drop table #jietong					
drop table #youxiao					
	   						
	   						

