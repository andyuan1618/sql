select clt_code clt_code
,case when isnull(sum(isgetthrough),0)>=1 then 1 else 0 end dialon
into #calls
from dfss_bi..calldetails
where calldate between '2016-1-1' and '2016-4-26 23:59:59'
group by clt_code

select t.branch �ֹ�˾
,case when t.salescnt <=1 and t.cltstatus <>3 then '�»���'
	  else '�ϻ���' end ���ϻ���
,case when u.cmp_name='��ҵ��' then '��ҵ����' else '���󻰵�' end �������� 
,isnull(count(*),0) ������
,isnull(sum(c.dialon),0) ��ͨ��
,case when isnull(count(c.clt_code),0)=0 then 0 else isnull(sum(c.dialon),0)*1./isnull(count(c.clt_code),0) end ��ͨ��
,isnull(sum(t.isgetthrough),0) �ײ���ͨ��
,case when isnull(count(c.clt_code),0)=0 then 0 else isnull(sum(t.isgetthrough),0)*1./isnull(count(c.clt_code),0) end �ײ���ͨ��
,isnull(sum(t.isenterprocess),0) �ײ���Ч������
,case when isnull(sum(t.isgetthrough),0)=0 then 0 else isnull(sum(t.isenterprocess),0)*1./isnull(sum(t.isgetthrough),0) end �ײ�ת����
,isnull(sum(t.requireamount),0) �����ܶ�
,isnull(sum(case when t.requireamount>0 then 1 else 0 end),0) ������ͻ���
,case when isnull(sum(case when t.requireamount>0 then 1 else 0 end),0)=0 then 0 else isnull(sum(t.requireamount),0)*1./isnull(sum(case when t.requireamount>0 then 1 else 0 end),0) end ƽ��������
from #calls c
left join telemarketingdetail t
on c.clt_code=t.clt_code
left join dfss_bi..userinfo u
on c.clt_code=u.clt_code
group by t.branch
,case when t.salescnt <=1 and t.cltstatus <>3 then '�»���'
	  else '�ϻ���' end
,case when u.cmp_name='��ҵ��' then '��ҵ����' else '���󻰵�' end

drop table #calls