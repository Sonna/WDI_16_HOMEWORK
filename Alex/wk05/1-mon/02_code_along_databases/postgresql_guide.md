---
source:
- title: Postgresql Guide
  url: https://gist.github.com/kasun-maldeni/33587a9405b6b6c84c42c0d433cef9f2
---

# PostgreSQL installation

### Mac users: [install guide](http://postgresapp.com)

  1. Download application
  2. Unzip and move to Application folder
  3. Set up Path variable
     [instructions](http://postgresapp.com/documentation/cli-tools.html)

### Linux users: [install guide](http://tecadmin.net/install-postgresql-server-on-ubuntu/)

  1. Install: `sudo apt-get install postgresql postgresql-contrib`
  2. Set up user access:
    * Switch to postgres user: `sudo su - postgres`
    * Create superuser: `createuser <insert_username> -s`
    * Create database: `createdb <insert_username> --owner=<insert_username>`
  3. `exit` out of postgres user.

After installation, check that it works by typing `psql` into terminal.

## PG Gem

### Mac:

```shell
gem install pg -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/latest/bin/pg_config
```

### Linux:

```shell
sudo apt-get install libpq-dev
gem install pg
```
