CREATE DATABASE goodfoodhunting;

CREATE TABLE food (
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
