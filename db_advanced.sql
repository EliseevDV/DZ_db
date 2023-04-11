-- Количество исполнителей в каждом жанре.
SELECT Genres.name, COUNT(DISTINCT Artists.id) AS "Количество исполнителей"
FROM Genres
JOIN ArtistGenres ON Genres.id = ArtistGenres.genre_id
JOIN Artists ON ArtistGenres.artist_id = Artists.id
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
WHERE Artists.id NOT IN (
    SELECT DISTINCT AlbumArtists.artist_id
    FROM AlbumArtists
    JOIN Albums ON AlbumArtists.album_id = Albums.id
    WHERE Albums.year = 2020
);


-- Названия сборников, в которых присутствует конкретный исполнитель.
SELECT DISTINCT Compilations.title
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
GROUP BY Albums.id
HAVING COUNT(DISTINCT ArtistGenres.genre_id) > 1;


-- Наименования треков, которые не входят в сборники.
SELECT Tracks.title
FROM Tracks
LEFT JOIN CompilationTracks ON CompilationTracks.track_id = Tracks.id
WHERE CompilationTracks.id IS NULL;


-- Названия альбомов, содержащих наименьшее количество треков.
SELECT Albums.title
FROM Albums
JOIN Tracks ON Albums.id = Tracks.album_id
GROUP BY Albums.id
HAVING COUNT(Tracks.id) = (
    SELECT COUNT(Tracks.id)
    FROM Tracks
    GROUP BY album_id
    ORDER BY COUNT(Tracks.id)
    LIMIT 1
);

