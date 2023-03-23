-- Количество исполнителей в каждом жанре.
SELECT Genres.name, COUNT(ArtistGenres.artist_id) AS "Количество исполнителей"
FROM Genres
LEFT JOIN ArtistGenres ON Genres.id = ArtistGenres.genre_id
GROUP BY Genres.name;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(Tracks.id) AS "Количество треков"
FROM Tracks
JOIN Albums ON Tracks.album_id = Albums.id
WHERE Albums.year BETWEEN 2019 AND 2020;
-- Средняя продолжительность треков по каждому альбому.
SELECT Albums.title, AVG(Tracks.duration) AS "Средняя продолжительность треков"
FROM Albums
JOIN Tracks ON Albums.id = Tracks.album_id
GROUP BY Albums.title;

-- Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT Artists.name
FROM Artists
LEFT JOIN AlbumArtists ON Artists.id = AlbumArtists.artist_id
LEFT JOIN Albums ON AlbumArtists.album_id = Albums.id
WHERE Albums.year <> 2020 OR Albums.year IS NULL;

-- Названия сборников, в которых присутствует конкретный исполнитель.
SELECT Compilations.title
FROM Compilations
JOIN CompilationTracks ON Compilations.id = CompilationTracks.compilation_id
JOIN Tracks ON CompilationTracks.track_id = Tracks.id
JOIN AlbumArtists ON Tracks.album_id = AlbumArtists.album_id
JOIN Artists ON AlbumArtists.artist_id = Artists.id
WHERE Artists.name = 'Michael Jackson';


-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT Albums.title
FROM Albums
JOIN AlbumArtists ON Albums.id = AlbumArtists.album_id
JOIN Artists ON AlbumArtists.artist_id = Artists.id
JOIN ArtistGenres ON Artists.id = ArtistGenres.artist_id
GROUP BY Albums.title
HAVING COUNT(DISTINCT ArtistGenres.genre_id) > 1;

-- Наименования треков, которые не входят в сборники.
SELECT Artists.name
FROM Artists
JOIN AlbumArtists ON Artists.id = AlbumArtists.artist_id
JOIN Tracks ON AlbumArtists.album_id = Tracks.album_id
WHERE Tracks.duration = (SELECT MIN(duration) FROM Tracks);

-- Названия альбомов, содержащих наименьшее количество треков.
SELECT Albums.title
FROM Albums
WHERE Albums.id IN (
  SELECT Albums.id
  FROM Albums
  JOIN Tracks ON Albums.id = Tracks.album_id
  GROUP BY Albums.id
  HAVING COUNT(Tracks.id) = (
    SELECT MIN(tracks_count)
    FROM (
      SELECT COUNT(Tracks.id) AS tracks_count
