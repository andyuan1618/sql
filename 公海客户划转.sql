select '����' '����',count(*) '����' from DFSS_GUANGZHOU..SAL_CLT_BASE s
where s.CLT_STATUS=3 
and s.UPdateTime>='2016-1-1' 

union all

select '����',count(*) '����' from DFSS_HANGZHOU..SAL_CLT_BASE s
where s.CLT_STATUS=3 
and s.UPdateTime>='2016-1-1' 

union all

select '�Ϸ�',count(*) '����' from DFSS_HEFEI..SAL_CLT_BASE s
where s.CLT_STATUS=3 
and s.UPdateTime>='2016-1-1' 

union all

select '�Ͼ�',count(*) '����' from DFSS_NANJING..SAL_CLT_BASE s
where s.CLT_STATUS=3 
and s.UPdateTime>='2016-1-1' 

union all

select '����',count(*) '����' from DFSS_NINGBO..SAL_CLT_BASE s
where s.CLT_STATUS=3 
and s.UPdateTime>='2016-1-1' 

union all

select '�Ϻ�',count(*) '����' from DFSS_SHANGHAI..SAL_CLT_BASE s
where s.CLT_STATUS=3 
and s.UPdateTime>='2016-1-1' 

union all

select '����',count(*) '����' from DFSS_SHENZHEN..SAL_CLT_BASE s
where s.CLT_STATUS=3 
and s.UPdateTime>='2016-1-1' 

union all

select '����',count(*) '����' from DFSS_SUZHOU..SAL_CLT_BASE s
where s.CLT_STATUS=3 
and s.UPdateTime>='2016-1-1' 

union all

select '����',count(*) '����' from DFSS_WUXI..SAL_CLT_BASE s
where s.CLT_STATUS=3 
and s.UPdateTime>='2016-1-1' 