create or alter trigger UpdateJoiningTableOnDelete
	on [Movie]
	instead of delete
as
begin
	delete from [MoviePersonJoiningTable] where [MovieID] in (select d.[ID] from deleted d)
	delete from [Movie] where [ID] in (select d.[ID] from deleted d)
end