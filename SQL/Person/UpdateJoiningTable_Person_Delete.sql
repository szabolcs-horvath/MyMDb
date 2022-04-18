create or alter trigger UpdateJoiningTable_Person_Delete
	on [Person]
	instead of delete
as
begin
	delete from [MoviePersonJoiningTable] where [PersonID] in (select d.[ID] from deleted d)
	delete from [Person] where [ID] in (select d.[ID] from deleted d)
end