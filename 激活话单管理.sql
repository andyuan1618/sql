/* ����ͻ��Ĳ������ */

select u.branch '�ֹ�˾'
,count(*) '������'
,isnull(sum(case when c.calldate is not null then 1 else 0 end),0) '������'
,isnull(sum(c.isgetthrough),0) '��ͨ��'
,case when count(*)<>0 then isnull(sum(case when c.calldate is not null then 1 else 0 end),0) *1./count(*) else 0 end '������'
,case when isnull(sum(case when c.calldate is not null then 1 else 0 end),0)<>0 then isnull(sum(c.isgetthrough),0)*1./isnull(sum(case when c.calldate is not null then 1 else 0 end),0) else 0 end '��ͨ��'
from dfss_bi..userinfo u
left join
(
select s.clt_code,s.calldate,s.billsecond,s.isgetthrough from dfss_bi..calldetails s
union all
select s.clt_code,s.calldate,s.billsecond,s.isgetthrough from dfss_bi..calldetails_2014 s
union all
select s.clt_code,s.calldate,s.billsecond,s.isgetthrough from dfss_bi..calldetails_2015 s
) c
on u.clt_code=c.clt_code
where u.clt_status=12
group by u.branch
