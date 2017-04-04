/* ��Ч���� */

select distinct st.cltcode clt_code
,case when st.afterexestatus in (1,2,3,4,5,6) then 1 else 0 end effect
into #status
from dfss_bi..customerexestatuschangehistoryid_combined st
where st.createtime between '2016-3-1' and '2016-3-31 23:59:59'  /* ���ڰ�������� */
group by st.cltcode,st.afterexestatus


/* ������� */

select distinct c.clt_code
,t.branch city
,case when t.importdate<'2016-3-1' then 0 else 1 end clt_type     /* �������ͣ�1�����»�����0�����ϻ���*/
,t.isgetthrough firstcall_dialon
,t.isenterprocess firstcall_effect
,case when isnull(sum(c.isgetthrough),0)>0 then 1 else 0 end dialon
,case when s.clt_code is not null then s.effect else 0 end effect
,t.requireamount rqr_amount
into #calls
from dfss_bi..calldetails c
left join dfss_bi..telemarketingdetail t
on c.clt_code=t.clt_code
left join #status s
on c.clt_code=s.clt_code
where c.calldate between '2016-3-1' and '2016-3-31 23:59:59' and t.cltstatus<>1 and t.importdate is not null and t.branch<>'�Ϸ�'
group by c.clt_code,t.branch,t.importdate,t.isgetthrough,isenterprocess,s.clt_code,s.effect,t.requireamount

/* ת���ʼ�ƽ������� */

select l.city '�ֹ�˾' 
,case when l.clt_type=1 then '�»���' else '�ϻ���' end '��������'
,count(distinct l.clt_code) '������'
,isnull(sum(case when l.clt_type=1 then l.firstcall_dialon else l.dialon end),0) '��ͨ��'
,isnull(sum(case when l.clt_type=1 then l.firstcall_effect else l.effect end),0) '��Ч������'
,isnull(sum(case when l.rqr_amount is not null and l.rqr_amount>0 then l.rqr_amount else 0 end),0) '�����ܶ�'
,isnull(sum(case when l.rqr_amount is not null and l.rqr_amount>0 then 1 else 0 end),0) '�������0�ͻ���'
,case when isnull(sum(case when l.clt_type=1 then l.firstcall_dialon else l.dialon end),0)=0 then 0 else isnull(sum(case when l.clt_type=1 then l.firstcall_effect else l.effect end),0)*1./isnull(sum(case when l.clt_type=1 then l.firstcall_dialon else l.dialon end),0) end  'ת����'  /* �»���Ϊ�ײ�ת���ʣ��ϻ���Ϊ��Чת����*/ 
,case when isnull(sum(case when l.rqr_amount is not null and l.rqr_amount>0 then 1 else 0 end),0)=0 then 0 else isnull(sum(case when l.rqr_amount is not null and l.rqr_amount>0 then l.rqr_amount else 0 end),0)*1./isnull(sum(case when l.rqr_amount is not null and l.rqr_amount>0 then 1 else 0 end),0) end 'ƽ�������'
from #calls l
group by l.city,case when l.clt_type=1 then '�»���' else '�ϻ���' end

drop table #calls
drop table #status