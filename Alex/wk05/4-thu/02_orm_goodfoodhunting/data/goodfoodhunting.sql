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

-- CREATE TABLE comments (
--   id SERIAL4 PRIMARY KEY,
--   content TEXT,
--   dish_id INTEGER -- FOREIGN KEY REFERENCES dishes(id)
-- );

-- DROP TABLE IF EXISTS comments;
-- CREATE TABLE comments (
--   id SERIAL4 PRIMARY KEY,
--   content TEXT NOT NULL,
--   dish_id INTEGER REFERENCES dishes(id)
-- );

DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
  id SERIAL4 PRIMARY KEY,
  content TEXT NOT NULL,
  dish_id INTEGER NOT NULL,
  FOREIGN KEY (dish_id) REFERENCES dishes(id) ON DELETE RESTRICT
  -- FOREIGN KEY (dish_id) REFERENCES dishes(id) ON DELETE CASCADE
);

INSERT INTO comments (content, dish_id) values ('yum', 2);
INSERT INTO comments (content, dish_id) values ('first', 2);
INSERT INTO comments (content, dish_id) values ('yay', 2);
