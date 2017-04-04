select count(x.clt_code) '当月拨打老话单量'
,isnull(sum(x.call_total),0) '当月拨打老话单循环次数'
,isnull(sum(x.fee),0) '当月老话单产生业绩'
,case when isnull(sum(x.call_total),0)=0 then 0 else isnull(sum(x.fee),0)*1./(isnull(sum(x.call_total),0)*2) end '采购价格临界点'
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

/*新话单采购价格最低临界点>上月公海非首拨话单业绩产出/（上月公海非首拨话单拨打总次数*2）  按月定期只修改日期*/
