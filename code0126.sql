



select	t.Batch,
       sum(c.sum_billsecond)  '累计通话时长' ,
	   sum(case when c.sum_billsecond=0 then 1 else 0 end)    通话时长为0的数量,	
        sum(case when c.sum_billsecond=0 then 1 else 0 end)*1.0/count(*)   通话时长为0占比,	
        avg(c.avg_billsecond)   平均单通通话时长,	
        avg(c.cnt)   话单平均拨打次数,	
       avg(c.sum_billsecond)    客户平均通话时长 
	   into #t1
from  dfss_bi..TelemarketingDetail t 
LEFT join 
(select	d.Clt_Code,sum(d.BillSecond) sum_billsecond,count(d.BillSecond) cnt,avg(d.BillSecond) avg_billsecond 
 from DFSS_BI..CallDetails  d 
 group by d.Clt_Code) c on t.Clt_Code=c.Clt_Code
 group by t.Batch



 select a.Batch,avg(b.Amount)单均业绩产出,count(b.ContractCode)成交单数 
 into #t2
 from TelemarketingDetail a
 left join ServiceFeeDetails b on a.clt_code=b.Clt_Code
 where b.Amount>0
 group by a.Batch


 select a.Batch,COUNT(*)公海1 
 into #t3 
 from TelemarketingDetail a
 where a.CltStatus='3'
 group by a.Batch


select case when a.分公司='guangzhou' then '广州'
            when a.分公司='hangzhou' then '杭州'
			when a.分公司='hefei' then '合肥'
			when a.分公司='nanjing' then '南京'
			when a.分公司='ningbo' then '宁波'
			when a.分公司='shanghai' then '上海'
			when a.分公司='shenzhen' then '深圳'
			when a.分公司='suzhou' then '苏州'
			when a.分公司='wuxi' then '无锡' end as 分公司
,a.导入日期,a.话单,a.购买单价,a.购买数量,b.累计通话时长,a.拨打次数,b.通话时长为0的数量,b.通话时长为0占比
,b.平均单通通话时长,b.话单平均拨打次数,b.客户平均通话时长,a.转化率,a.客户数,a.平均需求额,a.需求额度,c.成交单数,a.总业绩
,d.公海1,e.未联系,f.已联系,g.需求及以上进程
from NewCustomerTracking a
left join #t1 b on a.话单=b.Batch
left join #t2 c on a.话单=c.Batch
left join #t3 d on a.话单=d.Batch
left join (select a.Batch,count(*)未联系 from TelemarketingDetail a where calls=0 group by Batch)e on a.话单=e.Batch
left join (select a.Batch,count(*)已联系 from TelemarketingDetail a where calls>0 group by Batch)f on a.话单=f.Batch
left join (select a.Batch,count(*)需求及以上进程 from TelemarketingDetail a where isEnterProcess=1 group by Batch)g on a.话单=g.Batch
order by case when a.分公司='guangzhou' then '广州'
            when a.分公司='hangzhou' then '杭州'
			when a.分公司='hefei' then '合肥'
			when a.分公司='nanjing' then '南京'
			when a.分公司='ningbo' then '宁波'
			when a.分公司='shanghai' then '上海'
			when a.分公司='shenzhen' then '深圳'
			when a.分公司='suzhou' then '苏州'
			when a.分公司='wuxi' then '无锡' end
,2


 drop table #t2
	drop table #t1	  
	drop table #t3