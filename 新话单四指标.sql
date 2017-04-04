/* 拨打情况 */
select distinct
t.branch branch
,c.clt_code clt_code
,c.yy yy
,c.mm mm
into #calls
from
(
select ca.clt_code clt_code
,year(ca.calldate) yy
,month(ca.calldate) mm
from dfss_bi..calldetails ca

union all

select ca.clt_code clt_code
,year(ca.calldate) yy
,month(ca.calldate) mm
from dfss_bi..calldetails_2015 ca
) c
left join dfss_bi..telemarketingdetail t
on c.clt_code=t.clt_code
where t.cltstatus<>1
group by t.branch,c.clt_code,c.yy,c.mm


/* 业绩情况 */
select s.clt_code clt_code
,year(s.dealtime) yy
,month(s.dealtime) mm
,isnull(sum(s.amount),0) fee
into #fee
from dfss_bi..servicefeedetails s
where s.isarchived=1
group by s.clt_code,year(s.dealtime),month(s.dealtime)

/* 有效进程 */
select distinct st.cltcode clt_code
,year(st.createtime) yy
,month(st.createtime) mm
,case when st.preexestatus in (10,0) and st.afterexestatus in (1,2,3,4,5,6) then 1 else 0 end effect
into #status
from dfss_bi..customerexestatuschangehistoryid_combined st
group by st.cltcode,year(st.createtime),month(st.createtime),st.preexestatus,st.afterexestatus

/* 指标 */
select c.branch 分公司
,c.yy 年份
,c.mm 月份
,case when t.clt_code is not null then '新' else '老' end 用户类型
,count(*) 拨打话单量
,isnull(sum(f.fee),0) 新签业绩
,isnull(sum(t.isgetthrough),0) 首拨接通量
,isnull(sum(u.effect),0) 首拨有效进程量
,isnull(sum(case when t.requireamount>0 then t.requireamount else 0 end),0) 需求总额
,isnull(sum(case when t.requireamount>0 then 1 else 0 end),0) 需求客户
,isnull(sum(case when i.role='企业主' then 1 else 0 end),0) 企业主
from #calls c
left join dfss_bi..telemarketingdetail t
on c.clt_code=t.clt_code and year(t.importdate)=c.yy and month(t.importdate)=c.mm
left join #fee f
on c.clt_code=f.clt_code and c.yy=f.yy and c.mm=f.mm
left join #status u
on c.clt_code=u.clt_code and c.yy=u.yy and c.mm=u.mm
left join dfss_bi..userinfo i
on c.clt_code=i.clt_code
group by c.branch,c.yy,c.mm,case when t.clt_code is not null then '新' else '老' end

drop table #calls
drop table #fee
drop table #status