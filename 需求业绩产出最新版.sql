select c.clt_code clt_code
,u.role role
,c.min_ct min_ct
into #status
from
(
select d.cltcode clt_code
,min(d.createtime) min_ct
from dfss_bi..customerexestatuschangehistoryid_combined d
where d.afterexestatus in (1,2,3,4,5,6)
group by d.cltcode
) c
left join dfss_bi..userinfo u
on c.clt_code=u.clt_code
where c.min_ct between '2016-2-15' and '2016-3-15 23:59:59' and u.fromwebsite='非市场'
group by c.clt_code,u.role,c.min_ct


select g.role '客户身份'
,case when t.requireamount<10 then '10万以内'
      when t.requireamount>=10 and t.requireamount<30 then '10-30万以内'
  when t.requireamount>=30 and t.requireamount<50 then '30-50万以内'
  when t.requireamount>=50 and t.requireamount<100 then '50-100万以内'
  else '100万以上' end '需求额度'
,count(*) '新增需求话单量'
,isnull(sum(g.fee),0) '60天业绩'
,isnull(sum(t.requireamount),0) '需求总额'
,case when isnull(sum(t.requireamount),0)=0 then 0 else isnull(sum(g.fee),0)*10/isnull(sum(t.requireamount),0) end '每10万需求额业绩产出'
from
(
select s.clt_code clt_code
,s.role role
,isnull(sum(case when datediff(d,s.min_ct,f.dealtime)<=60 then f.amount else 0 end),0) fee
from #status s
left join dfss_bi..servicefeedetails f
on s.clt_code=f.clt_code
group by s.clt_code,s.role
) g
left join dfss_bi..telemarketingdetail t
on g.clt_code=t.clt_code
group by g.role,case when t.requireamount<10 then '10万以内'
      when t.requireamount>=10 and t.requireamount<30 then '10-30万以内'
  when t.requireamount>=30 and t.requireamount<50 then '30-50万以内'
  when t.requireamount>=50 and t.requireamount<100 then '50-100万以内'
  else '100万以上' end


drop table #status
