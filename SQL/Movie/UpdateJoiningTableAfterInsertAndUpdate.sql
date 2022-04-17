create or alter trigger UpdateJoiningTableAfterInsertAndUpdate
	on [Movie]
	for insert, update
as
begin
	declare cur cursor local for select i.[ID], i.[Cast], i.[Directors], d.[ID] from inserted i full outer join deleted d on i.ID = d.ID
	declare @iMovieId int
	declare @iCast nvarchar(200)
	declare @iDirectors nvarchar(60)
	declare @dMovieId int
	declare @personId int

	open cur
	fetch next from cur into @iMovieId, @iCast, @iDirectors, @dMovieId
	while @@FETCH_STATUS = 0
	begin
		if @dMovieId is null
		begin
			declare personcur cursor local for select [ID] from [Person] where @iCast like concat('%', [FullName], '%') or @iDirectors like concat('%', [FullName], '%')
			open personcur
			fetch next from personcur into @personId
			while @@FETCH_STATUS = 0
			begin
				insert into [MoviePersonJoiningTable] values (@iMovieId, @personId)

				fetch next from personcur into @personId
			end
			close personcur
			deallocate personcur
		end
		else
		begin
			delete from [MoviePersonJoiningTable] where [MovieID] = @dMovieId

			declare personcur cursor local for select [ID] from [Person] where @iCast like concat('%', [FullName], '%') or @iDirectors like concat('%', [FullName], '%')
			open personcur
			fetch next from personcur into @personId
			while @@FETCH_STATUS = 0
			begin
				insert into [MoviePersonJoiningTable] values (@iMovieId, @personId)

				fetch next from personcur into @personId
			end
			close personcur
			deallocate personcur
		end

		fetch next from cur into @iMovieId, @iCast, @iDirectors, @dMovieId
	end
	close cur
	deallocate cur
end