Select *
From Person
Where Person.FullName = 'Jeff Bridges'

Delete
From MoviePersonJoiningTable
Where MoviePersonJoiningTable.PersonID = (
	Select ID
	From Person
	Where Person.FullName = 'Jeff Bridges'
)
Delete
From Person
Where Person.FullName = 'Jeff Bridges'

INSERT INTO Person
VALUES ('Jeff Bridges', '1949-12-04', 'Los Angeles, California, USA')