CREATE DATABASE moviesdb;

DROP TABLE IF EXISTS movies;
CREATE TABLE movies (
  id SERIAL4 PRIMARY KEY,
  Title VARCHAR(150) NOT NULL,
  Year int,
  Rated VARCHAR(3),
  Released TEXT,
  Runtime VARCHAR(50),
  Genre TEXT,
  Director TEXT,
  Writer TEXT,
  Actors TEXT,
  Plot TEXT,
  Language TEXT,
  Poster TEXT,
  imdbRating TEXT,
  imdbVotes TEXT,
  Production TEXT
);
-- CREATE TABLE movies (
--   id SERIAL4 PRIMARY KEY,
--   title VARCHAR(150) NOT NULL,
--   year int,
--   rated VARCHAR(3),
--   released TEXT,
--   runtime VARCHAR(50),
--   genre TEXT,
--   director TEXT,
--   writer TEXT,
--   actors TEXT,
--   plot TEXT,
--   language TEXT,
--   poster_url TEXT,
--   imdb_rating TEXT,
--   imdb_votes TEXT,
--   production TEXT
-- );
