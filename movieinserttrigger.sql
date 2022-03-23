CREATE OR ALTER TRIGGER UpdateJoiningTableAfterMovieInsert
	ON [Movie]
	FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @movieID int = (SELECT TOP(1) [ID] FROM INSERTED i)
	DECLARE @movieDirectors nvarchar(60) = (SELECT TOP(1) [Directors] FROM INSERTED i)
	DECLARE @movieCast nvarchar(200) = (SELECT TOP(1) [Cast] FROM INSERTED i)
	DECLARE @personID int

	DECLARE PersonCursor CURSOR FORWARD_ONLY
		FOR
		SELECT [ID]
		FROM [Person]
		WHERE @movieDirectors LIKE CONCAT('%', FullName, '%') OR @movieCast LIKE CONCAT('%', FullName, '%')

	OPEN PersonCursor
	FETCH NEXT FROM PersonCursor INTO @personID
	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO [MoviePersonJoiningTable]
		VALUES (@movieID, @personID)

		PRINT(CONCAT('Inserted into joining table: MovieID: ', CONVERT(nvarchar, @movieID), ' PersonID: ', CONVERT(nvarchar, @personID)))

		FETCH NEXT FROM PersonCursor INTO @personID
	END
	CLOSE PersonCursor
	DEALLOCATE PersonCursor
END