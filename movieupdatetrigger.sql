CREATE OR ALTER TRIGGER UpdateJoiningTableAfterMovieUpdate
	ON [Movie]
	FOR UPDATE
AS
BEGIN
	DECLARE @insertedMovieID int = (SELECT TOP(1) [ID] FROM INSERTED i)
	DECLARE @deletedMovieID int = (SELECT TOP(1) [ID] FROM DELETED d)

	IF(@insertedMovieID = @deletedMovieID)
	BEGIN
		DECLARE @insertedMovieCast nvarchar(200) = (SELECT TOP(1) [Cast] FROM INSERTED i)
		DECLARE @insertedMovieDirectors nvarchar(200) = (SELECT TOP(1) [Directors] FROM INSERTED i)
		DECLARE @deletedMovieCast nvarchar(200) = (SELECT TOP(1) [Cast] FROM DELETED d)
		DECLARE @deletedMovieDirectors nvarchar(200) = (SELECT TOP(1) [Directors] FROM DELETED d)
		DECLARE @personID int

		DECLARE PersonCursor CURSOR FORWARD_ONLY
		FOR
		SELECT [ID]
		FROM [Person]
		WHERE @insertedMovieDirectors LIKE CONCAT('%', FullName, '%') OR @insertedMovieCast LIKE CONCAT('%', FullName, '%')

		DELETE
		FROM [MoviePersonJoiningTable]
		WHERE [PersonID] IN (
			SELECT [ID]
			FROM [Person]
			WHERE @deletedMovieDirectors LIKE CONCAT('%', FullName, '%') OR @deletedMovieCast LIKE CONCAT('%', FullName, '%')
		)

		OPEN PersonCursor
		FETCH NEXT FROM PersonCursor INTO @personID
		WHILE @@FETCH_STATUS = 0
		BEGIN
			INSERT INTO [MoviePersonJoiningTable]
			VALUES (@insertedMovieID, @personID)

			PRINT(CONCAT('Inserted into joining table through update trigger: MovieID: ', CONVERT(nvarchar, @insertedMovieID), ' PersonID: ', CONVERT(nvarchar, @personID)))

			FETCH NEXT FROM PersonCursor INTO @personID
		END
		CLOSE PersonCursor
		DEALLOCATE PersonCursor
	END
END