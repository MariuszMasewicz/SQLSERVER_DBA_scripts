SELECT top 1000
    *
FROM 
    fn_dblog(NULL, NULL) 
	where Operation = 'LOP_DELETE_ROWS';