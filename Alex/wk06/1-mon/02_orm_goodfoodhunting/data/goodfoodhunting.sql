-- Schema
CREATE DATABASE goodfoodhunting;

CREATE TABLE dishes (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(100),
  image_url VARCHAR(400)
);

INSERT INTO dishes (name, image_url) values ('birthday cake', 'https://www.stayathomemum.com.au/cache/860x380-0/wp-content/uploads/2015/04/bigstock-Delicious-birthday-cake-on-tab-78718583.jpg');
INSERT INTO dishes (name, image_url) values ('pudding', 'https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2016/10/cherry-chocolate-pudding.jpg?itok=dNPboDsi');
INSERT INTO dishes (name, image_url) values ('sandwich', 'http://www.chingssecret.com/assets/uploads/images/chings-secret-schezwan-chutney-sandwitch%2003.jpg');

CREATE TABLE comments (
  id SERIAL4 PRIMARY KEY,
  content TEXT NOT NULL,
  dish_id INTEGER NOT NULL,
  FOREIGN KEY (dish_id) REFERENCES dishes(id) ON DELETE RESTRICT
);

INSERT INTO comments (content, dish_id) values ('yum', 2);
INSERT INTO comments (content, dish_id) values ('first', 2);
INSERT INTO comments (content, dish_id) values ('yay', 2);

CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  email VARCHAR(300) NOT NULL,
  password_digest VARCHAR(400)
);

ALTER TABLE dishes ADD COLUMN user_id INTEGER;

-- SELECT id, name, user_id FROM dishes;
--  id |                name                | user_id
-- ----+------------------------------------+---------
--   3 | sandwich                           |
--   4 | macaroon                           |
--   5 | pancakes                           |
--   2 | can't believe it's pudding pudding |
--   7 | milk tea                           |
--   8 | meaty burger                       |
-- (6 rows)

-- SELECT id, email FROM users;
--  id |    email
-- ----+-------------
--   1 | dt@ga.co
--   2 | a@gmail.com
-- (2 rows)

UPDATE dishes SET user_id = 1;
-- UPDATE 6

-- SELECT id, name, user_id FROM dishes;
--  id |                name                | user_id
-- ----+------------------------------------+---------
--   3 | sandwich                           |       1
--   4 | macaroon                           |       1
--   5 | pancakes                           |       1
--   2 | can't believe it's pudding pudding |       1
--   7 | milk tea                           |       1
--   8 | meaty burger                       |       1
-- (6 rows)

ALTER TABLE comments ADD COLUMN user_id INTEGER;
-- ALTER TABLE
UPDATE comments SET user_id = 1;
-- UPDATE 2

CREATE TABLE likes (
  id SERIAL4 PRIMARY KEY,
  user_id INTEGER,
  dish_id INTEGER
);

-- CREATE TABLE likes (
--   id SERIAL4 PRIMARY KEY,
--   user_id INTEGER NOT NULL,
--   dish_id INTEGER NOT NULL,
--   FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE RESTRICT,
--   FOREIGN KEY (dish_id) REFERENCES dishes(id) ON DELETE RESTRICT
-- );
