select '广州' '城市',count(*) '条数' from DFSS_GUANGZHOU..SAL_CLT_BASE s
where s.CLT_STATUS=3 
and s.UPdateTime>='2016-1-1' 

union all

select '杭州',count(*) '条数' from DFSS_HANGZHOU..SAL_CLT_BASE s
where s.CLT_STATUS=3 
and s.UPdateTime>='2016-1-1' 

union all

select '合肥',count(*) '条数' from DFSS_HEFEI..SAL_CLT_BASE s
where s.CLT_STATUS=3 
and s.UPdateTime>='2016-1-1' 

union all

select '南京',count(*) '条数' from DFSS_NANJING..SAL_CLT_BASE s
where s.CLT_STATUS=3 
and s.UPdateTime>='2016-1-1' 

union all

select '宁波',count(*) '条数' from DFSS_NINGBO..SAL_CLT_BASE s
where s.CLT_STATUS=3 
and s.UPdateTime>='2016-1-1' 

union all

select '上海',count(*) '条数' from DFSS_SHANGHAI..SAL_CLT_BASE s
where s.CLT_STATUS=3 
and s.UPdateTime>='2016-1-1' 

union all

select '深圳',count(*) '条数' from DFSS_SHENZHEN..SAL_CLT_BASE s
where s.CLT_STATUS=3 
and s.UPdateTime>='2016-1-1' 

union all

select '苏州',count(*) '条数' from DFSS_SUZHOU..SAL_CLT_BASE s
where s.CLT_STATUS=3 
and s.UPdateTime>='2016-1-1' 

union all

select '无锡',count(*) '条数' from DFSS_WUXI..SAL_CLT_BASE s
where s.CLT_STATUS=3 
and s.UPdateTime>='2016-1-1' 