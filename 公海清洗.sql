select t.branch �ֹ�˾
,sum(case when t.cltstatus=3 then 1 else 0 end) ����������
,sum(case when t.cltstatus=3 and u.role <> '��ҵ��' then 1 else 0 end) ��������ҵ��������
,case when sum(case when t.cltstatus=3 then 1 else 0 end)=0 then 0 else (sum(case when t.cltstatus=3 then 1 else 0 end)-sum(case when t.cltstatus=3 and u.role <> '��ҵ��' then 1 else 0 end))*1./sum(case when t.cltstatus=3 then 1 else 0 end) end ��ҵ��ռ��
,sum(case when t.salescnt>=8 and t.cltstatus=3 then 1 else 0 end) ���빫��������7�εĻ�����
,sum(case when t.salescnt>=6 and t.cltstatus=3 then 1 else 0 end) ���빫��������5�εĻ�����
from dfss_bi..telemarketingdetail t
left join dfss_bi..userinfo u
on t.clt_code=u.clt_code
group by t.branch
