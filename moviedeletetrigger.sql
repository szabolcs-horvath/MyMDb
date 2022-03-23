CREATE OR ALTER TRIGGER UpdateJoiningTableAfterMovieDelete
	ON [Movie]
	INSTEAD OF DELETE
AS
BEGIN
	DECLARE @movieID int = (SELECT TOP(1) [ID] FROM DELETED d)

	DELETE FROM [MoviePersonJoiningTable]
		WHERE [MovieID] = @movieID

	DELETE FROM [Movie]
		WHERE [ID] = @movieID
END