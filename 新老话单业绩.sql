select t.branch '�ֹ�˾'
,case when t.salescnt <=1 and t.cltstatus <>3 then '�»���'
	  else '�ϻ���' end '��������'
,case when s.dealtime between '2016-1-1' and '2016-2-1' then '1��'
	  when s.dealtime between '2016-2-1' and '2016-3-1' then '2��'
	  when s.dealtime >= '2016-3-1' then '3��'
	  else '����' end '�·�'
,sum(cast(isnull(s.amount,0) as decimal(10,2))) 'ҵ��'
from dfss_bi..telemarketingdetail t
left join dfss_bi..servicefeedetails s
on t.clt_code=s.clt_code
group by t.branch,case when t.salescnt <=1 and t.cltstatus <>3 then '�»���'
	  else '�ϻ���' end,case when s.dealtime between '2016-1-1' and '2016-2-1' then '1��'
	  when s.dealtime between '2016-2-1' and '2016-3-1' then '2��'
	  when s.dealtime >= '2016-3-1' then '3��'
	  else '����' end 