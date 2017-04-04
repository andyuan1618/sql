select t.branch 分公司
,sum(case when t.cltstatus=3 then 1 else 0 end) 公海话单量
,sum(case when t.cltstatus=3 and u.role <> '企业主' then 1 else 0 end) 公海非企业主话单量
,case when sum(case when t.cltstatus=3 then 1 else 0 end)=0 then 0 else (sum(case when t.cltstatus=3 then 1 else 0 end)-sum(case when t.cltstatus=3 and u.role <> '企业主' then 1 else 0 end))*1./sum(case when t.cltstatus=3 then 1 else 0 end) end 企业主占比
,sum(case when t.salescnt>=8 and t.cltstatus=3 then 1 else 0 end) 进入公海不少于7次的话单量
,sum(case when t.salescnt>=6 and t.cltstatus=3 then 1 else 0 end) 进入公海不少于5次的话单量
from dfss_bi..telemarketingdetail t
left join dfss_bi..userinfo u
on t.clt_code=u.clt_code
group by t.branch
