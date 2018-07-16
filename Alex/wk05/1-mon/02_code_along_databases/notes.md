# Database notes

`goodfoodhunting.com`

```txt
    ⎡¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯⎤   ⎡¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯⎤
    ⎢ GFH           ⎥   ⎢ Cake          ⎥
    ⎢               ⎥   ⎢               ⎥
    ⎢  ⎡¯¯¯⎤ ⎡¯¯¯⎤  ⎥   ⎢  ⎡¯¯¯¯¯¯¯¯¯⎤  ⎥
    ⎢  ⎢   ⎥ ⎢   ⎥  ⎥   ⎢  ⎢ ^   i   ⎥  ⎥
    ⎢  ⎣___⎦ ⎣__\⎦  ⎥   ⎢  ⎣/  <__]  ⎥  ⎥
    ⎢            \_________/_________⎦  ⎥
    ⎢  ⎡¯¯¯⎤ ⎡¯¯¯⎤  ⎥   ⎢  ⎡~~~~     ⎤  ⎥
    ⎢  ⎢   ⎥ ⎢   ⎥  ⎥   ⎢  ⎡¯¯¯¯¯¯¯¯¯⎤  ⎥
    ⎢  ⎣___⎦ ⎣___⎦  ⎥   ⎢  ⎡¯¯¯¯¯¯¯¯¯⎤  ⎥
    ⎢               ⎥   ⎢  ⎡¯¯¯¯¯¯¯¯¯⎤  ⎥
    ⎢  ⎡¯¯¯⎤ ⎡¯¯¯⎤  ⎥   ⎢  ⎡¯¯¯¯¯¯¯¯¯⎤  ⎥
    ⎢  ⎢   ⎥ ⎢   ⎥  ⎥   ⎢  ⎡¯¯¯¯¯¯¯¯¯⎤  ⎥
    ⎢  ⎣___⎦ ⎣___⎦  ⎥   ⎢  ⎣_________⎦  ⎥
    ⎣_______________⎦   ⎣_______________⎦
```

Potential ideas for Food attribute in our site:
- Dish's name
- image
- date time
- location
- comments

# Why use a Database?

* _Relational Databases_
  - Structure rules
  - Efficiency - Searching
  - Get things back

* _**`http`** is a stateless protocol_

* Different types of databases
  - "PostgreSQL"
  - "MySQL"
  - "Ms Server"
  - "MariaSQL"
  - "IBM"
  - "Oracle"
  - "SQLite"

# Database console commands

```shell
  # start a database instance
  $ docker run --rm -d -p 5433:5432 postgres:latest

  # remote into database instance
  $ psql -h localhost -u postgres -p 5433
```

```psql
    psql (9.5.4, server 10.4 (Debian 10.4-2.pgdg90+1))
    WARNING: psql major version 9.5, server major version 10.0.
             Some psql features might not work.
    Type "help" for help.

    postgres=#\q
```

```shell
  $ psql -h localhost -u postgres -p 5433
```

```psql
    psql (9.5.4, server 10.4 (Debian 10.4-2.pgdg90+1))
    WARNING: psql major version 9.5, server major version 10.0.
             Some psql features might not work.
    Type "help" for help.

    postgres=#\?

    General
      \copyright             show PostgreSQL usage and distribution terms
      \g [FILE] or ;         execute query (and send results to file or |pipe)
      \gset [PREFIX]         execute query and store results in psql variables
      \q                     quit psql
      \watch [SEC]           execute query every SEC seconds

    Help
      \? [commands]          show help on backslash commands
      \? options             show help on psql command-line options
      \? variables           show help on special variables
      \h [NAME]              help on syntax of SQL commands, * for all commands

    Query Buffer
      \e [FILE] [LINE]       edit the query buffer (or file) with external editor
      \ef [FUNCNAME [LINE]]  edit function definition with external editor
      \p                     show the contents of the query buffer
      \r                     reset (clear) the query buffer
      \s [FILE]              display history or save it to file
      \w FILE                write query buffer to file

    Input/Output
      \copy ...              perform SQL COPY with data stream to the client host
      \echo [STRING]         write string to standard output
      \i FILE                execute commands from file
      \ir FILE               as \i, but relative to location of current script
      \o [FILE]              send all query results to file or |pipe
      \qecho [STRING]        write string to query output stream (see \o)

    Informational
      (options: S = show system objects, + = additional detail)
      \d[S+]                 list tables, views, and sequences
      \d[S+]  NAME           describe table, view, sequence, or index
      \da[S]  [PATTERN]      list aggregates
      \db[+]  [PATTERN]      list tablespaces
      \dc[S+] [PATTERN]      list conversions
      \dC[+]  [PATTERN]      list casts
      \dd[S]  [PATTERN]      show object descriptions not displayed elsewhere
      \ddp    [PATTERN]      list default privileges
      \dD[S+] [PATTERN]      list domains
      \det[+] [PATTERN]      list foreign tables
      \des[+] [PATTERN]      list foreign servers
      \deu[+] [PATTERN]      list user mappings
      \dew[+] [PATTERN]      list foreign-data wrappers
      \df[antw][S+] [PATRN]  list [only agg/normal/trigger/window] functions
      \dF[+]  [PATTERN]      list text search configurations
      \dFd[+] [PATTERN]      list text search dictionaries
      \dFp[+] [PATTERN]      list text search parsers
      \dFt[+] [PATTERN]      list text search templates
      \dg[+]  [PATTERN]      list roles
      \di[S+] [PATTERN]      list indexes
      \dl                    list large objects, same as \lo_list
      \dL[S+] [PATTERN]      list procedural languages
      \dm[S+] [PATTERN]      list materialized views
      \dn[S+] [PATTERN]      list schemas
      \do[S]  [PATTERN]      list operators
      \dO[S+] [PATTERN]      list collations
      \dp     [PATTERN]      list table, view, and sequence access privileges
      \drds [PATRN1 [PATRN2]] list per-database role settings
      \ds[S+] [PATTERN]      list sequences
      \dt[S+] [PATTERN]      list tables
      \dT[S+] [PATTERN]      list data types
      \du[+]  [PATTERN]      list roles
      \dv[S+] [PATTERN]      list views
      \dE[S+] [PATTERN]      list foreign tables
      \dx[+]  [PATTERN]      list extensions
      \dy     [PATTERN]      list event triggers
      \l[+]   [PATTERN]      list databases
      \sf[+] FUNCNAME        show a function's definition
      \z      [PATTERN]      same as \dp

    Formatting
      \a                     toggle between unaligned and aligned output mode
      \C [STRING]            set table title, or unset if none
      \f [STRING]            show or set field separator for unaligned query output
      \H                     toggle HTML output mode (currently off)
      \pset [NAME [VALUE]]   set table output option
                             (NAME := {format|border|expanded|fieldsep|fieldsep_zero|footer|null|
                             numericlocale|recordsep|recordsep_zero|tuples_only|title|tableattr|pager|
                             unicode_border_linestyle|unicode_column_linestyle|unicode_header_linestyle})
      \t [on|off]            show only rows (currently off)
      \T [STRING]            set HTML <table> tag attributes, or unset if none
      \x [on|off|auto]       toggle expanded output (currently off)

    Connection
      \c[onnect] {[DBNAME|- USER|- HOST|- PORT|-] | conninfo}
                             connect to new database (currently "postgres")
      \encoding [ENCODING]   show or set client encoding
      \password [USERNAME]   securely change the password for a user
      \conninfo              display information about current connection

    Operating System
      \cd [DIR]              change the current working directory
      \setenv NAME [VALUE]   set or unset environment variable
      \timing [on|off]       toggle timing of commands (currently off)
      \! [COMMAND]           execute command in shell or start interactive shell

    Variables
      \prompt [TEXT] NAME    prompt user to set internal variable
      \set [NAME [VALUE]]    set internal variable, or list all if no parameters
      \unset NAME            unset (delete) internal variable

    Large Objects
      \lo_export LOBOID FILE
      \lo_import FILE [COMMENT]
      \lo_list
      \lo_unlink LOBOID      large object operations
```

```shell
$ touch goodfoodhunting.sql
$ subl .
```

```psql
postgres=# create database goodfoodhunting;
CREATE DATABASE

postgres=# \c goodfoodhunting
psql (9.5.4, server 10.4 (Debian 10.4-2.pgdg90+1))
WARNING: psql major version 9.5, server major version 10.0.
         Some psql features might not work.
You are now connected to database "goodfoodhunting" as user "postgres".

goodfoodhunting=# CREATE TABLE dishes (
goodfoodhunting(#   id SERIAL4 PRIMARY KEY,
goodfoodhunting(#   name VARCHAR(100),
goodfoodhunting(#   image_url VARCHAR(400)
goodfoodhunting(# );
CREATE TABLE

goodfoodhunting=# \dt
 public | dishes | table | postgres

goodfoodhunting=# \c postgres
psql (9.5.4, server 10.4 (Debian 10.4-2.pgdg90+1))
WARNING: psql major version 9.5, server major version 10.0.
         Some psql features might not work.
You are now connected to database "postgres" as user "postgres".

postgres=# \c goodfoodhunting

```

```psql
goodfoodhunting=# select * from dishes;
id | name | image_url
---+------+----------
(0 rows)

goodfoodhunting=# INSERT INTO dishes (name, image_url) values ('birthday cake', 'https://www.stayathomemum.com.au/cache/860x380-0/wp-content/uploads/2015/04/bigstock-Delicious-birthday-cake-on-tab-78718583.jpg');
INSERT 0 1

goodfoodhunting=# select * from dishes;
  1 | birthday cake | https://www.stayathomemum.com.au/cache/860x380-0/wp-content/uploads/2015/04/bigstock-Delicious-birthday-cake-on-tab-78718583.jpg

goodfoodhunting=# select name from dishes;
 birthday cake

goodfoodhunting=# select name, id from dishes;
      name     | id
---------------+-----
 birthday cake |  1
(1 rows)

goodfoodhunting=# INSERT INTO dishes (name, image_url) values ('pudding', 'https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2016/10/cherry-chocolate-pudding.jpg?itok=dNPboDsi');
INSERT 0 1

goodfoodhunting=# INSERT INTO dishes (name, image_url) values ('sandwich', 'http://www.chingssecret.com/assets/uploads/images/chings-secret-schezwan-chutney-sandwitch%2003.jpg');
INSERT 0 1

goodfoodhunting=# select name from dishes;
      name
---------------
 birthday cake
 pudding
 sandwich
(3 rows)

goodfoodhunting=# select id, name from dishes;
 id |      name
----+---------------
  1 | birthday cake
  2 | pudding
  3 | sandwich
(3 rows)

goodfoodhunting=# select name from dishes where id = 2;
  name
---------
 pudding
(1 row)

goodfoodhunting=# select name from dishes where id = 4;
  name
---------
(0 rows)

goodfoodhunting=# select name from dishes where name = 'pudding';
  name
---------
 pudding
(1 row)

goodfoodhunting=# select name from dishes where id > 1;
   name
----------
 pudding
 sandwich
(2 rows)

goodfoodhunting=# select name from dishes where name = 'pudding' and name = 'sandwich';
 name
------
(0 rows)

goodfoodhunting=# select name from dishes where name = 'pudding' or name = 'sandwich';
   name
----------
 pudding
 sandwich
(2 rows)

goodfoodhunting=# select name from dishes where name like 'p%';
goodfoodhunting=# select name from dishes where name ilike 'p%';
  name
---------
 pudding
(1 row)

goodfoodhunting=# select name from dishes where name ilike '%ing';
  name
---------
 pudding
(1 row)

goodfoodhunting=# select name from dishes where id in(1,2,3);
      name
---------------
 birthday cake
 pudding
 sandwich
(3 rows)

goodfoodhunting=# select name from dishes where name in('pudding','birthday cake');
      name
---------------
 birthday cake
 pudding
(2 rows)

goodfoodhunting=# \d dishes;
                                  Table "public.dishes"
  Column   |          Type          |                      Modifiers
-----------+------------------------+-----------------------------------------------------
 id        | integer                | not null default nextval('dishes_id_seq'::regclass)
 name      | character varying(100) |
 image_url | character varying(400) |
Indexes:
    "dishes_pkey" PRIMARY KEY, btree (id)


goodfoodhunting=# delete from dishes;
      name
---------------
 birthday cake
 pudding
(2 rows)

```
