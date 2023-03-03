CREATE TABLE Genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE Artists (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE Albums (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  year INTEGER NOT NULL
);

CREATE TABLE Tracks (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  duration INTEGER NOT NULL,
  album_id INTEGER REFERENCES Albums(id)
);

CREATE TABLE AlbumArtists (
  album_id INTEGER REFERENCES Albums(id),
  artist_id INTEGER REFERENCES Artists(id),
  PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE ArtistGenres (
  artist_id INTEGER REFERENCES Artists(id),
  genre_id INTEGER REFERENCES Genres(id),
  PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE Compilations (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  year INTEGER NOT NULL
);

CREATE TABLE CompilationTracks (
  compilation_id INTEGER REFERENCES Compilations(id),
  track_id INTEGER REFERENCES Tracks(id),
  PRIMARY KEY (compilation_id, track_id)
);
