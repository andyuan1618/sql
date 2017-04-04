select count(x.clt_code) '���²����ϻ�����'
,isnull(sum(x.call_total),0) '���²����ϻ���ѭ������'
,isnull(sum(x.fee),0) '�����ϻ�������ҵ��'
,case when isnull(sum(x.call_total),0)=0 then 0 else isnull(sum(x.fee),0)*1./(isnull(sum(x.call_total),0)*2) end '�ɹ��۸��ٽ��'
from
(
select distinct
c.clt_code clt_code
,isnull(sum(case when c.calldate is not null then 1 else 0 end),0) call_total
,isnull(sum(case when s.dealtime between '2016-4-1' and '2016-4-30 23:59:59' then s.amount else 0 end),0) fee
from dfss_bi..calldetails c
left join dfss_bi..telemarketingdetail t
on c.clt_code=t.clt_code
left join dfss_bi..servicefeedetails s
on c.clt_code=s.clt_code
where c.calldate between '2016-4-1' and '2016-4-30 23:59:59' and t.importdate<'2016-4-1' and t.cltstatus<>1
group by c.clt_code,c.calldate
) x

/*�»����ɹ��۸�����ٽ��>���¹������ײ�����ҵ������/�����¹������ײ����������ܴ���*2��  ���¶���ֻ�޸�����*/
