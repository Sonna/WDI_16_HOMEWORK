-- ---
-- source:
-- - title: schema.sql
--   url: https://gist.github.com/epoch/276a9244217ca03c34542ce2c1f1096b#file-schema-sql
-- ---

DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;

CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  nationality VARCHAR(255),
  birth_year INTEGER
);

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  publication_date INTEGER,
  author_id INTEGER
);
