select u.branch �ֹ�˾
,e.dpr_name �Ŷ�
,e.emp_name ����
,t.batchid ���κ�
,count(distinct u.clt_code) δ��ϵ������
from dfss_bi..userinfo u
left join dfss_bi..emp_name e
on u.branch=e.city and u.clt_owner=e.emp_code
left join dfss_bi..CustomerExeStatusChangeHistoryId_Combined b
on b.cltcode=u.clt_code
left join dfss_bi..telemarketingdetail t
on u.clt_code=t.clt_code
where b.afterexestatus=10
group by u.branch,e.dpr_name,e.emp_name,t.batchid
