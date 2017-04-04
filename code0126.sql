



select	t.Batch,
       sum(c.sum_billsecond)  '�ۼ�ͨ��ʱ��' ,
	   sum(case when c.sum_billsecond=0 then 1 else 0 end)    ͨ��ʱ��Ϊ0������,	
        sum(case when c.sum_billsecond=0 then 1 else 0 end)*1.0/count(*)   ͨ��ʱ��Ϊ0ռ��,	
        avg(c.avg_billsecond)   ƽ����ͨͨ��ʱ��,	
        avg(c.cnt)   ����ƽ���������,	
       avg(c.sum_billsecond)    �ͻ�ƽ��ͨ��ʱ�� 
	   into #t1
from  dfss_bi..TelemarketingDetail t 
LEFT join 
(select	d.Clt_Code,sum(d.BillSecond) sum_billsecond,count(d.BillSecond) cnt,avg(d.BillSecond) avg_billsecond 
 from DFSS_BI..CallDetails  d 
 group by d.Clt_Code) c on t.Clt_Code=c.Clt_Code
 group by t.Batch



 select a.Batch,avg(b.Amount)����ҵ������,count(b.ContractCode)�ɽ����� 
 into #t2
 from TelemarketingDetail a
 left join ServiceFeeDetails b on a.clt_code=b.Clt_Code
 where b.Amount>0
 group by a.Batch


 select a.Batch,COUNT(*)����1 
 into #t3 
 from TelemarketingDetail a
 where a.CltStatus='3'
 group by a.Batch


select case when a.�ֹ�˾='guangzhou' then '����'
            when a.�ֹ�˾='hangzhou' then '����'
			when a.�ֹ�˾='hefei' then '�Ϸ�'
			when a.�ֹ�˾='nanjing' then '�Ͼ�'
			when a.�ֹ�˾='ningbo' then '����'
			when a.�ֹ�˾='shanghai' then '�Ϻ�'
			when a.�ֹ�˾='shenzhen' then '����'
			when a.�ֹ�˾='suzhou' then '����'
			when a.�ֹ�˾='wuxi' then '����' end as �ֹ�˾
,a.��������,a.����,a.���򵥼�,a.��������,b.�ۼ�ͨ��ʱ��,a.�������,b.ͨ��ʱ��Ϊ0������,b.ͨ��ʱ��Ϊ0ռ��
,b.ƽ����ͨͨ��ʱ��,b.����ƽ���������,b.�ͻ�ƽ��ͨ��ʱ��,a.ת����,a.�ͻ���,a.ƽ�������,a.������,c.�ɽ�����,a.��ҵ��
,d.����1,e.δ��ϵ,f.����ϵ,g.�������Ͻ���
from NewCustomerTracking a
left join #t1 b on a.����=b.Batch
left join #t2 c on a.����=c.Batch
left join #t3 d on a.����=d.Batch
left join (select a.Batch,count(*)δ��ϵ from TelemarketingDetail a where calls=0 group by Batch)e on a.����=e.Batch
left join (select a.Batch,count(*)����ϵ from TelemarketingDetail a where calls>0 group by Batch)f on a.����=f.Batch
left join (select a.Batch,count(*)�������Ͻ��� from TelemarketingDetail a where isEnterProcess=1 group by Batch)g on a.����=g.Batch
order by case when a.�ֹ�˾='guangzhou' then '����'
            when a.�ֹ�˾='hangzhou' then '����'
			when a.�ֹ�˾='hefei' then '�Ϸ�'
			when a.�ֹ�˾='nanjing' then '�Ͼ�'
			when a.�ֹ�˾='ningbo' then '����'
			when a.�ֹ�˾='shanghai' then '�Ϻ�'
			when a.�ֹ�˾='shenzhen' then '����'
			when a.�ֹ�˾='suzhou' then '����'
			when a.�ֹ�˾='wuxi' then '����' end
,2


 drop table #t2
	drop table #t1	  
	drop table #t3