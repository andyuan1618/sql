/* ���� */

select distinct t.clt_code
,e.emp_name sales
,case when t.firstcalldate is not null then 1 else 0 end dial
,t.isgetthrough dialon
,t.isenterprocess effect
,t.requireamount rqr_amount
,case when t.requireamount is not null and t.requireamount>0 then 1 else 0 end rqr_num
,u.role role
into #calls
from dfss_bi..telemarketingdetail t
left join dfss_bi..userinfo u
on t.clt_code=u.clt_code
left join dfss_bi..emp_name e
on u.clt_owner=e.emp_code
where t.batchid in (1715,1716,681)
group by t.clt_code,e.emp_name,t.firstcalldate,t.isgetthrough,t.isenterprocess,u.role,t.requireamount

/* ���� */

select c.sales ����
,count(*) ��������
,isnull(sum(c.dial),0) �Ѳ��򻰵���
,isnull(sum(c.dialon),0) �ײ���ͨ��
,isnull(sum(c.effect),0) �ײ���Ч������
,isnull(sum(case when c.rqr_amount is not null and c.rqr_amount>0 then c.rqr_amount else 0 end),0) �����ܶ�
,isnull(sum(case when c.rqr_amount is not null and c.rqr_amount>0 then 1 else 0 end),0) ����ͻ���
,isnull(sum(case when c.role='��ҵ��' then 1 else 0 end),0) ��ҵ������
,isnull(sum(case when c.role='���廧' then 1 else 0 end),0) ���廧����
,case when isnull(sum(c.dialon),0)=0 then 0 else isnull(sum(c.effect),0)*1./isnull(sum(c.dialon),0) end �ײ�����ת����
,case when isnull(sum(case when c.rqr_amount is not null and c.rqr_amount>0 then 1 else 0 end),0)=0 then 0 else isnull(sum(case when c.rqr_amount is not null and c.rqr_amount>0 then c.rqr_amount else 0 end),0)*1./isnull(sum(case when c.rqr_amount is not null and c.rqr_amount>0 then 1 else 0 end),0) end ƽ�������
,case when count(*)=0 then 0 else isnull(sum(case when c.role='��ҵ��' then 1 else 0 end),0)*1./count(*) end ��ҵ��ռ��
,case when count(*)=0 then 0 else isnull(sum(case when c.role='���廧' then 1 else 0 end),0)*1./count(*) end ���廧ռ��
from #calls c
group by c.sales

drop table #calls