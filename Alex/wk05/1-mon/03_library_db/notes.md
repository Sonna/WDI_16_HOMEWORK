```psql
library=# select count(*) from books;
 count
-------
    68
(1 row)

library=# select count(*) from books where publication_date = 2000;
 count
-------
     5
(1 row)

```
