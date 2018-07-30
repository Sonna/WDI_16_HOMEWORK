CREATE DATABASE lookingforgroup;

CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  email VARCHAR(300) NOT NULL,
  password_digest VARCHAR(400) NOT NULL
);

CREATE TABLE races (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(120),
  speed INTEGER
);

CREATE TABLE classes (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(120),
  hitdie INTEGER
);

CREATE TABLE characters (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(300),
  artwork_url VARCHAR(300),
  hitpoints INTEGER,
  race_id INTEGER,
  class_id INTEGER,
  user_id INTEGER
);

-- CREATE TABLE attributes (
CREATE TABLE stats (
  id SERIAL4 PRIMARY KEY,
  character_id INTEGER,
  strength INTEGER,
  dexterity INTEGER,
  constitution INTEGER,
  intelligence INTEGER,
  wisdom INTEGER,
  charisma INTEGER
);

CREATE TABLE party (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(300)
);

CREATE TABLE party_members (
  id SERIAL4 PRIMARY KEY,
  party_id INTEGER,
  character_id INTEGER
  joined_at DATE
);

CREATE TABLE weapons (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(120),
  type VARCHAR(2),
  range VARCHAR(45),
  damage INTEGER,
  critical INTEGER
);

-- CREATE TABLE equipment (
CREATE TABLE character_weapons (
  id SERIAL4 PRIMARY KEY,
  character_id INTEGER,
  weapon_id INTEGER,
  name VARCHAR(120),
  type VARCHAR(2),
  range VARCHAR(45),
  damage INTEGER,
  critical INTEGER
)

CREATE TABLE skills (
  id SERIAL4 PRIMARY KEY,
  character_id INTEGER,
  acrobatics INTEGER,
  appraise INTEGER,
  bluff INTEGER,
  climb INTEGER,
  -- craft INTEGER,
  diplomacy INTEGER,
  disable_device INTEGER,
  disguise INTEGER,
  escape_artist INTEGER,
  fly INTEGER,
  handle_animal INTEGER,
  heal INTEGER,
  intimidate INTEGER,
  knowledge_arcana INTEGER,
  knowledge_dungeoneering INTEGER,
  knowledge_engineering INTEGER,
  knowledge_geography INTEGER,
  knowledge_history INTEGER,
  knowledge_local INTEGER,
  knowledge_nature INTEGER,
  knowledge_nobility INTEGER,
  knowledge_plane INTEGER,
  knowledge_religion INTEGER,
  linguistics INTEGER,
  perception INTEGER,
  -- perform INTEGER,
  -- profession INTEGER,
  ride INTEGER,
  sense_motive INTEGER,
  slieght_of_hand INTEGER,
  spellcraft INTEGER,
  stealth INTEGER,
  survival INTEGER,
  swim INTEGER,
  use_magic_device INTEGER
);
