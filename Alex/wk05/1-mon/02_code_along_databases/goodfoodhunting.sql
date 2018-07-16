-- Schema
CREATE DATABASE goodfoodhunting;

CREATE TABLE dishes (
  -- id INT NOT NULL,
  -- PRIMARY KEY(id)
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(100),
  image_url VARCHAR(400)
);

-- `SERIAL` & `SERIAL4` are aliases for an integer column that auto-increments
-- > The type names serial and serial4 are equivalent: both create integer
-- > columns
-- > -- https://www.postgresql.org/docs/9.5/static/datatype-numeric.html#DATATYPE-SERIAL

-- `PRIMARY KEY`

INSERT INTO dishes (name, image_url) values ('birthday cake', 'https://www.stayathomemum.com.au/cache/860x380-0/wp-content/uploads/2015/04/bigstock-Delicious-birthday-cake-on-tab-78718583.jpg');
INSERT INTO dishes (name, image_url) values ('pudding', 'https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2016/10/cherry-chocolate-pudding.jpg?itok=dNPboDsi');
INSERT INTO dishes (name, image_url) values ('sandwich', 'http://www.chingssecret.com/assets/uploads/images/chings-secret-schezwan-chutney-sandwitch%2003.jpg');
-- INSERT INTO dishes (name, image_url) values ('slime', 'https://vignette.wikia.nocookie.net/dragonquest/images/e/ef/SMMDQSSD_-_Rocket.png/revision/latest?cb=20150111223913');
