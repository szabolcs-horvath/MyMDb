USE [MyMDb]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 2022. 06. 07. 21:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YourRating] [int] NULL,
	[DateRated] [nchar](10) NULL,
	[Title] [nvarchar](100) NULL,
	[URL] [nvarchar](100) NULL,
	[TitleType] [nvarchar](20) NULL,
	[IMDbRating] [float] NULL,
	[Runtimemins] [int] NULL,
	[Year] [int] NULL,
	[Genres] [nvarchar](60) NULL,
	[ReleaseDate] [nchar](10) NULL,
	[Directors] [nvarchar](60) NULL,
	[Cast] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MoviePersonJoiningTable]    Script Date: 2022. 06. 07. 21:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoviePersonJoiningTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MovieID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 2022. 06. 07. 21:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](60) NULL,
	[Birthdate] [nvarchar](10) NULL,
	[Birthplace] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Movie] ON 
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (1, 8, N'2021-07-04', N'Druk', N'https://www.imdb.com/title/tt10288566/', N'movie', 7.7, 117, 2020, N'Comedy, Drama', N'2020-09-12', N'Thomas Vinterberg', N'Mads Mikkelsen, Thomas Bo Larsen, Magnus Millang, Lars Ranthe')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (2, 10, N'2021-08-01', N'The Silence of the Lambs', N'https://www.imdb.com/title/tt0102926/', N'movie', 8.6, 118, 1991, N'Crime, Drama, Thriller', N'1991-01-30', N'Jonathan Demme', N'Jodie Foster, Anthony Hopkins')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (3, 9, N'2022-02-05', N'Reservoir Dogs', N'https://www.imdb.com/title/tt0105236/', N'movie', 8.3, 99, 1992, N'Crime, Drama, Thriller', N'1992-01-21', N'Quentin Tarantino', N'Harvey Keitel, Tim Roth, Steve Buscemi')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (4, 10, N'2021-12-29', N'Schindler''s List', N'https://www.imdb.com/title/tt0108052/', N'movie', 9, 195, 1993, N'Biography, Drama, History', N'1993-11-30', N'Steven Spielberg', N'Liam Neeson, Ralph Fiennes, Ben Kingsley')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (5, 8, N'2022-02-12', N'The Chestnut Man', N'https://www.imdb.com/title/tt10834220/', N'tvSeries', 7.7, 50, 2021, N'Crime, Drama, Mystery, Thriller', N'2021-09-29', N'', N'Danica Curcic, David Dencik, Mikkel Boe Følsgaard, Iben Dorner, Lars Ranthe')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (6, 6, N'2021-12-31', N'Spider-Man: No Way Home', N'https://www.imdb.com/title/tt10872600/', N'movie', 8.7, 148, 2021, N'Action, Adventure, Fantasy, Sci-Fi', N'2021-12-13', N'Jon Watts', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (7, 9, N'2021-07-18', N'Forrest Gump', N'https://www.imdb.com/title/tt0109830/', N'movie', 8.8, 142, 1994, N'Drama, Romance', N'1994-06-23', N'Robert Zemeckis', N'Tom Hanks')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (8, 8, N'2021-12-11', N'Léon', N'https://www.imdb.com/title/tt0110413/', N'movie', 8.6, 110, 1994, N'Action, Crime, Drama, Thriller', N'1994-09-14', N'Luc Besson', N'Jean Reno, Gary Oldman, Natalie Portman')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (9, 10, N'2021-07-30', N'Pulp Fiction', N'https://www.imdb.com/title/tt0110912/', N'movie', 8.9, 154, 1994, N'Crime, Drama', N'1994-05-21', N'Quentin Tarantino', N'John Travolta, Uma Thurman, Samuel L. Jackson, Bruce Willis, Tim Roth, Harvey Keitel')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (10, 10, N'2021-07-02', N'The Shawshank Redemption', N'https://www.imdb.com/title/tt0111161/', N'movie', 9.3, 142, 1994, N'Drama', N'1994-09-10', N'Frank Darabont', N'Tim Robbins, Morgan Freeman')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (11, 9, N'2021-12-12', N'Shutter Island', N'https://www.imdb.com/title/tt1130884/', N'movie', 8.2, 138, 2010, N'Mystery, Thriller', N'2010-02-13', N'Martin Scorsese', N'Leonardo DiCaprio, Mark Ruffalo, Ben Kingsley, Michelle Williams')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (12, 9, N'2021-08-29', N'Se7en', N'https://www.imdb.com/title/tt0114369/', N'movie', 8.6, 127, 1995, N'Crime, Drama, Mystery, Thriller', N'1995-09-15', N'David Fincher', N'Morgan Freeman, Brad Pitt, Kevin Spacey, R. Lee Ermey')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (13, 9, N'2021-12-12', N'Dune: Part One', N'https://www.imdb.com/title/tt1160419/', N'movie', 8.1, 155, 2021, N'Action, Adventure, Drama, Sci-Fi', N'2021-09-03', N'Denis Villeneuve', N'Timothée Chalamet, Zendaya, Oscar Isaac, Jason Momoa, Stellan Skarsgård')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (14, 9, N'2022-01-20', N'Fargo', N'https://www.imdb.com/title/tt0116282/', N'movie', 8.1, 98, 1996, N'Crime, Thriller', N'1996-03-08', N'Ethan Coen, Joel Coen', N'William H. Macy, Frances McDormand, Steve Buscemi, Peter Stormare')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (15, 8, N'2021-11-21', N'Jerry Maguire', N'https://www.imdb.com/title/tt0116695/', N'movie', 7.3, 139, 1996, N'Comedy, Drama, Romance, Sport', N'1996-12-06', N'Cameron Crowe', N'Tom Cruise, Renée Zellweger')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (16, 9, N'2021-12-29', N'Trainspotting', N'https://www.imdb.com/title/tt0117951/', N'movie', 8.2, 93, 1996, N'Drama', N'1996-02-23', N'Danny Boyle', N'Ewan McGregor, Ewen Bremner, Jonny Lee Miller, Kevin McKidd')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (17, 7, N'2021-12-29', N'The Big Lebowski', N'https://www.imdb.com/title/tt0118715/', N'movie', 8.1, 117, 1998, N'Comedy, Crime', N'1998-01-18', N'Ethan Coen, Joel Coen', N'Jeff Bridges, John Goodman, Julianne Moore, Steve Buscemi, Philip Seymour Hoffman')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (18, 10, N'2021-07-02', N'Good Will Hunting', N'https://www.imdb.com/title/tt0119217/', N'movie', 8.3, 126, 1997, N'Drama, Romance', N'1997-12-02', N'Gus Van Sant', N'Robin Williams, Matt Damon, Ben Affleck, Stellan Skarsgård')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (19, 7, N'2021-12-12', N'The Truman Show', N'https://www.imdb.com/title/tt0120382/', N'movie', 8.2, 103, 1998, N'Comedy, Drama', N'1998-06-01', N'Peter Weir', N'Jim Carrey, Ed Harris, Laura Linney')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (20, 8, N'2021-07-29', N'The Green Mile', N'https://www.imdb.com/title/tt0120689/', N'movie', 8.6, 189, 1999, N'Crime, Drama, Fantasy, Mystery', N'1999-12-06', N'Frank Darabont', N'Tom Hanks, Michael Clarke Duncan, David Morse, Sam Rockwell')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (21, 8, N'2021-11-20', N'The World''s End', N'https://www.imdb.com/title/tt1213663/', N'movie', 7, 109, 2013, N'Comedy, Sci-Fi', N'2013-07-10', N'Edgar Wright', N'Simon Pegg, Nick Frost, Martin Freeman')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (22, 6, N'2021-11-20', N'Bellflower', N'https://www.imdb.com/title/tt1242599/', N'movie', 6.3, 103, 2011, N'Action, Drama, Romance', N'2011-01-21', N'Evan Glodell', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (23, 8, N'2021-08-08', N'The Matrix', N'https://www.imdb.com/title/tt0133093/', N'movie', 8.7, 136, 1999, N'Action, Sci-Fi', N'1999-03-24', N'Lilly Wachowski, Lana Wachowski', N'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (24, 7, N'2021-07-30', N'Fight Club', N'https://www.imdb.com/title/tt0137523/', N'movie', 8.8, 139, 1999, N'Drama', N'1999-09-10', N'David Fincher', N'Brad Pitt, Edward Norton')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (25, 8, N'2021-07-30', N'Inception', N'https://www.imdb.com/title/tt1375666/', N'movie', 8.8, 148, 2010, N'Action, Adventure, Sci-Fi, Thriller', N'2010-07-08', N'Christopher Nolan', N'Leonardo DiCaprio, Joseph Gordon-Levitt, Elliot Page, Ken Watanabe, Tom Hardy')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (26, 9, N'2021-12-05', N'American Psycho', N'https://www.imdb.com/title/tt0144084/', N'movie', 7.6, 102, 2000, N'Crime, Drama, Horror', N'2000-01-21', N'Mary Harron', N'Christian Bale, Reese Witherspoon, Jared Leto, Willem Dafoe')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (27, 10, N'2021-08-11', N'Intouchables', N'https://www.imdb.com/title/tt1675434/', N'movie', 8.5, 112, 2011, N'Biography, Comedy, Drama', N'2011-09-23', N'Olivier Nakache, Éric Toledano', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (28, 8, N'2022-01-10', N'Django Unchained', N'https://www.imdb.com/title/tt1853728/', N'movie', 8.5, 165, 2012, N'Drama, Western', N'2012-12-11', N'Quentin Tarantino', N'Jamie Foxx, Christoph Waltz, Leonardo DiCaprio, Kerry Washington, Samuel L. Jackson')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (29, 10, N'2021-12-22', N'Band of Brothers', N'https://www.imdb.com/title/tt0185906/', N'tvMiniSeries', 9.4, 594, 2001, N'Drama, History, War', N'2001-09-09', N'', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (30, 7, N'2021-07-02', N'Ford v Ferrari', N'https://www.imdb.com/title/tt1950186/', N'movie', 8.1, 152, 2019, N'Action, Biography, Drama, Sport', N'2019-08-30', N'James Mangold', N'Matt Damon, Christian Bale, Jon Bernthal')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (31, 8, N'2021-12-15', N'Snatch', N'https://www.imdb.com/title/tt0208092/', N'movie', 8.3, 104, 2000, N'Comedy, Crime', N'2000-08-23', N'Guy Ritchie', N'Jason Statham, Brad Pitt, Stephen Graham')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (32, 8, N'2021-07-02', N'Black Mirror', N'https://www.imdb.com/title/tt2085059/', N'tvSeries', 8.8, 60, 2011, N'Drama, Mystery, Sci-Fi, Thriller', N'2011-12-04', N'', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (33, 9, N'2021-08-30', N'Jagten', N'https://www.imdb.com/title/tt2106476/', N'movie', 8.3, 115, 2012, N'Drama', N'2012-05-20', N'Thomas Vinterberg', N'Mads Mikkelsen, Thomas Bo Larsen, Lars Ranthe')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (34, 10, N'2021-07-02', N'The Grand Budapest Hotel', N'https://www.imdb.com/title/tt2278388/', N'movie', 8.1, 99, 2014, N'Adventure, Comedy, Crime', N'2014-02-06', N'Wes Anderson', N'Ralph Fiennes, Adrien Brody, Willem Dafoe, Jeff Goldblum, Edward Norton, Saoirse Ronan, Harvey Keitel, Tom Wilkinson')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (35, 8, N'2021-07-02', N'Whiplash', N'https://www.imdb.com/title/tt2582802/', N'movie', 8.5, 106, 2014, N'Drama, Music', N'2014-01-16', N'Damien Chazelle', N'Miles Teller, J.K. Simmons, Melissa Benoist')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (36, 8, N'2021-09-05', N'Catch Me If You Can', N'https://www.imdb.com/title/tt0264464/', N'movie', 8.1, 141, 2002, N'Biography, Crime, Drama', N'2002-12-16', N'Steven Spielberg', N'Leonardo DiCaprio, Tom Hanks, Christopher Walken')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (37, 7, N'2022-03-04', N'Kill Bill: Vol. 1', N'https://www.imdb.com/title/tt0266697/', N'movie', 8.2, 111, 2003, N'Action, Crime, Drama, Thriller', N'2003-09-29', N'Quentin Tarantino', N'Uma Thurman, David Carradine, Daryl Hannah, Michael Madsen, Lucy Liu, Julie Dreyfus')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (38, 9, N'2021-10-07', N'A Beautiful Mind', N'https://www.imdb.com/title/tt0268978/', N'movie', 8.2, 135, 2001, N'Biography, Drama', N'2001-12-13', N'Ron Howard', N'Russell Crowe, Ed Harris, Jennifer Connelly, Christopher Plummer')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (39, 10, N'2021-11-20', N'Moszkva tér', N'https://www.imdb.com/title/tt0273840/', N'movie', 7.8, 88, 2001, N'Comedy, Drama, Romance', N'2001-02-01', N'Ferenc Török', N'Eszter Balla')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (40, 7, N'2021-12-04', N'Eternal Sunshine of the Spotless Mind', N'https://www.imdb.com/title/tt0338013/', N'movie', 8.3, 108, 2004, N'Drama, Romance, Sci-Fi', N'2004-03-09', N'Michel Gondry', N'Jim Carrey, Kate Winslet, Tom Wilkinson, Elijah Wood, Mark Ruffalo, Kirsten Dunst')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (41, 9, N'2022-01-17', N'Salinui chueok', N'https://www.imdb.com/title/tt0353969/', N'movie', 8.1, 131, 2003, N'Crime, Drama, Mystery, Thriller', N'2003-05-02', N'Bong Joon Ho', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (42, 10, N'2021-12-12', N'Inglourious Basterds', N'https://www.imdb.com/title/tt0361748/', N'movie', 8.3, 153, 2009, N'Adventure, Drama, War', N'2009-05-20', N'Quentin Tarantino', N'Brad Pitt, Christoph Waltz, Diane Kruger, Mélanie Laurent, Julie Dreyfus')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (43, 7, N'2021-11-20', N'Shaun of the Dead', N'https://www.imdb.com/title/tt0365748/', N'movie', 7.9, 99, 2004, N'Comedy, Horror', N'2004-03-29', N'Edgar Wright', N'Simon Pegg, Nick Frost, Kate Ashfield')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (44, 8, N'2021-08-08', N'Kontroll', N'https://www.imdb.com/title/tt0373981/', N'movie', 7.6, 111, 2003, N'Comedy, Crime, Drama, Romance, Thriller', N'2003-11-20', N'Nimród Antal', N'Sándor Csányi, Eszter Balla, Zoltán Mucsi, Csaba Pindroch')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (45, 8, N'2022-02-26', N'Synecdoche, New York', N'https://www.imdb.com/title/tt0383028/', N'movie', 7.5, 124, 2008, N'Drama', N'2008-05-23', N'Charlie Kaufman', N'Philip Seymour Hoffman, Samantha Morton, Michelle Williams, Catherine Keener')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (46, 9, N'2021-07-02', N'The Office', N'https://www.imdb.com/title/tt0386676/', N'tvSeries', 9, 22, 2005, N'Comedy', N'2005-03-24', N'', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (47, 9, N'2021-08-03', N'Baby Driver', N'https://www.imdb.com/title/tt3890160/', N'movie', 7.6, 113, 2017, N'Action, Crime, Drama, Music, Thriller', N'2017-03-11', N'Edgar Wright', N'Ansel Elgort, Kevin Spacey, Jamie Foxx')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (48, 9, N'2022-01-12', N'Das Leben der Anderen', N'https://www.imdb.com/title/tt0405094/', N'movie', 8.4, 137, 2006, N'Drama, Mystery, Thriller', N'2006-03-15', N'Florian Henckel von Donnersmarck', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (49, 9, N'2021-08-21', N'The Departed', N'https://www.imdb.com/title/tt0407887/', N'movie', 8.5, 151, 2006, N'Crime, Drama, Thriller', N'2006-09-26', N'Martin Scorsese', N'Leonardo DiCaprio, Matt Damon, Jack Nicholson, Mark Wahlberg')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (50, 9, N'2021-11-20', N'Hot Fuzz', N'https://www.imdb.com/title/tt0425112/', N'movie', 7.8, 121, 2007, N'Action, Comedy, Mystery, Thriller', N'2007-02-13', N'Edgar Wright', N'Simon Pegg, Nick Frost, Martin Freeman')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (51, 8, N'2021-11-20', N'Fantastic Mr. Fox', N'https://www.imdb.com/title/tt0432283/', N'movie', 7.9, 87, 2009, N'Animation, Adventure, Comedy, Crime, Drama, Family', N'2009-10-14', N'Wes Anderson', N'George Clooney, Meryl Streep, Willem Dafoe')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (52, 9, N'2021-07-02', N'Stranger Things', N'https://www.imdb.com/title/tt4574334/', N'tvSeries', 8.7, 51, 2016, N'Drama, Fantasy, Horror, Mystery, Sci-Fi, Thriller', N'2016-07-11', N'', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (53, 9, N'2021-11-20', N'How I Met Your Mother', N'https://www.imdb.com/title/tt0460649/', N'tvSeries', 8.4, 22, 2005, N'Comedy, Romance', N'2005-09-19', N'', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (54, 6, N'2021-12-17', N'The Death of Stalin', N'https://www.imdb.com/title/tt4686844/', N'movie', 7.2, 107, 2017, N'Comedy, Drama, History', N'2017-09-08', N'Armando Iannucci', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (55, 7, N'2021-12-16', N'Rear Window', N'https://www.imdb.com/title/tt0047396/', N'movie', 8.5, 112, 1954, N'Mystery, Thriller', N'1954-08-01', N'Alfred Hitchcock', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (56, 10, N'2021-07-04', N'12 Angry Men', N'https://www.imdb.com/title/tt0050083/', N'movie', 9, 96, 1957, N'Crime, Drama', N'1957-04-10', N'Sidney Lumet', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (57, 10, N'2022-01-08', N'Three Billboards Outside Ebbing, Missouri', N'https://www.imdb.com/title/tt5027774/', N'movie', 8.1, 115, 2017, N'Comedy, Crime, Drama', N'2017-09-04', N'Martin McDonagh', N'Frances McDormand, Woody Harrelson, Sam Rockwell, Peter Dinklage')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (58, 9, N'2021-07-02', N'Aranyélet', N'https://www.imdb.com/title/tt5099020/', N'tvSeries', 8.8, 60, 2015, N'Action, Crime, Drama, Thriller', N'2015-11-08', N'', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (59, 9, N'2021-12-19', N'The Witcher', N'https://www.imdb.com/title/tt5180504/', N'tvSeries', 8.3, 60, 2019, N'Action, Adventure, Drama, Fantasy, Mystery', N'2019-12-20', N'', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (60, 4, N'2021-12-29', N'Riverdale', N'https://www.imdb.com/title/tt5420376/', N'tvSeries', 6.8, 45, 2017, N'Crime, Drama, Mystery, Romance', N'2017-01-26', N'', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (61, 7, N'2021-11-22', N'A tizedes meg a többiek', N'https://www.imdb.com/title/tt0059812/', N'movie', 8.4, 111, 1965, N'Comedy, War', N'1965-04-15', N'Márton Keleti', N'Tamás Major, Imre Sinkovits, Iván Darvas')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (62, 7, N'2021-08-13', N'The End of the F***ing World', N'https://www.imdb.com/title/tt6257970/', N'tvSeries', 8.1, 25, 2017, N'Adventure, Comedy, Crime, Drama, Romance, Thriller', N'2017-10-24', N'', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (63, 8, N'2021-12-15', N'Isten hozta örnagy úr', N'https://www.imdb.com/title/tt0064498/', N'movie', 8.1, 95, 1969, N'Comedy, Drama', N'1969-11-29', N'Zoltán Fábri', N'Zoltán Latinovits, Imre Sinkovits')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (64, 7, N'2021-12-21', N'La casa de papel', N'https://www.imdb.com/title/tt6468322/', N'tvSeries', 8.3, 70, 2017, N'Action, Crime, Drama, Mystery, Thriller', N'2017-05-02', N'', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (65, 9, N'2021-12-15', N'A tanú', N'https://www.imdb.com/title/tt0065067/', N'movie', 8.7, 105, 1969, N'Drama, Comedy', N'1969-05-23', N'Péter Bacsó', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (66, 10, N'2021-07-19', N'Gisaengchung', N'https://www.imdb.com/title/tt6751668/', N'movie', 8.5, 132, 2019, N'Comedy, Drama, Thriller', N'2019-05-21', N'Bong Joon Ho', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (67, 10, N'2021-07-03', N'The Godfather', N'https://www.imdb.com/title/tt0068646/', N'movie', 9.2, 175, 1972, N'Crime, Drama', N'1972-03-14', N'Francis Ford Coppola', N'Al Pacino, Diane Keaton, Marlon Brando, James Caan, Robert Duvall, John Cazale')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (68, 2, N'2022-01-17', N'Mamma Mia! Here We Go Again', N'https://www.imdb.com/title/tt6911608/', N'movie', 6.6, 114, 2018, N'Comedy, Musical, Romance', N'2018-07-11', N'Ol Parker', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (69, 7, N'2021-07-03', N'The Godfather: Part II', N'https://www.imdb.com/title/tt0071562/', N'movie', 9, 202, 1974, N'Crime, Drama', N'1974-12-12', N'Francis Ford Coppola', N'Al Pacino, Robert De Niro, Robert Duvall, Diane Keaton, John Cazale')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (70, 10, N'2021-07-30', N'One Flew Over the Cuckoo''s Nest', N'https://www.imdb.com/title/tt0073486/', N'movie', 8.7, 133, 1975, N'Drama', N'1975-11-19', N'Milos Forman', N'Jack Nicholson, Danny DeVito')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (71, 10, N'2021-07-02', N'Chernobyl', N'https://www.imdb.com/title/tt7366338/', N'tvMiniSeries', 9.4, 330, 2019, N'Drama, History, Thriller', N'2019-05-06', N'', N'Jessie Buckley, Jared Harris, Stellan Skarsgård')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (72, 7, N'2021-12-30', N'Taxi Driver', N'https://www.imdb.com/title/tt0075314/', N'movie', 8.3, 114, 1976, N'Crime, Drama', N'1976-02-08', N'Martin Scorsese', N'Robert De Niro, Jodie Foster, Cybill Shepherd')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (73, 10, N'2021-12-29', N'Az ötödik pecsét', N'https://www.imdb.com/title/tt0075467/', N'movie', 8.6, 111, 1976, N'Drama, War', N'1976-10-07', N'Zoltán Fábri', N'Zoltán Latinovits')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (74, 10, N'2021-11-07', N'Annie Hall', N'https://www.imdb.com/title/tt0075686/', N'movie', 8, 93, 1977, N'Comedy, Romance', N'1977-03-27', N'Woody Allen', N'Woody Allen, Diane Keaton')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (75, 8, N'2022-01-24', N'In Bruges', N'https://www.imdb.com/title/tt0780536/', N'movie', 7.9, 107, 2008, N'Comedy, Crime, Drama, Thriller', N'2008-01-17', N'Martin McDonagh', N'Colin Farrell, Brendan Gleeson')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (76, 8, N'2021-12-29', N'Life of Brian', N'https://www.imdb.com/title/tt0079470/', N'movie', 8.1, 94, 1979, N'Comedy', N'1979-08-17', N'Terry Jones', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (77, 6, N'2022-01-17', N'Mamma Mia!', N'https://www.imdb.com/title/tt0795421/', N'movie', 6.5, 108, 2008, N'Comedy, Musical, Romance', N'2008-06-30', N'Phyllida Lloyd', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (78, 7, N'2021-07-23', N'The Mandalorian', N'https://www.imdb.com/title/tt8111088/', N'tvSeries', 8.8, 40, 2019, N'Action, Adventure, Fantasy, Sci-Fi', N'2019-11-12', N'', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (79, 7, N'2021-08-12', N'The Shining', N'https://www.imdb.com/title/tt0081505/', N'movie', 8.4, 146, 1980, N'Drama, Horror', N'1980-05-23', N'Stanley Kubrick', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (80, 7, N'2021-07-07', N'Formula 1: Drive to Survive', N'https://www.imdb.com/title/tt8289930/', N'tvSeries', 8.7, 40, 2019, N'Documentary, Sport', N'2019-03-08', N'', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (81, 6, N'2021-11-20', N'Midsommar', N'https://www.imdb.com/title/tt8772262/', N'movie', 7.1, 148, 2019, N'Drama, Horror, Mystery, Thriller', N'2019-06-24', N'Ari Aster', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (82, 5, N'2022-01-17', N'The French Dispatch', N'https://www.imdb.com/title/tt8847712/', N'movie', 7.2, 107, 2021, N'Comedy, Drama, Romance', N'2021-07-12', N'Wes Anderson', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (83, 9, N'2022-01-19', N'Knives Out', N'https://www.imdb.com/title/tt8946378/', N'movie', 7.9, 130, 2019, N'Comedy, Crime, Drama, Mystery, Thriller', N'2019-09-07', N'Rian Johnson', N'Daniel Craig, Chris Evans, Ana de Armas')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (84, 7, N'2021-08-29', N'Dark Waters', N'https://www.imdb.com/title/tt9071322/', N'movie', 7.6, 126, 2019, N'Biography, Drama, History', N'2019-11-12', N'Todd Haynes', N'Mark Ruffalo, Anne Hathaway, Tim Robbins')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (85, 6, N'2022-02-26', N'Der Name der Rose', N'https://www.imdb.com/title/tt0091605/', N'movie', 7.7, 130, 1986, N'Drama, History, Mystery, Thriller', N'1986-09-24', N'Jean-Jacques Annaud', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (86, 10, N'2021-08-13', N'Game of Thrones', N'https://www.imdb.com/title/tt0944947/', N'tvSeries', 9.3, 57, 2011, N'Action, Adventure, Drama, Fantasy', N'2011-04-16', N'', N'Emilia Clarke, Peter Dinklage, Kit Harington')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (87, 7, N'2021-11-01', N'Rain Man', N'https://www.imdb.com/title/tt0095953/', N'movie', 8, 133, 1988, N'Drama', N'1988-12-12', N'Barry Levinson', N'Dustin Hoffman, Tom Cruise, Valeria Golino')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (88, 6, N'2022-01-17', N'Last Night in Soho', N'https://www.imdb.com/title/tt9639470/', N'movie', 7.1, 116, 2021, N'Drama, Horror, Mystery, Thriller', N'2021-09-04', N'Edgar Wright', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (89, 8, N'2021-12-29', N'Dead Poets Society', N'https://www.imdb.com/title/tt0097165/', N'movie', 8.1, 128, 1989, N'Comedy, Drama', N'1989-06-02', N'Peter Weir', N'Robin Williams, Ethan Hawke')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (90, 7, N'2022-02-12', N'The Wolf of Wall Street', N'https://www.imdb.com/title/tt0993846/', N'movie', 8.2, 180, 2013, N'Biography, Comedy, Crime, Drama', N'2013-12-09', N'Martin Scorsese', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (91, 8, N'2022-01-31', N'Goodfellas', N'https://www.imdb.com/title/tt0099685/', N'movie', 8.7, 146, 1990, N'Biography, Crime, Drama', N'1990-09-09', N'Martin Scorsese', N'Robert De Niro, Ray Liotta, Joe Pesci')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (92, 0, N'          ', N'Into the Wild', N'https://www.imdb.com/title/tt0758758/', N'movie', 8.1, 148, 2007, N'Adventure, Biography, Drama', N'2007-09-01', N'Sean Penn', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (93, 0, N'          ', N'The Father', N'https://www.imdb.com/title/tt10272386/', N'movie', 8.3, 97, 2020, N'Drama, Mystery', N'2020-01-27', N'Florian Zeller', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (94, 0, N'          ', N'Retfærdighedens ryttere', N'https://www.imdb.com/title/tt11655202/', N'movie', 7.6, 116, 2020, N'Action, Comedy, Drama', N'2020-11-19', N'Anders Thomas Jensen', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (95, 9, N'2022-03-11', N'Divas', N'https://www.imdb.com/title/tt15123120/', N'movie', 7.7, 80, 2021, N'Documentary', N'2021-08-18', N'Máté Körösi', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (96, 0, N'          ', N'Ordinary People', N'https://www.imdb.com/title/tt0081283/', N'movie', 7.8, 124, 1980, N'Drama', N'1980-09-19', N'Robert Redford', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (97, 0, N'          ', N'Gandhi', N'https://www.imdb.com/title/tt0083987/', N'movie', 8.1, 191, 1982, N'Biography, Drama', N'1982-11-30', N'Richard Attenborough', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (98, 0, N'          ', N'Amadeus', N'https://www.imdb.com/title/tt0086879/', N'movie', 8.4, 160, 1984, N'Biography, Drama, Music', N'1984-09-06', N'Milos Forman', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (99, 0, N'          ', N'Jakob the Liar', N'https://www.imdb.com/title/tt0120716/', N'movie', 6.5, 120, 1999, N'Drama, War', N'1999-09-16', N'Peter Kassovitz', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (100, 0, N'          ', N'Valahol Európában', N'https://www.imdb.com/title/tt0039949/', N'movie', 7.7, 100, 1947, N'Drama', N'1947-12-23', N'Géza von Radványi', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (101, 0, N'          ', N'Seven Years in Tibet', N'https://www.imdb.com/title/tt0120102/', N'movie', 7.1, 136, 1997, N'Adventure, Biography, Drama, History, War', N'1997-09-13', N'Jean-Jacques Annaud', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (102, 0, N'          ', N'No Country for Old Men', N'https://www.imdb.com/title/tt0477348/', N'movie', 8.2, 122, 2007, N'Crime, Drama, Thriller', N'2007-05-19', N'Ethan Coen, Joel Coen', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (103, 0, N'          ', N'Scarface', N'https://www.imdb.com/title/tt0086250/', N'movie', 8.3, 170, 1983, N'Crime, Drama', N'1983-12-01', N'Brian De Palma', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (104, 0, N'          ', N'The Girl with the Dragon Tattoo', N'https://www.imdb.com/title/tt1568346/', N'movie', 7.8, 158, 2011, N'Crime, Drama, Mystery, Thriller', N'2011-12-12', N'David Fincher', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (105, 0, N'          ', N'Wild', N'https://www.imdb.com/title/tt2305051/', N'movie', 7.1, 115, 2014, N'Adventure, Biography, Drama', N'2014-08-29', N'Jean-Marc Vallée', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (106, 0, N'          ', N'Palmer', N'https://www.imdb.com/title/tt6857376/', N'movie', 7.2, 110, 2021, N'Drama', N'2021-01-29', N'Fisher Stevens', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (107, 0, N'          ', N'Wrath of Man', N'https://www.imdb.com/title/tt11083552/', N'movie', 7.1, 119, 2021, N'Action, Crime, Thriller', N'2021-04-22', N'Guy Ritchie', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (108, 0, N'          ', N'Minari', N'https://www.imdb.com/title/tt10633456/', N'movie', 7.5, 115, 2020, N'Drama', N'2020-01-26', N'Lee Isaac Chung', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (109, 0, N'          ', N'CODA', N'https://www.imdb.com/title/tt10366460/', N'movie', 8.1, 111, 2021, N'Comedy, Drama, Music', N'2021-01-29', N'Sian Heder', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (110, 0, N'          ', N'Spencer', N'https://www.imdb.com/title/tt12536294/', N'movie', 6.7, 117, 2021, N'Biography, Drama', N'2021-09-03', N'Pablo Larraín', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (111, 0, N'          ', N'The Wire', N'https://www.imdb.com/title/tt0306414/', N'tvSeries', 9.3, 59, 2002, N'Crime, Drama, Thriller', N'2002-06-02', N'', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (112, 0, N'          ', N'Peaky Blinders', N'https://www.imdb.com/title/tt2442560/', N'tvSeries', 8.8, 60, 2013, N'Crime, Drama', N'2013-09-12', N'', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (113, 0, N'          ', N'Mephisto', N'https://www.imdb.com/title/tt0082736/', N'movie', 7.7, 144, 1981, N'Drama', N'1981-02-11', N'István Szabó', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (114, 0, N'          ', N'Blade Runner 2049', N'https://www.imdb.com/title/tt1856101/', N'movie', 8, 164, 2017, N'Action, Drama, Mystery, Sci-Fi, Thriller', N'2017-10-03', N'Denis Villeneuve', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (115, 0, N'          ', N'The Lighthouse', N'https://www.imdb.com/title/tt7984734/', N'movie', 7.4, 109, 2019, N'Drama, Fantasy, Horror, Mystery', N'2019-05-19', N'Robert Eggers', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (116, 0, N'          ', N'La montaña sagrada', N'https://www.imdb.com/title/tt0071615/', N'movie', 7.8, 114, 1973, N'Adventure, Drama, Fantasy', N'1973-05-31', N'Alejandro Jodorowsky', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (117, 0, N'          ', N'V síti', N'https://www.imdb.com/title/tt11900404/', N'movie', 8, 100, 2020, N'Documentary, Crime', N'2020-02-27', N'Barbora Chalupová, Vít Klusák', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (118, 0, N'          ', N'El laberinto del fauno', N'https://www.imdb.com/title/tt0457430/', N'movie', 8.2, 118, 2006, N'Drama, Fantasy, War', N'2006-05-27', N'Guillermo del Toro', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (119, 0, N'          ', N'Le fabuleux destin d''Amélie Poulain', N'https://www.imdb.com/title/tt0211915/', N'movie', 8.3, 122, 2001, N'Comedy, Romance', N'2001-04-25', N'Jean-Pierre Jeunet', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (120, 0, N'          ', N'Madeo', N'https://www.imdb.com/title/tt1216496/', N'movie', 7.8, 129, 2009, N'Crime, Drama, Mystery, Thriller', N'2009-05-16', N'Bong Joon Ho', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (121, 0, N'          ', N'I''m Thinking of Ending Things', N'https://www.imdb.com/title/tt7939766/', N'movie', 6.6, 134, 2020, N'Drama, Thriller', N'2020-08-28', N'Charlie Kaufman', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (122, 0, N'          ', N'Requiem for a Dream', N'https://www.imdb.com/title/tt0180093/', N'movie', 8.3, 102, 2000, N'Drama', N'2000-05-14', N'Darren Aronofsky', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (123, 0, N'          ', N'Wild Roots', N'https://www.imdb.com/title/tt12719846/', N'movie', 7.6, 98, 2021, N'Drama', N'2021-08-26', N'Hajni Kis', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (124, 0, N'          ', N'Kill Bill: Vol. 2', N'https://www.imdb.com/title/tt0378194/', N'movie', 8, 137, 2004, N'Action, Crime, Thriller', N'2004-04-08', N'Quentin Tarantino', N'')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (1003, 0, N'          ', N'Joker', N'https://www.imdb.com/title/tt7286456/', N'movie', 8.4, 122, 2019, N'Crime, Drama, Thriller', N'2019-09-28', N'Todd Phillips', N'Joaquin Phoenix, Robert De Niro, Zazie Beetz, Frances Conroy, Brett Cullen')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (2003, 7, N'2022-03-27', N'Full Metal Jacket', N'https://www.imdb.com/title/tt0093058', N'movie', 8.3, 116, 1987, N'Drama, War', N'1987-07-10', N'Stanley Kubrick', N'Matthew Modine, R. Lee Ermey, Vincent D''Onofrio, Adam Baldwin, Dorian Harewood, Arliss Howard')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (2004, 8, N'2022-03-28', N'Ocean''s Eleven', N'https://www.imdb.com/title/tt0240772/', N'movie', 7.7, 116, 2001, N'Crime, Thriller', N'2001-12-05', N'Steven Soderbergh', N'George Clooney, Brad Pitt, Julia Roberts, Matt Damon, Bernie Mac')
GO
INSERT [dbo].[Movie] ([ID], [YourRating], [DateRated], [Title], [URL], [TitleType], [IMDbRating], [Runtimemins], [Year], [Genres], [ReleaseDate], [Directors], [Cast]) VALUES (5005, 8, N'2022-04-29', N'King Richard', N'https://www.imdb.com/title/tt9620288/', N'Movie', 7.5, 144, 2021, N'Biography, Drama, Sport', N'2021-09-02', N'Reinaldo Marcus Green', N'Will Smith, Aunjanue Ellis, Jon Bernthal')
GO
SET IDENTITY_INSERT [dbo].[Movie] OFF
GO
SET IDENTITY_INSERT [dbo].[MoviePersonJoiningTable] ON 
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (198, 67, 1)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (205, 69, 1)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (50, 14, 2)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (185, 57, 2)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (186, 57, 3)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (75, 20, 4)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (187, 57, 4)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (194, 63, 5)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (221, 73, 5)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (237, 86, 6)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (188, 57, 7)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (238, 86, 7)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (239, 86, 8)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (163, 44, 9)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (3054, 12, 10)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (4002, 2004, 10)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (103, 28, 11)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (154, 42, 11)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (155, 42, 12)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (156, 42, 13)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (26, 9, 14)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (27, 9, 15)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (133, 37, 15)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (28, 9, 16)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (104, 28, 16)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (29, 9, 17)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (8, 3, 18)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (30, 9, 18)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (66, 18, 19)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (245, 89, 19)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (67, 18, 20)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (109, 30, 20)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (172, 49, 20)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (4003, 2004, 20)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (68, 18, 21)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (44, 13, 22)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (69, 18, 22)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (214, 71, 22)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (33, 10, 23)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (233, 84, 23)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (3055, 12, 24)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (12, 4, 25)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (13, 4, 26)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (120, 34, 26)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (14, 4, 27)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (36, 11, 27)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (121, 34, 28)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (98, 26, 29)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (122, 34, 29)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (181, 51, 29)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (123, 34, 30)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (90, 24, 31)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (124, 34, 31)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (125, 34, 32)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (215, 71, 33)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (216, 71, 34)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (5, 2, 35)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (217, 72, 35)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (6, 2, 36)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (173, 49, 37)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (211, 70, 37)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (212, 70, 38)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (223, 74, 39)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (199, 67, 40)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (206, 69, 40)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (224, 74, 40)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (80, 21, 41)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (159, 43, 41)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (177, 50, 41)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (81, 21, 42)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (160, 43, 42)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (178, 50, 42)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (3056, 12, 43)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (229, 83, 44)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (230, 83, 45)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (231, 83, 46)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (59, 16, 47)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (20, 7, 48)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (76, 20, 48)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (129, 36, 48)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (37, 11, 49)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (92, 25, 49)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (105, 28, 49)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (130, 36, 49)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (174, 49, 49)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (175, 49, 50)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (38, 11, 51)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (146, 40, 51)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (234, 84, 51)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (169, 47, 52)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (45, 13, 53)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (46, 13, 54)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (47, 13, 55)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (48, 13, 56)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (9, 3, 57)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (31, 9, 57)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (126, 34, 57)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (99, 26, 59)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (110, 30, 59)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (100, 26, 60)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (101, 26, 61)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (1, 1, 62)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (117, 33, 62)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (2, 1, 63)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (118, 33, 63)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (52, 14, 64)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (53, 14, 65)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (56, 15, 66)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (240, 87, 66)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (57, 15, 67)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (190, 61, 68)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (195, 63, 68)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (106, 28, 69)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (170, 47, 69)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (107, 28, 70)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (82, 21, 71)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (179, 50, 71)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (93, 25, 72)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (94, 25, 73)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (95, 25, 74)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (96, 25, 75)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (114, 31, 76)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (115, 31, 77)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (22, 8, 78)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (23, 8, 79)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (3, 1, 81)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (225, 75, 82)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (226, 75, 83)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (182, 51, 84)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (4004, 2004, 84)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (183, 51, 85)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (246, 89, 86)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (77, 20, 87)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (78, 20, 88)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (164, 44, 89)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (165, 44, 90)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (166, 44, 91)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (16, 5, 92)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (17, 5, 93)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (4010, 5, 93)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (18, 5, 94)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (19, 5, 95)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (131, 36, 96)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (207, 69, 97)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (218, 72, 97)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (249, 91, 97)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (2021, 1003, 97)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (250, 91, 98)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (251, 91, 99)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (84, 23, 100)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (85, 23, 101)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (86, 23, 102)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (200, 67, 103)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (201, 67, 104)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (202, 67, 105)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (208, 69, 105)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (203, 67, 106)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (209, 69, 106)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (191, 61, 107)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (192, 61, 108)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (219, 72, 109)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (161, 43, 110)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (111, 30, 111)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (7002, 5005, 111)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (241, 87, 112)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (242, 87, 113)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (71, 19, 114)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (147, 40, 114)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (72, 19, 115)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (139, 38, 115)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (73, 19, 116)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (148, 40, 117)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (127, 34, 118)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (149, 40, 118)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (150, 40, 119)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (151, 40, 120)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (140, 38, 121)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (141, 38, 122)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (142, 38, 123)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (134, 37, 124)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (135, 37, 125)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (136, 37, 126)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (137, 37, 127)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (157, 42, 127)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (235, 84, 128)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (60, 16, 129)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (61, 16, 130)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (62, 16, 131)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (204, 67, 132)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (210, 69, 132)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (189, 57, 133)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (227, 75, 133)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (196, 63, 134)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (222, 73, 134)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (145, 39, 135)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (11, 3, 136)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (32, 9, 136)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (108, 28, 136)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (138, 37, 136)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (158, 42, 136)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (259, 124, 136)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (70, 18, 137)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (35, 10, 138)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (79, 20, 138)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (15, 4, 139)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (132, 36, 139)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (128, 34, 140)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (184, 51, 140)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (228, 82, 140)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (7, 2, 141)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (213, 70, 142)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (253, 98, 142)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (83, 21, 143)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (162, 43, 143)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (171, 47, 143)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (180, 50, 143)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (244, 88, 143)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (3057, 12, 144)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (232, 83, 145)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (63, 16, 146)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (21, 7, 147)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (39, 11, 148)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (176, 49, 148)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (220, 72, 148)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (248, 90, 148)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (252, 91, 148)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (143, 38, 149)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (197, 65, 150)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (49, 13, 151)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (258, 114, 151)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (102, 26, 152)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (4, 1, 153)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (119, 33, 153)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (54, 14, 154)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (64, 17, 154)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (254, 102, 154)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (55, 14, 155)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (65, 17, 155)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (255, 102, 155)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (58, 15, 156)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (97, 25, 157)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (116, 31, 158)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (257, 107, 158)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (25, 8, 159)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (74, 19, 160)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (247, 89, 160)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (167, 44, 161)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (87, 23, 162)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (88, 23, 163)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (152, 40, 164)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (236, 84, 165)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (243, 87, 166)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (112, 30, 167)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (193, 61, 168)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (1003, 17, 1021)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (2002, 17, 1022)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (2003, 17, 1023)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (2007, 17, 1025)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (2008, 45, 1025)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (2009, 45, 1026)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (2010, 3, 1027)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (2011, 14, 1027)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (2012, 17, 1027)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (2013, 11, 1028)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (2014, 45, 1028)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (2015, 45, 1029)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (2022, 1003, 1030)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (2023, 1003, 1031)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (2024, 1003, 1032)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (3002, 2003, 1034)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (3004, 2003, 1036)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (3005, 2003, 1037)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (3006, 2003, 1038)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (3007, 2003, 1039)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (3059, 12, 1041)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (3060, 2003, 1041)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (3061, 79, 1042)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (3062, 2003, 1042)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (4005, 2004, 2034)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (4006, 2004, 3034)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (4007, 1, 3036)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (4008, 5, 3036)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (4009, 33, 3036)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (7003, 5005, 4035)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (7004, 5005, 4036)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (7005, 35, 4037)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (7006, 35, 4038)
GO
INSERT [dbo].[MoviePersonJoiningTable] ([ID], [MovieID], [PersonID]) VALUES (7007, 35, 4039)
GO
SET IDENTITY_INSERT [dbo].[MoviePersonJoiningTable] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (1, N'Al Pacino', N'1940-04-25', N'New York City, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (2, N'Frances McDormand', N'1957-06-23', N'Gibson City, Illinois, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (3, N'Woody Harrelson', N'1961-07-23', N'Midland, Texas, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (4, N'Sam Rockwell', N'1968-11-05', N'Daly City, California, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (5, N'Zoltán Latinovits', N'1931-09-09', N'Budapest, Hungary')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (6, N'Emilia Clarke', N'1986-10-23', N'London, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (7, N'Peter Dinklage', N'1969-06-11', N'Morristown, New Jersey, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (8, N'Kit Harington', N'1986-12-26', N'London, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (9, N'Eszter Balla', N'1980-05-11', N'Szekszárd, Hungary')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (10, N'Brad Pitt', N'1963-12-18', N'Shawnee, Oklahoma, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (11, N'Christoph Waltz', N'1956-10-04', N'Vienna, Austria')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (12, N'Diane Kruger', N'1976-07-15', N'Algermissen, Lower Saxony, Germany')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (13, N'Mélanie Laurent', N'1983-02-21', N'Paris, France')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (14, N'John Travolta', N'1954-02-18', N'Englewood, New Jersey, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (15, N'Uma Thurman', N'1970-04-29', N'Boston, Massachusetts, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (16, N'Samuel L. Jackson', N'1948-12-21', N'Washington D.C., USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (17, N'Bruce Willis', N'1955-03-19', N'Idar-Oberstein, Germany')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (18, N'Tim Roth', N'1961-05-14', N'London, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (19, N'Robin Williams', N'1951-06-21', N'Chicago, Illinois, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (20, N'Matt Damon', N'1970-10-08', N'Boston, Massachusetts, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (21, N'Ben Affleck', N'1972-08-15', N'Berkeley, California, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (22, N'Stellan Skarsgård', N'1951-06-13', N'Gothenburg, Sweden')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (23, N'Tim Robbins', N'1958-10-16', N'West Covina, California, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (24, N'Morgan Freeman', N'1937-06-01', N'Memphis, Tennessee, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (25, N'Liam Neeson', N'1952-06-07', N'Ballymena, Northern Ireland, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (26, N'Ralph Fiennes', N'1962-12-22', N'Ipswich, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (27, N'Ben Kingsley', N'1943-12-31', N'Scarborough, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (28, N'Adrien Brody', N'1973-04-14', N'New York City, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (29, N'Willem Dafoe', N'1955-07-22', N'Appleton, Wisconsin, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (30, N'Jeff Goldblum', N'1952-10-22', N'Pitssburgh, Pennsylvania, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (31, N'Edward Norton', N'1969-08-08', N'Boston, Massachusetts, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (32, N'Saoirse Ronan', N'1994-04-12', N'New York City, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (33, N'Jessie Buckley', N'1989-12-28', N'Killarney, Ireland')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (34, N'Jared Harris', N'1961-08-24', N'London, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (35, N'Jodie Foster', N'1962-11-19', N'Los Angeles, California, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (36, N'Anthony Hopkins', N'1937-12-31', N'Margam, Wales, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (37, N'Jack Nicholson', N'1937-04-22', N'Neptune, New Jersey, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (38, N'Danny DeVito', N'1944-11-17', N'Asbury Park, New Jersey, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (39, N'Woody Allen', N'1935-12-01', N'New York City, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (40, N'Diane Keaton', N'1946-01-05', N'Los Angeles, California, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (41, N'Simon Pegg', N'1970-02-14', N'Gloucester, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (42, N'Nick Frost', N'1972-03-28', N'Hornchurch, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (43, N'Kevin Spacey', N'1959-07-26', N'South Orange, New Jersey, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (44, N'Daniel Craig', N'1958-03-02', N'Chester, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (45, N'Chris Evans', N'1981-06-13', N'Boston, Massachusetts, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (46, N'Ana de Armas', N'1988-04-30', N'Havana, Cuba')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (47, N'Ewan McGregor', N'1971-03-31', N'Perth, Scotland, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (48, N'Tom Hanks', N'1956-07-09', N'Concord, California, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (49, N'Leonardo DiCaprio', N'1974-11-11', N'Los Angeles, California, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (50, N'Mark Wahlberg', N'1971-06-05', N'Boston, Massachusetts, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (51, N'Mark Ruffalo', N'1967-11-22', N'Kenosha, Wisconsin, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (52, N'Ansel Elgort', N'1994-03-14', N'New York City, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (53, N'Timothée Chalamet', N'1995-02-27', N'New York City, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (54, N'Zendaya', N'1996-09-01', N'Oakland, California, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (55, N'Oscar Isaac', N'1979-03-09', N'Guatemala City, Guatemala')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (56, N'Jason Momoa', N'1979-08-01', N'Honolulu, Hawaii, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (57, N'Harvey Keitel', N'1939-05-13', N'New York City, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (59, N'Christian Bale', N'1974-01-30', N'Haverfordwest, Wales, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (60, N'Reese Witherspoon', N'1976-03-22', N'New Orleans, Louisiana, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (61, N'Jared Leto', N'1971-12-26', N'Bossier City, Louisiana, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (62, N'Mads Mikkelsen', N'1965-11-22', N'Copenhagen, Denmark')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (63, N'Thomas Bo Larsen', N'1963-11-27', N'Gladsaxe, Denmark')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (64, N'William H. Macy', N'1950-03-13', N'Miami, Florida, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (65, N'Peter Stormare', N'1953-08-27', N'Kumla, Sweden')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (66, N'Tom Cruise', N'1962-07-03', N'Syracuse, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (67, N'Renée Zellweger', N'1969-04-25', N'Katy, Texas, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (68, N'Imre Sinkovits', N'1928-11-22', N'Budapest, Hungary')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (69, N'Jamie Foxx', N'1967-12-13', N'Terrell, Texas, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (70, N'Kerry Washington', N'1977-01-30', N'New York City, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (71, N'Martin Freeman', N'1971-09-08', N'Aldershot, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (72, N'Joseph Gordon-Levitt', N'1981-02-17', N'Los Angeles, California, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (73, N'Elliot Page', N'1987-02-21', N'Halifax, Nova Scotia, Canada')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (74, N'Ken Watanabe', N'1959-08-21', N'Uonuma, Japan')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (75, N'Tom Hardy', N'1977-09-15', N'Hammersmith, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (76, N'Jason Statham', N'1967-07-26', N'Shirebrook, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (77, N'Stephen Graham', N'1973-08-03', N'Liverpool, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (78, N'Jean Reno', N'1948-07-30', N'Casablanca, Morocco')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (79, N'Gary Oldman', N'1958-03-21', N'London, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (80, N'Natalie Portman', N'1981-06-09', N'Jerusalem, Israel')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (81, N'Magnus Millang', N'1981-07-20', N'Copenhagen, Denmark')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (82, N'Colin Farrell', N'1976-05-31', N'Dublin, Ireland')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (83, N'Brendan Gleeson', N'1955-03-29', N'Dublin, Ireland')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (84, N'George Clooney', N'1961-05-06', N'Lexington, Kentucky, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (85, N'Meryl Streep', N'1949-06-22', N'Summit, New Jersey, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (86, N'Ethan Hawke', N'1970-11-06', N'Austin, Texas, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (87, N'Michael Clarke Duncan', N'1957-12-10', N'Chicago, Illinois, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (88, N'David Morse', N'1953-10-11', N'Hamilton, Massachusetts, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (89, N'Sándor Csányi', N'1975-12-19', N'Budapest, Hungary')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (90, N'Zoltán Mucsi', N'1957-09-08', N'Abony, Hungary')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (91, N'Csaba Pindroch', N'1972-03-19', N'Salgótarján, Hungary')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (92, N'Danica Curcic', N'1985-08-27', N'Belgrade, Serbia')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (93, N'David Dencik', N'1974-08-31', N'Stockholm, Sweden')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (94, N'Mikkel Boe Følsgaard', N'1984-05-01', N'Rønne, Denmark')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (95, N'Iben Dorner', N'1978-08-19', N'Holstebro, Denmark')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (96, N'Christopher Walken', N'1943-05-31', N'New York City, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (97, N'Robert De Niro', N'1943-07-17', N'New York City, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (98, N'Ray Liotta', N'1954-12-18', N'Newark, New Jersey, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (99, N'Joe Pesci', N'1943-02-09', N'Newark, New Jersey, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (100, N'Keanu Reeves', N'1964-09-02', N'Beirut, Lebanon')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (101, N'Laurence Fishburne', N'1961-07-30', N'Augusta, Georgia, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (102, N'Carrie-Anne Moss', N'1967-08-21', N'Vancouver, British Columbia, Canada')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (103, N'Marlon Brando', N'1924-04-03', N'Omaha, Nebraska, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (104, N'James Caan', N'1940-03-26', N'New York City, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (105, N'Robert Duvall', N'1931-01-05', N'San Diego, California, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (106, N'John Cazale', N'1935-08-12', N'Boston, Massachusetts, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (107, N'Tamás Major', N'1910-01-26', N'Budapest, Hungary')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (108, N'Iván Darvas', N'1925-06-14', N'Behynce, Slovakia')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (109, N'Cybill Shepherd', N'1950-02-18', N'Memphis, Tennessee, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (110, N'Kate Ashfield', N'1972-05-28', N'Oldham, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (111, N'Jon Bernthal', N'1976-09-20', N'Washington D.C., USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (112, N'Dustin Hoffman', N'1937-08-08', N'Los Angeles, California, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (113, N'Valeria Golino', N'1965-10-22', N'Naples, Italy')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (114, N'Jim Carrey', N'1962-01-17', N'Newmarket, Ontario, Canada')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (115, N'Ed Harris', N'1951-11-28', N'Tenafly, New Jersey, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (116, N'Laura Linney', N'1964-02-05', N'New York City, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (117, N'Kate Winslet', N'1975-10-05', N'Reading, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (118, N'Tom Wilkinson', N'1948-02-05', N'Leeds, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (119, N'Elijah Wood', N'1981-01-28', N'Cedar Rapids, Iowa, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (120, N'Kirsten Dunst', N'1982-04-30', N'Poin Pleasant, New Jersey, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (121, N'Russell Crowe', N'1964-04-07', N'Wellington, New Zealand')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (122, N'Jennifer Connelly', N'1970-12-12', N'Catskill Mountains, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (123, N'Christopher Plummer', N'1929-12-13', N'Toronto, Ontario, Canada')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (124, N'David Carradine', N'1936-12-08', N'Los Angeles, California, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (125, N'Daryl Hannah', N'1960-12-03', N'Chicago, Illinois, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (126, N'Lucy Liu', N'1968-12-02', N'New York City, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (127, N'Julie Dreyfus', N'1966-01-24', N'Paris, France')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (128, N'Anne Hathaway', N'1982-11-12', N'New York City, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (129, N'Ewen Bremner', N'1972-01-23', N'Edinburgh, Scotland, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (130, N'Jonny Lee Miller', N'1972-11-15', N'Kingston upon Thames, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (131, N'Kevin McKidd', N'1973-08-09', N'Elgin, Scotland, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (132, N'Francis Ford Coppola', N'1939-04-07', N'Detroit, Michigan, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (133, N'Martin McDonagh', N'1970-05-26', N'London, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (134, N'Zoltán Fábri', N'1917-08-15', N'Budapest, Hungary')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (135, N'Ferenc Török', N'1971-04-23', N'Budapest, Hungary')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (136, N'Quentin Tarantino', N'1963-05-27', N'Knoxville, Tennessee, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (137, N'Gus Van Sant', N'1952-07-24', N'Louisville, Kentucky, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (138, N'Frank Darabont', N'1959-01-28', N'Montbéliard, France')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (139, N'Steven Spielberg', N'1946-12-18', N'Cincinnati, Ohio, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (140, N'Wes Anderson', N'1969-05-01', N'Houston, Texas, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (141, N'Jonathan Demme', N'1944-02-22', N'Baldwin, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (142, N'Milos Forman', N'1932-02-18', N'Cáslav, Czech Republic')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (143, N'Edgar Wright', N'1974-04-18', N'Poole, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (144, N'David Fincher', N'1962-08-28', N'Denver, Colorado, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (145, N'Rian Johnson', N'1973-12-17', N'Silver Spring, Maryland, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (146, N'Danny Boyle', N'1956-10-20', N'Radcliffe, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (147, N'Robert Zemeckis', N'1951-05-14', N'Chicago, Illinois, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (148, N'Martin Scorsese', N'1942-11-17', N'New York City, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (149, N'Ron Howard', N'1954-03-01', N'Duncan, Oklahoma, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (150, N'Péter Bacsó', N'1928-01-06', N'Kosice, Slovakia')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (151, N'Denis Villeneuve', N'1967-10-03', N'Trois-Rivières, Québec, Canada')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (152, N'Mary Harron', N'1953-01-12', N'Bracebridge, Ontario, Canada')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (153, N'Thomas Vinterberg', N'1969-05-19', N'Copenhagen, Denmark')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (154, N'Joel Coen', N'1954-11-29', N'Minneapolis, Minnesota, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (155, N'Ethan Coen', N'1957-09-21', N'Minneapolis, Minnesota, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (156, N'Cameron Crowe', N'1957-07-13', N'Palm Springs, California, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (157, N'Christopher Nolan', N'1970-07-30', N'London, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (158, N'Guy Ritchie', N'1968-09-10', N'Hatfield, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (159, N'Luc Besson', N'1959-03-18', N'Paris, France')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (160, N'Peter Weir', N'1944-08-21', N'Sydney, New South Wales, Australia')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (161, N'Nimród Antal', N'1973-11-30', N'Los Angeles, California, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (162, N'Lana Wachowski', N'1965-06-21', N'Chicago, Illinois, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (163, N'Lilly Wachowski', N'1967-12-29', N'Chicago, Illinois, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (164, N'Michel Gondry', N'1963-05-08', N'Versailles, France')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (165, N'Todd Haynes', N'1961-01-02', N'Los Angeles, California, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (166, N'Barry Levinson', N'1942-04-06', N'Baltimore, Maryland, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (167, N'James Mangold', N'1963-12-16', N'New York City, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (168, N'Márton Keleti', N'1905-04-27', N'Budapest, Hungary')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (1021, N'Jeff Bridges', N'1949-12-04', N'Los Angeles, California, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (1022, N'John Goodman', N'1952-06-20', N'Affton, Missouri, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (1023, N'Julianne Moore', N'1960-12-03', N'Fayetteville, North Carolina, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (1025, N'Philip Seymour Hoffman', N'1967-07-23', N'Fairport, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (1026, N'Samantha Morton', N'1977-05-13', N'Nottingham, England, UK')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (1027, N'Steve Buscemi', N'1957-12-13', N'New York City, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (1028, N'Michelle Williams', N'1980-09-09', N'Kalispell, Montana, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (1029, N'Catherine Keener', N'1959-03-23', N'Miami, Florida, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (1030, N'Joaquin Phoenix', N'1974-10-28', N'San Juan, Puerto Rico')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (1031, N'Zazie Beetz', N'1991-06-01', N'Berlin, Germany')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (1032, N'Frances Conroy', N'1953-03-15', N'Monroe, Georgia, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (1034, N'Matthew Modine', N'1959-03-22', N'Loma Linda, California, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (1036, N'Vincent D''Onofrio', N'1959-06-30', N'New York City, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (1037, N'Adam Baldwin', N'1962-02-27', N'Winnetka, Illinois, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (1038, N'Dorian Harewood', N'1950-08-06', N'Dayton, Ohio, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (1039, N'Arliss Howard', N'1954-10-18', N'Independence, Missouri, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (1041, N'R. Lee Ermey', N'1944-03-24', N'Emporia, Kansas, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (1042, N'Stanley Kubrick', N'1928-07-26', N'New York City, New York, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (2034, N'Bernie Mac', N'1957-10-05', N'Chicago, Illinois, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (3034, N'Julia Roberts', N'1967-10-28', N'Smyrna, Georgia, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (3036, N'Lars Ranthe', N'1969-08-26', N'Copenhagen, Denmark')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (4035, N'Will Smith', N'1968-09-25', N'Philadelphia, Pennsylvania, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (4036, N'Aunjanue Ellis', N'1969-02-21', N'San Francisco, California, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (4037, N'Miles Teller', N'1987-02-20', N'Downingtown, Pennsylvania, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (4038, N'Melissa Benoist', N'1988-10-04', N'Littleton, Colorado, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (4039, N'J.K. Simmons', N'1955-01-09', N'Grosse Pointe, Michigan, USA')
GO
INSERT [dbo].[Person] ([ID], [FullName], [Birthdate], [Birthplace]) VALUES (7035, N'Teszt Faszi', N'2022-06-06', N'Ózd, Hungary')
GO
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
ALTER TABLE [dbo].[MoviePersonJoiningTable]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([ID])
GO
ALTER TABLE [dbo].[MoviePersonJoiningTable]  WITH CHECK ADD FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([ID])
GO
