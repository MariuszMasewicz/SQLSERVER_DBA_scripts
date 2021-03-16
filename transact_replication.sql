use distribution
go

select * from dbo.MSrepl_errors
where error_code in ('2601','2627','20598')
order by time desc

exec sp_browsereplcmds 
@xact_seqno_start = '0x000456FA00103618002E00000000', 
@xact_seqno_end = '0x000456FA00103618002E00000000'

