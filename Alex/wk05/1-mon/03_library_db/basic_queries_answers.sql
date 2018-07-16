-- ---
-- source:
-- - title: basic_queries.sql
--   url: https://gist.github.com/epoch/276a9244217ca03c34542ce2c1f1096b#file-basic_queries-sql
-- ---

-- BASIC QUERIES
-- Unless otherwise stated, all queries should return all columns

-- Get all information about all authors
select * from authors;

--  1 | Cao Xueqin         | China                    |       1715
--  2 | J.K. Rowling       | United Kingdom           |       1965
--  3 | James Baldwin      | United States of America |       1924
--  4 | Jorge Luis Borges  | Argentina                |       1899
--  5 | Haruki Murakami    | Japan                    |       1949
--  6 | Milan Kundera      | Czechoslovakia           |       1929
--  7 | Albert Camus       | France                   |       1913
--  8 | George R.R. Martin | United States of America |       1945

-- Get just the name and birth year of all authors
select name, birth_year from authors;

-- Get all authors born in the 20th centruy or later
select * from authors where birth_year > 2000;

-- Get all authors born in the USA
select * from authors where nationality = 'USA';

-- Get all books published on 1985
select * from books where publication_date = 1985;

-- Get all books published before 1989
select * from books where publication_date < 1989;

-- Get just the title of all books.
select title from books;

-- Get just the year that 'A Dance with Dragons' was published
select publication_date from books where title = 'A Dance with Dragons';
  -- Cry when you realize how long it's been
  -- :'(

-- Get all books which have `the` somewhere in their title (hint, look up LIKE/ILIKE)
select publication_date from books where title ilike '%the%';

-- Add yourself as an author
insert into authors(name,nationality,birth_year) values('Alex','AUS',1991);

-- Add two books that you'd like to write (you can hard-code your id as the author id)
insert into books(title,publication_date,author_id) values('How to SQL',2018,9);
insert into books(title,publication_date,author_id) values('Drop Life',2090,9);

-- Update one of your books to have a new title
update books set title = 'Update Life' where title = 'Drop Life';

-- Delete your books
delete from books where title = 'Update Life';
delete from books where title = 'How to SQL';

-- Delete your author entry
delete from authors where id = 9;
