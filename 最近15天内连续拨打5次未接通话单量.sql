/* 每条话单最近n次拨打记录 */

select p.*
into #calls
from
(
select row_number() over(partition by c.clt_code order by c.calldate desc) call_id
,c.clt_code
,c.calldate
,c.billsecond
,c.isgetthrough
from dfss_bi..calldetails c
where c.calldate between '2016-6-18' and '2016-7-3 23:59:59'
) p
where p.call_id<=5


/* 最近拨打n次未接通情况 */

select q.branch '分公司'
,isnull(sum(q.n_newcall_dialon),0) '最近拨打n次未接通话单量'
from
(
select l.clt_code
,t.branch
,max(l.call_id) call_num
,case when isnull(sum(l.billsecond),0)>0 then 0 else 1 end n_newcall_dialon
from #calls l
left join dfss_bi..telemarketingdetail t
on l.clt_code=t.clt_code
where t.cltstatus=3	 	/*只统计公海1话单 */
group by l.clt_code,t.branch
) q
where q.call_num>=5	/* 统计拨打次数大于等于n次 */
group by q.branch


drop table #calls