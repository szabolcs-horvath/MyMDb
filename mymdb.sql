IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].Movie') AND type in (N'U'))
	DROP TABLE Movie

CREATE TABLE Movie (
	ID int IDENTITY PRIMARY KEY,
	YourRating int,
	DateRated nchar(10),
	Title nvarchar(100),
	[URL] nvarchar(100),
	TitleType nvarchar(20),
	IMDbRating float,
	Runtimemins int,
	[Year] int,
	Genres nvarchar(60),
	ReleaseDate nchar(10),
	Directors nvarchar(60)
)