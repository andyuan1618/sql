select b.importdate '��������'
,b.remarks '��������'
,b.batch '�ļ�'
,b.channel '����'
,b.branch '�ֹ�˾'
,b.cost '�����ܼ�'
,b.price '���򵥼�'
,b.batchcnt '��������'
,b.batchcnt-b.importcnt '����������'
,b.importcnt '��������'
,b.successcnt '�ɹ�������'
,b.successcnt-count(distinct t.clt_code) 'δ����'
,count(distinct t.clt_code) '�ѷ���'
,isnull(sum(case when t.FirstCallDate is not null then 1 else 0 end),0) '�Ѳ��򻰵���'
,isnull(sum(t.isGetThrough),0) '�ײ���ͨ��'
,isnull(sum(t.isEnterProcess),0) '�ײ���Ч������'
,isnull(c2.dialcount,0) '�������'
,isnull(c2.dialoncount,0) '��ͨ����'
,isnull(c2.thirtysec,0) '30sͨ��'
,case when b.batchcnt=0 then 0 else (b.batchcnt-b.importcnt)*1./b.batchcnt end '������'
,case when b.batchcnt=0 then 0 else b.successcnt*1./b.batchcnt end '������'
,case when b.successcnt=0 then 0 else count(distinct t.clt_code)*1./b.successcnt end '������'
,case when b.batchcnt=0 then 0 else isnull(sum(case when t.FirstCallDate is not null then 1 else 0 end),0)*1./(b.batchcnt-(b.batchcnt-b.importcnt)) end '������'
,case when count(distinct t.clt_code)=0 then 0 else isnull(sum(case when t.FirstCallDate is not null then 1 else 0 end),0)*1./count(distinct t.clt_code) end '��Ч������'
,case when sum(case when t.FirstCallDate is not null then 1 else 0 end)=0 then 0 else sum(t.isGetThrough)*1./sum(case when t.FirstCallDate is not null then 1 else 0 end) end '�ײ���ͨ��'
,case when isnull(c2.dialcount,0)=0 then 0 else isnull(c2.dialoncount,0)*1./isnull(c2.dialcount,0) end '��Ч��ͨ��'
,case when isnull(sum(t.isGetThrough),0)=0 then 0 else isnull(sum(t.isEnterProcess),0)*1./isnull(sum(t.isGetThrough),0) end '�ײ�ת����'
,isnull(c2.thirtysecrate,0) '30sʱ��ͨ����'
,isnull(sum(t.requireamount),0) '�����ܶ�'
,sum(case when t.requireamount>0 then 1 else 0 end) '�ͻ���'
,isnull(sum(t.requireamount)/sum(case when t.requireamount>0 then 1 else 0 end),0) 'ƽ��������'
,isnull(sum(t.ServiceTotal),0) '�ۼ�ҵ��'
,case when b.cost=0 then 0 else isnull(sum(t.ServiceTotal),0)*1./b.cost end 'ROI'
,case when b.batchcnt=0 then 0 else isnull(sum(t.ServiceTotal),0)*1./b.batchcnt end '��λ���Ӳ���'
,isnull(sum(case when t.cltstatus=3 then 1 else 0 end),0) '����'
,isnull(sum(case when t.cltstatus=4 then 1 else 0 end),0) '�»���'
,isnull(sum(case when t.cltstatus=5 then 1 else 0 end),0) '˽��'
,isnull(sum(case when t.cltstatus=2 then 1 else 0 end),0) '����'
--,isnull(sum(case when t.cltstatus=6 then 1 else 0 end),0) '����2'
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