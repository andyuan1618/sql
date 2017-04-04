
/*
�ֹ�˾	������Դ	��������	�������	��ͨ����	������	��ͨ��	����ת����	ƽ��������	��Լ��	̸����	ǩԼ��	��Ա����	�������	ƽ���ɽ�����	�˾�����

*/


create table #BianZhi
(
	CityName varchar(10) not null,
	TeamNum int not null
)

insert into #BianZhi
values ('����',88),('����',89),('�Ϸ�',13),('�Ͼ�',89),('����',86),('�Ϻ�',85),('����',78),('����',120),('����',64),('�ൺ',25),('�ɶ�',21)



select  
u.Branch   '�ֹ�˾'
,count(*)   '��������'
,count(*)*1./b1.TeamNum   'ѭ������/��'
,sum(t.calls)   '�������'
,sum(t.getThroughs)   '��ͨ����'
,sum(case when t.calls>0 then 1 else 0 end)*1./count(*)   '������'
,sum(case when t.getThroughs>0 then 1 else 0 end)*1./count(*)  '��ͨ��'
,sum(t.isEnterProcess)*1./count(*)   '����ת����'
,case when sum(t.isEnterProcess)=0 then 0 else sum(case when t.requireamount>200 then 200 else t.requireamount end )*1./sum(t.isEnterProcess) end   'ƽ��������'
,case when sum(t.getThroughs)=0 then 0 else sum(case when t.firstinvitedate is not null then 1 else 0 end )*1./sum(t.getThroughs) end   '��Լ��'
,case when sum(case when t.firstinvitedate is not null then 1 else 0 end )=0 then 0 else sum(case when t.finalarchivetime is not null then 1 else 0 end)*1./sum(case when t.firstinvitedate is not null then 1 else 0 end ) end 'ǩԼ��'
,case when sum(case when t.MemberFee>0 then 1 else 0 end)=0 then 0 else sum(t.memberfee)*1./sum(case when t.MemberFee>0 then 1 else 0 end)  end  '��Ա����'
,case when sum(case when t.OtherFee>0 then 1 else 0 end)=0 then 0 else sum(t.OtherFee)*1./sum(case when t.OtherFee>0 then 1 else 0 end) end   '�ǻ�Ա����'
,isnull(avg(datediff(d,t.firstcalldate,t.finalarchivetime)),0)    'ƽ���ɽ�����'
,case when count(distinct t.salescnt)=0 then 0 else isnull(sum(t.servicetotal)*1./count(distinct t.salescnt),0) end   '�˾�����'
,sum(t.memberfee) '��Ա��'
,sum(t.OtherFee) '�ǻ�Ա��'
,sum(case when u.role='��ҵ��' then 1 else 0 end) '��ҵ������'
,case when count(*) =0 then 0 else (sum(case when u.role='��ҵ��' then 1 else 0 end)*1.)/count(*) end  '��ҵ��ռ��'
,count(distinct t.salescnt)  '�ɽ�������'
,sum(t.isEnterProcess)  '�������û���'
,sum(case when t.requireamount>200 then 200 else t.requireamount end )  '�����ܶ�'
,sum(case when t.firstinvitedate is not null then 1 else 0 end ) '��Լ��'
,sum(case when t.finalarchivetime is not null then 1 else 0 end) '�ɽ���'
,sum(case when t.calls>0 then 1 else 0 end)  '��������'
,sum(case when t.getThroughs>0 then 1 else 0 end)  '��ͨ����'    
,sum(case when t.MemberFee>0 then 1 else 0 end)  '�ɽ���Ա'
,sum(case when t.OtherFee>0 then 1 else 0 end)  '�ɽ��ǻ�Ա'       
from [DFSS_BI].[dbo].[TelemarketingDetail]  t
left join dfss_bi..UserInfo u on u.CLT_CODE=t.Clt_Code
left join
(
select b.CityName,b.TeamNum*200 'TeamNum'
from #BianZhi b 
) b1
on u.Branch=b1.CityName


where CltStatus in (1,3,4,5)
group by u.Branch,b1.TeamNum

drop table #BianZhi
