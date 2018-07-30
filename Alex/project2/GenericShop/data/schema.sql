CREATE DATABASE genericshop;

CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  email VARCHAR(300) NOT NULL,
  password_digest VARCHAR(400) NOT NULL
);

CREATE TABLE products (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(300) NOT NULL,
  cost DECIMAL NOT NULL DEFAULT 0
  -- cost INTEGER -- If in Cents
);

CREATE TABLE baskets (
  id SERIAL4 PRIMARY KEY,
  user_id INTEGER
);

CREATE TABLE basket_line_items (
  id SERIAL4 PRIMARY KEY,
  basket_id INTEGER,
  product_id INTEGER,
  quantity INTEGER
);

CREATE TABLE orders (
  id SERIAL4 PRIMARY KEY,
  user_id INTEGER,
  -- basket_id INTEGER,
  total DECIMAL
);

CREATE TABLE order_line_items (
  id SERIAL4 PRIMARY KEY,
  order_id INTEGER,
  product_id INTEGER,
  name VARCHAR(300) NOT NULL,
  cost DECIMAL NOT NULL,
  quantity INTEGER
);
