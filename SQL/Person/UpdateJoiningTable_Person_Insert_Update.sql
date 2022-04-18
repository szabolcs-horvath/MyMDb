create or alter trigger UpdateJoiningTable_Person_Insert_Update
	on [Person]
	for insert, update
as
begin
	declare cur cursor local for select i.[ID], i.[FullName], d.[ID] from inserted i full outer join deleted d on i.[ID] = d.[ID]
	declare @iPersonId int
	declare @iFullName nvarchar(60)
	declare @dPersonId int
	declare @movieId int

	open cur
	fetch next from cur into @iPersonId, @iFullName, @dPersonId
	while @@FETCH_STATUS = 0
	begin
		if @dPersonId is not null
		begin
			delete from [MoviePersonJoiningTable] where [PersonID] = @dPersonId
		end

		declare moviecur cursor local for select [ID] from [Movie] where [Cast] like concat('%', @iFullName ,'%') or [Directors] like concat('%', @iFullName, '%')
		open moviecur
		fetch next from moviecur into @movieId
		while @@FETCH_STATUS = 0
		begin
			insert into [MoviePersonJoiningTable] values (@movieId, @iPersonId)
			fetch next from moviecur into @movieId
		end
		close moviecur
		deallocate moviecur

		fetch next from cur into @iPersonId, @iFullName, @dPersonId
	end
	close cur
	deallocate cur
end