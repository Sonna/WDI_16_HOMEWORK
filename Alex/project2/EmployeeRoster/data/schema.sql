CREATE DATABASE employeeroster;

CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  email VARCHAR(300) NOT NULL,
  password_digest VARCHAR(400) NOT NULL
);

CREATE TABLE employees (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(300) NOT NULL
  -- organisation_id INTEGER
);

CREATE TABLE timeframes (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(300) NOT NULL
);

INSERT INTO timeframes (name) VALUES ("morning");
INSERT INTO timeframes (name) VALUES ("evening");
INSERT INTO timeframes (name) VALUES ("night");

CREATE TABLE rosters (
  id SERIAL4 PRIMARY KEY,
  month DATE
);

-- CREATE TABLE roster_timeframes (
--   id SERIAL4 PRIMARY KEY,
--   roster_id INTEGER,
--   timeframe_id INTEGER
-- );

CREATE TABLE shifts (
  id SERIAL4 PRIMARY KEY,
  employee_id INTEGER,
  roster_id INTEGER,
  timeframe_id INTEGER
);
