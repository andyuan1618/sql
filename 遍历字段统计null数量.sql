use DFSS_GUANGZHOU
go

declare @col_name varchar(99)
declare @table_name varchar(99)
set @table_name = 'sal_clt_base'


declare cur_col cursor  
for 
select name from syscolumns where id=object_id(@table_name)

open cur_col
fetch next from cur_col into @col_name
declare @count int
set @count=0
while @@FETCH_STATUS=0
	begin  	
	    exec('select clt_code , case when''' + @col_name+ '''is null then 0 else 1 end
		from DFSS_GUANGZHOU..SAL_CLT_BASE s
	    group by s.CLT_CODE')
	    fetch next from cur_col into @col_name
	end
		
close cur_col
deallocate cur_col

drop table #tmp
go
 