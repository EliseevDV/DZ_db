--Название и год выхода альбомов, вышедших в 2014 году.
SELECT title, year
 FROM albums where year = 2014;
--Название и продолжительность самого длительного трека
SELECT title, duration
FROM Tracks
WHERE duration = (SELECT MAX(duration) FROM Tracks);
--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT title
FROM Compilations
WHERE year BETWEEN 2018 AND 2020;
--Название треков, продолжительность которых не менее 3,5 минут.
SELECT title
FROM Tracks
WHERE duration >= 210;
--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT title
FROM Compilations
WHERE year BETWEEN 2018 AND 2020;
--Исполнители, чьё имя состоит из одного слова.
SELECT name
FROM Artists
WHERE name NOT LIKE '% %';
--Название треков, которые содержат слово «мой» или «my».
SELECT title
FROM Tracks
WHERE title LIKE '%мой%' OR title LIKE '%my%';