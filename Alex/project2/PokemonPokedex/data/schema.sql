CREATE DATABASE pokemonpokedex;

CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  email VARCHAR(300) NOT NULL,
  password_digest VARCHAR(400) NOT NULL
);

CREATE TABLE types (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

INSERT INTO types (name) VALUES ("Normal");
INSERT INTO types (name) VALUES ("Fire");
INSERT INTO types (name) VALUES ("Water");
INSERT INTO types (name) VALUES ("Grass");
INSERT INTO types (name) VALUES ("Bug");
INSERT INTO types (name) VALUES ("Electric");
INSERT INTO types (name) VALUES ("Dark");
INSERT INTO types (name) VALUES ("Psychic");
INSERT INTO types (name) VALUES ("Ghost");
INSERT INTO types (name) VALUES ("Fairy");
INSERT INTO types (name) VALUES ("Rock");
INSERT INTO types (name) VALUES ("Ground");
INSERT INTO types (name) VALUES ("Flying");
INSERT INTO types (name) VALUES ("Dragon");
INSERT INTO types (name) VALUES ("Fighting");
INSERT INTO types (name) VALUES ("Ice");
INSERT INTO types (name) VALUES ("Poison");
INSERT INTO types (name) VALUES ("Steel");

CREATE TABLE pokemon (
  id SERIAL4 PRIMARY KEY,
  number INTEGER NOT NULL,
  name VARCHAR(120) NOT NULL,
  image_url VARCHAR(400),
  type1_id INTEGER NOT NULL,
  type2_id INTEGER,
  height VARCHAR(60),
  category VARCHAR(60),
  weight VARCHAR(60),
  abilities VARCHAR(60)
);

CREATE TABLE trainers (
  id SERIAL4 PRIMARY KEY,
);

-- CREATE TABLE trainer_pokemon ();
CREATE TABLE team (
  id SERIAL4 PRIMARY KEY,
  trainer_id INTEGER,
  pokemon_id INTEGER
);

CREATE TABLE gyms (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  leader_id INTEGER
  -- trainer_id INTEGER
);

CREATE TABLE badges (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  pokemon_max_level INTEGER,
  gym_id INTEGER
);

CREATE TABLE earned_badges (
  id SERIAL4 PRIMARY KEY,
  trainer_id INTEGER,
  badge_id INTEGER
);

