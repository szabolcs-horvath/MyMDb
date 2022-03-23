DECLARE @person nvarchar(60) = 'Joaquin Phoenix'

Select *
From Person
Where Person.FullName = @person

/* Delete
From MoviePersonJoiningTable
Where MoviePersonJoiningTable.PersonID = (
	Select ID
	From Person
	Where Person.FullName = @person
)
Delete
From Person
Where Person.FullName = @person */

Select *
FROM MoviePersonJoiningTable
Where MoviePersonJoiningTable.PersonID = (
	Select ID
	From Person
	Where Person.FullName = @person
)