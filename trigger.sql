CREATE OR ALTER TRIGGER UpdateJoiningTableAfterPersonInsert
	ON Person
	FOR INSERT
AS 
BEGIN
	DECLARE @personID int = (SELECT TOP(1) [ID] FROM INSERTED i)
	PRINT(CONCAT('Inserted Person ID: ', CONVERT(nvarchar, @personID)))
	DECLARE @personFullName nvarchar(60) = (SELECT TOP(1) [FullName] FROM INSERTED i)
	PRINT(CONCAT('Inserted Person FullName: ', @personFullName))
	DECLARE @movieID int

	DECLARE MovieCursor CURSOR
		FOR 
		SELECT [ID]
		FROM [Movie]
		WHERE [Directors] LIKE CONCAT('%', @personFullName, '%') OR [Cast] LIKE CONCAT('%', @personFullName, '%')

	OPEN MovieCursor
	FETCH NEXT FROM MovieCursor INTO @movieID
	PRINT (CONVERT(nvarchar, @movieID))
	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO [MoviePersonJoiningTable]
		VALUES (@movieID, @personID)

		PRINT(CONCAT('MovieID: ', CONVERT(nvarchar, @movieID), ' PersonID: ', CONVERT(nvarchar, @personID)))

		FETCH NEXT FROM MovieCursor INTO @movieID
	END
	CLOSE MovieCursor
	DEALLOCATE MovieCursor
END