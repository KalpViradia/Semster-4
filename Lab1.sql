--Database Name: Branch_DIV_Rollno (Example: CSE_3A_101 or Bsc_Hons_101)
--Note: Create all the tables under above database with design mode only.
--Table1: Artists (Artist_id (PK), Artist_name)
--Table2: Albums (Album_id(PK), Album_title, Artist_id(FK), Release_year)
--Table3: Songs (Song_id, Song_title, Duration (in minutes), Genre, Album_id(FK))

--Part – A

--1. Retrieve a unique genre of songs.
select distinct genre
from Songs;

--2. Find top 2 albums released before 2010.
select top 2 *
from Albums
where Release_year < 2010;

--3. Insert Data into the Songs Table. (1245, ‘Zaroor’, 2.55, ‘Feel good’, 1005)
insert
into Songs
values(1245, 'Zaroor', 2.55, 'Feel good', 1005);

--4. Change the Genre of the song ‘Zaroor’ to ‘Happy’
update Songs
set Genre = 'Happy'
where Song_title = 'Zaroor';

--5. Delete an Artist ‘Ed Sheeran’
delete
from Artists
where Artist_name = 'Ed Sheeran';

--6. Add a New Column for Rating in Songs Table. [Ratings decimal(3,2)]
alter table Songs
add Rating decimal(3,2); 

--7. Retrieve songs whose title starts with 'S'.
select Song_title
from Songs
where Song_title like 'S%';

--8. Retrieve all songs whose title contains 'Everybody'.
select Song_title
from Songs
where Song_title like '%Everybody%';

--9. Display Artist Name in Uppercase.
select upper(Artist_name)
from Artists;

--10. Find the Square Root of the Duration of a Song ‘Good Luck’
select sqrt(Duration)
from Songs;

--11. Find Current Date.
select getDate();

--12. Find the number of albums for each artist.
select Artists.Artist_name, count(Albums.Album_id)
from Artists join Albums on Artists.Artist_id = Albums.Artist_id
group by Artists.Artist_name;

--13. Retrieve the Album_id which has more than 5 songs in it.
select Albums.Album_id, count(Songs.Song_title)
from Albums join Songs on Albums.Album_id = Songs.Album_id
group by Albums.Album_id
having count(Songs.Song_title) > 5;

--14. Retrieve all songs from the album 'Album1'. (using Subquery)
select Song_title
from Songs
where Album_id in 
					(select Album_id
					from Albums
					where Album_title = 'Album1');

--15. Retrieve all albums name from the artist ‘Aparshakti Khurana’ (using Subquery)
select Album_title
from Albums
where Artist_id in
					(select Artist_id
					from Artists
					where Artist_name = 'Aparshakti Khurana');

--16. Retrieve all the song titles with its album title.
select Songs.Song_title, Albums.Album_title
from Songs join Albums on Songs.Album_id = Albums.Album_id; 

--17. Find all the songs which are released in 2020.
select Songs.Song_title, Albums.Release_year
from Songs join Albums on Songs.Album_id = Albums.Album_id
where Albums.Release_year = 2020;

--18. Create a view called ‘Fav_Songs’ from the songs table having songs with song_id 101-105.
create view Fav_Songs as 
							select *
							from Songs
							where Song_id between 101 and 105;

--19. Update a song name to ‘Jannat’ of song having song_id 101 in Fav_Songs view.
update Fav_Songs
set Song_title = 'Jannat'
where Song_id = 101;

--20. Find all artists who have released an album in 2020.
select Artists.Artist_name
from Artists join Albums on Artists.Artist_id = Albums.Artist_id
where Albums.Release_year = 2020;

--21. Retrieve all songs by Shreya Ghoshal and order them by duration.
select Songs.Song_title, Songs.Duration
from Artists join Albums on Artists.Artist_id = Albums.Artist_id join Songs on Albums.Album_id = Songs.Album_id
where Artists.Artist_name = 'Shreya Ghoshal'
order by Songs.Duration;

--Part – B

--22. Retrieve all song titles by artists who have more than one album.
Select Song_title
from Songs
where Album_id in 
					(Select Album_id
					from Albums
					where Artist_id in 
										(select Artist_id
										from Albums
										group by Artist_id
										having count(Album_title) > 1 ));

--23. Retrieve all albums along with the total number of songs.
Select Albums.Album_title, count(Songs.Song_title)
from Albums join Songs on Albums.Album_id = Songs.Album_id
group by Albums.Album_title;

--24. Retrieve all songs and release year and sort them by release year.
Select Songs.Song_title, Albums.Release_year
from Albums join Songs on Albums.Album_id = Songs.Album_id
order by Albums.Release_year;

--25. Retrieve the total number of songs for each genre, showing genres that have more than 2 songs.
select Genre, count(Song_title)
from Songs
group by Genre
having count(Song_title) > 2;

--26. List all artists who have albums that contain more than 3 songs.
select Artists.Artist_name, Albums.Album_title
from Artists join Albums on Artists.Artist_id = Albums.Artist_id join Songs on Albums.Album_id = Songs.Album_id
group by Artists.Artist_name, Albums.Album_title
having count(Songs.Song_title) > 3;

--Part – C

--27. Retrieve albums that have been released in the same year as 'Album4'
select Album_title
from Albums
where Release_year in
						(Select Release_year
						from Albums
						where Album_title = 'Album4');

--28. Find the longest song in each genre
select Genre, max(Duration)
from Songs
group by Genre;

--29. Retrieve the titles of songs released in albums that contain the word 'Album' in the title.
select Songs.Song_title, Albums.Album_title
from Albums join Songs on Albums.Album_id = Songs.Album_id
where Albums.Album_title like '%Album%';

--30. Retrieve the total duration of songs by each artist where total duration exceeds 15 minutes.
select Artists.Artist_name ,sum(Songs.Duration)
from Artists join Albums on Artists.Artist_id = Albums.Artist_id join Songs on Albums.Album_id = Songs.Album_id
group by Artists.Artist_name
having sum(Duration) > 15;