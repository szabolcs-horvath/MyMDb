CREATE OR ALTER TRIGGER UpdateJoiningTableAfterPersonInsert
	ON Person
	FOR INSERT, UPDATE
AS 
BEGIN
	DECLARE @personID int = (SELECT TOP(1) [ID] FROM INSERTED i)
	DECLARE @personFullName nvarchar(60) = (SELECT TOP(1) [FullName] FROM INSERTED i)
	DECLARE @movieID int

	DECLARE MovieCursor CURSOR FORWARD_ONLY
		FOR 
		SELECT [ID]
		FROM [Movie]
		WHERE [Directors] LIKE CONCAT('%', @personFullName, '%') OR [Cast] LIKE CONCAT('%', @personFullName, '%')

	OPEN MovieCursor
	FETCH NEXT FROM MovieCursor INTO @movieID
	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO [MoviePersonJoiningTable]
		VALUES (@movieID, @personID)

		PRINT(CONCAT('Inserted into joining table: MovieID: ', CONVERT(nvarchar, @movieID), ' PersonID: ', CONVERT(nvarchar, @personID)))

		FETCH NEXT FROM MovieCursor INTO @movieID
	END
	CLOSE MovieCursor
	DEALLOCATE MovieCursor
END