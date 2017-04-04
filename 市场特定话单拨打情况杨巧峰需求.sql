/* �г����� 12548�� */

select distinct g.cltcode clt_code
,'�ɶ�' city
into #clt
from dfss_chengdu..clientstatuschangelog g
where createtime>'2016-06-20' and createtime<'2016-06-21' and memo='�г������뻮ת����'

union all

select distinct g.cltcode
,'����' city
from dfss_guangzhou..clientstatuschangelog g
where createtime>'2016-06-20' and createtime<'2016-06-21' and memo='�г������뻮ת����'

union all

select distinct g.cltcode
,'����' city
from dfss_hangzhou..clientstatuschangelog g
where createtime>'2016-06-20' and createtime<'2016-06-21' and memo='�г������뻮ת����'

union all

select distinct g.cltcode
,'�Ͼ�' city
from dfss_nanjing..clientstatuschangelog g
where createtime>'2016-06-20' and createtime<'2016-06-21' and memo='�г������뻮ת����'

union all

select distinct g.cltcode
,'����' city
from dfss_ningbo..clientstatuschangelog g
where createtime>'2016-06-20' and createtime<'2016-06-21' and memo='�г������뻮ת����'

union all

select distinct g.cltcode
,'�ൺ' city
from dfss_qingdao..clientstatuschangelog g
where createtime>'2016-06-20' and createtime<'2016-06-21' and memo='�г������뻮ת����'

union all

select distinct g.cltcode
,'�Ϻ�' city
from dfss_shanghai..clientstatuschangelog g
where createtime>'2016-06-20' and createtime<'2016-06-21' and memo='�г������뻮ת����'

union all

select distinct g.cltcode
,'����' city
from dfss_shenzhen..clientstatuschangelog g
where createtime>'2016-06-20' and createtime<'2016-06-21' and memo='�г������뻮ת����'

union all

select distinct g.cltcode
,'����' city
from dfss_suzhou..clientstatuschangelog g
where createtime>'2016-06-20' and createtime<'2016-06-21' and memo='�г������뻮ת����'

union all

select distinct g.cltcode
,'����' city
from dfss_wuxi..clientstatuschangelog g
where createtime>'2016-06-20' and createtime<'2016-06-21' and memo='�г������뻮ת����'

/* ������� */

select distinct c.clt_code
,case when isnull(sum(c.isgetthrough),0)>0 then 1 else 0 end dialon
into #calls
from dfss_bi..calldetails c
where c.calldate>'2016-6-20'
group by c.clt_code

/* ��Ч���� */

select distinct st.cltcode clt_code
,case when st.afterexestatus in (1,2,3,4,5,6) then 1 else 0 end effect
into #status
from dfss_bi..customerexestatuschangehistoryid_combined st
where st.createTime>'2016-6-20'  /* ���ڰ�������� */
group by st.cltcode,st.afterexestatus

/* ָ�� */

select p.city '�ֹ�˾'
,count(distinct p.clt_code) '������'
,isnull(sum(case when l.clt_code is not null then 1 else 0 end),0) '������'
,isnull(sum(l.dialon),0) '��ͨ��'
,isnull(sum(case when s.clt_code is not null then s.effect else 0 end),0) '��Ч����'
,isnull(sum(t.requireamount),0) '�����ܶ�'
,isnull(sum(case when t.requireamount>0 then 1 else 0 end),0) '������ͻ���'
,case when count(distinct t.clt_code)=0 then 0 else isnull(sum(case when l.clt_code is not null then 1 else 0 end),0)*1./count(distinct t.clt_code) end '������'
,case when isnull(sum(case when l.clt_code is not null then 1 else 0 end),0)=0 then 0 else isnull(sum(l.dialon),0)*1./isnull(sum(case when l.clt_code is not null then 1 else 0 end),0) end '��ͨ��'
,case when isnull(sum(l.dialon),0)=0 then 0 else isnull(sum(case when s.clt_code is not null then s.effect else 0 end),0)*1./isnull(sum(l.dialon),0) end 'ת����'
,case when isnull(sum(case when t.requireamount>0 then 1 else 0 end),0)=0 then 0 else isnull(sum(t.requireamount),0)*1./isnull(sum(case when t.requireamount>0 then 1 else 0 end),0) end 'ƽ�������'
from #clt p
left join dfss_bi..telemarketingdetail t
on p.clt_code=t.clt_code
left join #calls l
on p.clt_code=l.clt_code
left join #status s
on p.clt_code=s.clt_code
group by p.city

/* ɾ����ʱ�� */
drop table #calls
drop table #status
drop table #clt
