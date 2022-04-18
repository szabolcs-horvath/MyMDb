create or alter trigger UpdateJoiningTable_Movie_Delete
	on [Movie]
	instead of delete
as
begin
	delete from [MoviePersonJoiningTable] where [MovieID] in (select d.[ID] from deleted d)
	delete from [Movie] where [ID] in (select d.[ID] from deleted d)
end