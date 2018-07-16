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

--  Cao Xueqin         |       1715
--  J.K. Rowling       |       1965
--  James Baldwin      |       1924
--  Jorge Luis Borges  |       1899
--  Haruki Murakami    |       1949
--  Milan Kundera      |       1929
--  Albert Camus       |       1913
--  George R.R. Martin |       1945

-- Get all authors born in the 20th centruy or later
select * from authors where birth_year > 1900;

--   2 | J.K. Rowling       | United Kingdom           |       1965
--   3 | James Baldwin      | United States of America |       1924
--   5 | Haruki Murakami    | Japan                    |       1949
--   6 | Milan Kundera      | Czechoslovakia           |       1929
--   7 | Albert Camus       | France                   |       1913
--   8 | George R.R. Martin | United States of America |       1945

-- Get all authors born in the USA
select * from authors where nationality = 'United States of America';

--   3 | James Baldwin      | United States of America |       1924
--   8 | George R.R. Martin | United States of America |       1945

-- Get all books published on 1985
select * from books where publication_date = 1985;

--  26 | The Evidence of Things Not Seen |             1985 |         3
--  27 | The Price of the Ticket         |             1985 |         3

-- Get all books published before 1989
select * from books where publication_date < 1989;

--   1 | Dream of the Red Chamber                         |             1750 |         1
--  10 | Go Tell It on the Mountain                       |             1953 |         3
--  11 | The Amen Corner                                  |             1954 |         3
--  12 | Notes of a Native Son                            |             1955 |         3
--  13 | Giovannis Room                                   |             1956 |         3
--  14 | Nobody Knows My Name: More Notes of a Native Son |             1961 |         3
--  15 | Another Country                                  |             1962 |         3
--  16 | A Talk to Teachers                               |             1963 |         3
--  17 | The Fire Next Time                               |             1963 |         3
--  18 | Blues for Mister Charlie                         |             1964 |         3
--  19 | Going to Meet the Man                            |             1965 |         3
--  20 | Tell Me How Long the Trains Been Gone            |             1968 |         3
--  21 | No Name in the Street                            |             1972 |         3
--  22 | If Beale Street Could Talk                       |             1974 |         3
--  23 | The Devil Finds Work                             |             1976 |         3
--  24 | Just Above My Head                               |             1979 |         3
--  25 | Jimmys Blues                                     |             1983 |         3
--  26 | The Evidence of Things Not Seen                  |             1985 |         3
--  27 | The Price of the Ticket                          |             1985 |         3
--  30 | Fervor de Buenos Aires                           |             1923 |         4
--  31 | Inquisiciones                                    |             1925 |         4
--  32 | Luna de Enfrente                                 |             1925 |         4
--  33 | El idioma de los argentinos                      |             1928 |         4
--  34 | Cuaderno San Martín                              |             1929 |         4
--  35 | Discusión                                        |             1957 |         4
--  36 | Historia de la eternidad                         |             1936 |         4
--  37 | El jardín de senderos que se bifurcan            |             1941 |         4
--  38 | Seis problemas para don Isidro Parodi            |             1942 |         4
--  39 | Hear the Wind Sing                               |             1987 |         5
--  49 | The Joke                                         |             1967 |         6
--  50 | The Farewell Waltz                               |             1972 |         6
--  51 | Life Is Elsewhere                                |             1973 |         6
--  52 | The Book of Laughter and Forgetting              |             1978 |         6
--  53 | The Unbearable Lightness of Being                |             1984 |         6
--  58 | The Stranger                                     |             1942 |         7
--  59 | The Plague                                       |             1947 |         7
--  60 | The Fall                                         |             1956 |         7
--  61 | A Happy Death                                    |             1971 |         7

-- Get just the title of all books.
select title from books;

--  Dream of the Red Chamber
--  Harry Potter and the Philosophers Stone
--  Harry Potter and the Chamber of Secrets
--  Harry Potter and the Prisoner of Azkaban
--  Harry Potter and the Goblet of Fire
--  Harry Potter and the Order of the Phoenix
--  Harry Potter and the Half-Blood Prince
--  Harry Potter and the Deathly Hallows
--  The Casual Vacancy
--  Go Tell It on the Mountain
--  The Amen Corner
--  Notes of a Native Son
--  Giovannis Room
--  Nobody Knows My Name: More Notes of a Native Son
--  Another Country
--  A Talk to Teachers
--  The Fire Next Time
--  Blues for Mister Charlie
--  Going to Meet the Man
--  Tell Me How Long the Trains Been Gone
--  No Name in the Street
--  If Beale Street Could Talk
--  The Devil Finds Work
--  Just Above My Head
--  Jimmys Blues
--  The Evidence of Things Not Seen
--  The Price of the Ticket
--  The Cross of Redemption: Uncollected Writings
--  Jimmys Blues and Other Poems
--  Fervor de Buenos Aires
--  Inquisiciones
--  Luna de Enfrente
--  El idioma de los argentinos
--  Cuaderno San Martín
--  Discusión
--  Historia de la eternidad
--  El jardín de senderos que se bifurcan
--  Seis problemas para don Isidro Parodi
--  Hear the Wind Sing
--  A Wild Sheep Chase
--  Norwegian Wood
--  Dance Dance Dance
--  South of the Border, West of the Sun
--  The Wind-Up Bird Chronicle
--  Sputnik Sweetheart
--  Kafka on the Shore
--  After Dark
--  1Q84
--  The Joke
--  The Farewell Waltz
--  Life Is Elsewhere
--  The Book of Laughter and Forgetting
--  The Unbearable Lightness of Being
--  Immortality
--  Slowness
--  Identity
--  Ignorance
--  The Stranger
--  The Plague
--  The Fall
--  A Happy Death
--  The First Man
--  A Game of Thrones
--  A Clash of Kings
--  A Storm of Swords
--  A Feast for Crows
--  A Dance with Dragons
--  I Swear the Dragons are Coming Soon

-- Get just the year that 'A Dance with Dragons' was published
select publication_date from books where title = 'A Dance with Dragons';

--              2011

  -- Cry when you realize how long it's been
  -- :'(

-- Get all books which have `the` somewhere in their title (hint, look up LIKE/ILIKE)
select title from books where title ilike '%the%';

--  Dream of the Red Chamber
--  Harry Potter and the Philosophers Stone
--  Harry Potter and the Chamber of Secrets
--  Harry Potter and the Prisoner of Azkaban
--  Harry Potter and the Goblet of Fire
--  Harry Potter and the Order of the Phoenix
--  Harry Potter and the Half-Blood Prince
--  Harry Potter and the Deathly Hallows
--  The Casual Vacancy
--  Go Tell It on the Mountain
--  The Amen Corner
--  Another Country
--  The Fire Next Time
--  Going to Meet the Man
--  Tell Me How Long the Trains Been Gone
--  No Name in the Street
--  The Devil Finds Work
--  The Evidence of Things Not Seen
--  The Price of the Ticket
--  The Cross of Redemption: Uncollected Writings
--  Jimmys Blues and Other Poems
--  Hear the Wind Sing
--  South of the Border, West of the Sun
--  The Wind-Up Bird Chronicle
--  Sputnik Sweetheart
--  Kafka on the Shore
--  The Joke
--  The Farewell Waltz
--  The Book of Laughter and Forgetting
--  The Unbearable Lightness of Being
--  The Stranger
--  The Plague
--  The Fall
--  The First Man
--  I Swear the Dragons are Coming Soon

-- Add yourself as an author
insert into authors(name,nationality,birth_year) values('Alex','AUS',1991);
-- INSERT 0 1
select id from authors where name = 'Alex';
--   9

-- Add two books that you'd like to write (you can hard-code your id as the author id)
insert into books(title,publication_date,author_id) values('How to SQL',2018,9);
-- INSERT 0 1
insert into books(title,publication_date,author_id) values('Drop Life',2090,9);
-- INSERT 0 1

-- Update one of your books to have a new title
update books set title = 'Update Life' where title = 'Drop Life';
-- UPDATE 1

-- Delete your books
delete from books where title = 'Update Life';
-- DELETE 1
delete from books where title = 'How to SQL';
-- DELETE 1

-- Delete your author entry
delete from authors where id = 9;
-- DELETE 1
