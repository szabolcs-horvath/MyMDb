CREATE OR ALTER TRIGGER UpdateJoiningTableAfterPersonDelete
	ON [Person]
	INSTEAD OF DELETE
AS
BEGIN
	DECLARE @personID int = (SELECT TOP(1) [ID] FROM DELETED d)

	DELETE FROM [MoviePersonJoiningTable]
		WHERE [PersonID] = @personID	

	DELETE FROM [Person]
		WHERE [ID] = @personID
END