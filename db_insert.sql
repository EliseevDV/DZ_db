-- Заполнение таблицы жанров
INSERT INTO Genres (name) VALUES
('Rock'),
('Pop'),
('Hip-Hop'),
('Electronic'),
('Jazz');

-- Заполнение таблицы исполнителей
INSERT INTO Artists (name) VALUES
('The Beatles'),
('Michael Jackson'),
('Madonna'),
('Eminem'),
('Lady Gaga'),
('Kanye West'),
('Daft Punk'),
('Coldplay');

-- Заполнение таблицы альбомов
INSERT INTO Albums (title, year) VALUES
('Abbey Road', 1969),
('Thriller', 1982),
('Like a Virgin', 1984),
('The Marshall Mathers LP', 2000),
('The Fame', 2008),
('My Beautiful Dark Twisted Fantasy', 2010),
('Random Access Memories', 2013),
('Ghost Stories', 2014);

-- Заполнение таблицы треков
INSERT INTO Tracks (title, duration) VALUES
('Come Together', 259),
('Billie Jean', 293),
('Like a Virgin', 225),
('The Real Slim Shady', 284),
('Poker Face', 229),
('Runaway', 344),
('Get Lucky', 369),
('Magic', 277),
('Hey Jude', 431),
('Beat It', 258),
('Material Girl', 227),
('Stan', 346),
('Bad Romance', 294),
('Power', 287),
('Instant Crush', 337);

-- Заполнение таблицы связи альбомов и исполнителей
INSERT INTO AlbumArtists (album_id, artist_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

-- Заполнение таблицы связи исполнителей и жанров
INSERT INTO ArtistGenres (artist_id, genre_id) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 3),
(5, 2),
(6, 1),
(7, 4),
(8, 1);

-- Заполнение таблицы сборников
INSERT INTO Compilations (title, year) VALUES
('Best of The Beatles', 2018),
('Greatest Hits', 2020),
('Electronic Anthems', 2019),
('Hip-Hop Classics', 2018),
('Jazz Essentials', 2020);

-- Заполнение таблицы связи сборников и треков
INSERT INTO CompilationTracks (compilation_id, track_id) VALUES
(1, 1),
(1, 8),
(2, 2),
(2, 4),
(2, 6),
(3, 7),
(3, 8),
(3, 14),
(4, 4),
(4, 5),
(4, 12),
(5, 9),
(5, 13),
(5, 15);