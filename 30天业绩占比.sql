select h.yy '成交年'
,h.mm '成交月'
,isnull(sum(h.fee),0) '30天业绩'
from
(
select distinct s.clt_code clt_code
,year(s.dealtime) yy
,month(s.dealtime) mm
,isnull(sum(case when datediff(d,t.importdate,c.finalarchivetime)<=30 then s.amount else 0 end),0) fee
from dfss_bi..servicefeedetails s
left join dfss_bi..cltcontract c
on s.clt_code=c.clt_code
left join dfss_bi..telemarketingdetail t
on s.clt_code=t.clt_code
where s.dealtime>='2016-1-1' and s.amount>0
group by s.clt_code,year(s.dealtime),month(s.dealtime)
) h
group by h.yy,h.mm

select year(s.dealtime) yy
,month(s.dealtime) mm
,isnull(sum(s.amount),0) totalfee
from dfss_bi..servicefeedetails s
where s.dealtime>='2016-1-1' and s.amount>0
group by year(s.dealtime),month(s.dealtime)
