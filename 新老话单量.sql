select t.branch '�ֹ�˾'
,case when t.salescnt <=1 and t.cltstatus <>3 then '�»���'
	  else '�ϻ���' end '��������'
,count(*) '������'
from dfss_bi..telemarketingdetail t
where t.cltstatus =3 and t.salescnt>=6
group by t.branch,case when t.salescnt <=1 and t.cltstatus <>3 then '�»���'
	  else '�ϻ���' end