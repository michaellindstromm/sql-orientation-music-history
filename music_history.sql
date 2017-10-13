/* 1. Query all of the entries in the Genre table */
select * from Genre;

/* 2. Using the INSERT statement, add one of your favorite artists to the Artist table. */
insert into Artist values (null, "Michael Lindstrom", 1994);

/* 3. Using the INSERT statement, add one, or more, albums by your artist to the Album table.*/
insert into Album 
			select null,
							"Life",
							'01/29/1994',
							SUBSTR(ABS(RANDOM())||'', 0, 5),
							'Def Jam',
							a.ArtistId,
							g.GenreId
			from Artist a, Genre g where a.ArtistName = 'Michael Lindstrom' and g.Label = 'Latin';
			
/*  4. Using the INSERT statement, add some songs that are on that album to the Song table. */
insert into Song
			select null, 
					"My Life", 
					263, 
					'01/29/1994', 
					g.GenreId,
					a.ArtistId,
					al.AlbumId
			from Artist a, Genre g, Album al
			where a.ArtistName = "Michael Lindstrom" and g.Label = "Latin" and al.Title = "Life";

insert into Song
			select null, 
					"Fun Fun Fun", 
					193, 
					'01/29/1994', 
					g.GenreId,
					a.ArtistId,
					al.AlbumId
			from Artist a, Genre g, Album al
			where a.ArtistName = "Michael Lindstrom" and g.Label = "Latin" and al.Title = "Life";
			
/* 5. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. 
Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.*/
select al.Title 'Album Title', s.Title 'Song Title', a.ArtistName 'Artist'
from Song s left join Album al left join Artist a
on s.AlbumId = al.AlbumId
where s.ArtistId = 29 and a.ArtistId = al.ArtistId;  


/* 6. Write a SELECT statement to display how many songs exist for each album. 
You'll need to use the COUNT() function and the GROUP BY keyword sequence. */
select al.Title 'Album Title', count(*) 'Count'
from Album al, Song s
where al.AlbumId = s.AlbumId
group by al.Title;

/* 7. Write a SELECT statement to display how many songs exist for each artist. 
You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/
select a.ArtistName 'Album Title', count(*) 'Count'
from Artist a, Song s
where a.ArtistId = s.ArtistId
group by a.ArtistName;

/* 8. Write a SELECT statement to display how many songs exist for each genre.
 You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/
select g.Label 'Genre', count(*) 'Count'
from Genre g, Song s
where g.GenreId = s.GenreId
group by g.Label;

/* 9. Using MAX() function, write a select statement to find the album with the longest duration. 
The result should display the album title and the duration.*/
select al.Title 'Album Title', max(al.AlbumLength) 'Album Length'
from Album al;

/* 10. Using MAX() function, write a select statement to find the song with the longest duration. 
The result should display the song title and the duration.*/
select s.Title 'Song Title', max(s.SongLength) 'Song Length'
from Song s;

/* 11. Modify the previous query to also display the title of the album.*/
select s.Title 'Song Title', max(s.SongLength) 'Song Length', al.Title
from Song s, Album al
where s.AlbumId = al.AlbumId;