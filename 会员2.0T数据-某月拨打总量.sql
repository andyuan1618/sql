/* ��Ч���� */
select distinct s.cltcode
into #status
from dfss_shanghai..customerexestatuschangehistoryid s
where s.afterexestatus in (1,2,3,4,5,6) and s.createtime>='2016-5-1'

/* ����� */
select distinct r1.clt_code
,case when r1.rqr_amount>200 then 200 else r1.rqr_amount end rqr_amount
into #rqr
from dfss_shanghai..sal_clt_require r1
inner join 
(
select distinct clt_code
,min(rqr_id) min_rqr_id
from dfss_shanghai..sal_clt_require
group by clt_code
) r2
on r1.rqr_id=r2.min_rqr_id
where r1.rqr_amount>0
group by r1.clt_code,r1.rqr_amount

/* ������Ϣ */
select c.src
,h.emp_name
,c.dst
,l.clt_code
,b.clt_type
,p.rqr_amount
,case when sum(c.billsec)>0 then 1 else 0 end dialon
into #sales
from dfss_shanghai..callbehaviorrealtime c
left join dfss_shanghai..hrs_emp_base h
on c.src=substring(h.emp_code,3,4)
left join dfss_shanghai..sal_clt_lnkman l
on c.dst=l.lnk_mobile
left join dfss_shanghai..sal_clt_base b
on l.clt_code=b.clt_code
left join #rqr p
on l.clt_code=p.clt_code
where h.emp_name in ('������','����','�����','�½�','�γп�','���ӽ�','������','����ϼ','ף��ΰ') and c.calldate>='2016-5-1' and l.clt_code is not null
group by c.src,b.clt_type,h.emp_name,c.dst,l.clt_code,p.rqr_amount


/* ���� */
select distinct m.emp_name '����'
,count(m.clt_code) '���򻰵���'
,isnull(sum(m.dialon),0) '��ͨ������'
,isnull(sum(case when n.cltcode is not null then 1 else 0 end),0) '��Ч������'
,isnull(sum(m.rqr_amount),0) '�����ܶ�'
,isnull(sum(case when m.rqr_amount is not null then 1 else 0 end),0) '����ͻ���'
,isnull(sum(case when m.clt_type=1 then 1 else 0 end),0) '��ҵ������'
,isnull(sum(case when m.clt_type=2 then 1 else 0 end),0) '���廧����'
,isnull(sum(case when m.clt_type=3 then 1 else 0 end),0) '��н������'
,case when count(m.clt_code)=0 then 0 else isnull(sum(m.dialon),0)*1./count(m.clt_code) end '��ͨ��'
,case when isnull(sum(m.dialon),0)=0 then 0 else isnull(sum(case when n.cltcode is not null then 1 else 0 end),0)*1./isnull(sum(m.dialon),0) end '��Чת����'
,case when isnull(sum(case when m.rqr_amount is not null then 1 else 0 end),0)=0 then 0 else isnull(sum(m.rqr_amount),0)*1./isnull(sum(case when m.rqr_amount is not null then 1 else 0 end),0) end 'ƽ�������'
,case when count(m.clt_code)=0 then 0 else isnull(sum(case when m.clt_type=1 then 1 else 0 end),0)*1./count(m.clt_code) end '��ҵ��ռ��'
,case when count(m.clt_code)=0 then 0 else isnull(sum(case when m.clt_type=2 then 1 else 0 end),0)*1./count(m.clt_code) end '���廧ռ��'
,case when count(m.clt_code)=0 then 0 else isnull(sum(case when m.clt_type=3 then 1 else 0 end),0)*1./count(m.clt_code) end '��н��ռ��'
from #sales m
left join #status n
on m.clt_code=n.cltcode
group by m.emp_name

drop table #sales
drop table #rqr
drop table #status