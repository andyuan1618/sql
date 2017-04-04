select c1.clt_code clt_code
,year(c1.calldate) yy
,month(c1.calldate) mm
,case when isnull(sum(c1.isgetthrough),0)>0 then 1 else 0 end YesnoDialon
,isnull(sum(case when c1.calldate is not null then 1 else 0 end),0) dialcount
,isnull(sum(c1.isgetthrough),0) dialoncount
,isnull(sum(cast(c1.billsecond as decimal(10,2))),0) dialonsec
into #calls
from 
(
select c.clt_code,c.calldate,c.billsecond,c.isgetthrough
from dfss_bi..calldetails c
union all
select c.clt_code,c.calldate,c.billsecond,c.isgetthrough
from dfss_bi..calldetails_2015 c
) c1
left join dfss_bi..telemarketingdetail t
on c1.clt_code=t.clt_code
where t.cltstatus <>1
group by c1.clt_code,year(c1.calldate),month(c1.calldate)


select d.cltcode cltcode
,year(d.createtime) yy
,month(d.CreateTime) mm
into #status
from dfss_bi..CustomerExeStatusChangeHistoryId_Combined d
where d.PreExeStatus=0 and d.AfterExeStatus in (1,2,3,4,5,6)
group by d.cltcode,year(d.createtime),month(d.CreateTime)

select f.clt_code clt_code
,year(f.dealtime) yy
,month(f.dealtime) mm
,isnull(f.amount,0) fee
into #fee
from dfss_bi..servicefeedetails f
where f.amount>0
group by f.clt_code,year(f.dealtime),month(f.dealtime),f.amount

select t.branch '�ֹ�˾'
,c2.yy '�������'
,c2.mm '�����·�'
,count(*) '���򻰵���'
,isnull(sum(c2.YesnoDialon),0) '��ͨ������'
,case when count(*)=0 then 0 else isnull(sum(c2.YesnoDialon),0)*1./count(*) end '��Ч��ͨ��'
,isnull(sum(c2.dialcount),0) '�������'
,isnull(sum(c2.dialoncount),0) '��ͨ����'
,case when isnull(sum(c2.dialcount),0)=0 then 0 else isnull(sum(c2.dialoncount),0)*1./isnull(sum(c2.dialcount),0) end 'ʵ�ʽ�ͨ��'
,case when count(*)=0 then 0 else sum(c2.dialcount)*1./count(*) end 'ƽ���������'
,isnull(sum(c2.dialonsec),0) '��ͨ��ʱ��'
,case when sum(c2.dialoncount)=0 then 0 else isnull(sum(c2.dialonsec),0)*1./sum(c2.dialoncount) end 'ƽ��ͨ��ʱ��'
,isnull(count(s.cltcode),0) '������Ч������'
,case when isnull(sum(c2.YesnoDialon),0)=0 then 0 else count(s.cltcode)*1./isnull(sum(c2.YesnoDialon),0) end '��Чת����'
,isnull(count(e.clt_code),0) '�ɽ��ͻ���'
,case when isnull(count(s.cltcode),0)=0 then 0 else isnull(count(e.clt_code),0)*1./isnull(count(s.cltcode),0) end '�ɽ���'
,isnull(sum(e.fee),0) '�ɽ����'
,case when isnull(count(e.clt_code),0)=0 then 0 else isnull(sum(e.fee),0)*1./isnull(count(e.clt_code),0) end 'ƽ���ɽ����'
from #calls c2
left join dfss_bi..telemarketingdetail t
on c2.clt_code=t.clt_code
left join #status s
on c2.clt_code=s.cltcode and c2.yy=s.yy and c2.mm=s.mm
left join #fee e
on c2.clt_code=e.clt_code and c2.yy=e.yy and c2.mm=e.mm
group by t.branch,c2.yy,c2.mm

drop table #calls
drop table #status
drop table #fee