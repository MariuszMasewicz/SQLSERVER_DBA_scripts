DECLARE @id INT
DECLARE @i INT =0
DECLARE @bulk_size INT =5000
DECLARE db_cursor CURSOR FOR
SELECT archid from [dbo].[tmp_archProducts]
 
OPEN db_cursor
FETCH NEXT FROM db_cursor INTO @id
 
WHILE @@FETCH_STATUS = 0
begin
while @i <= @bulk_size
BEGIN
print 'delete from arch.Products where id='+convert(varchar(50),@id)
delete from arch.Products where _archid=@id
set @i=@i+1
FETCH NEXT FROM db_cursor INTO @id
END
--print 'commit'
commit
set @i=0
end --bulk size
commit
CLOSE db_cursor
DEALLOCATE db_cursor


---------------------------------

DECLARE @RC AS INT
SET @RC = -1

WHILE @RC <> 0
BEGIN
    DELETE TOP(1000000) FROM [Archive_CBO_ODS].[CBO].[AckItem] WHERE [AckItemId] >= 300
    SET @RC = @@ROWCOUNT
    --SET @RC = 0
END

--------------------