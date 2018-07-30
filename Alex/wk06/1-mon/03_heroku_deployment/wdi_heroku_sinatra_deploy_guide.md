---
source:
- title: WDI Heroku Sinatra Deployment Guide
  url: https://gist.github.com/kasun-maldeni/bf8153996f4a9aa1eacdac2dee9e636c
---

# Heroku sinatra deploy guide

This guide assumes you have used `sinatra new app_name -va` to produce your
sinatra application first.

Make the following changes to your local files:

1. You must list the gems that your project uses in the `Gemfile`. example:

```ruby
source 'https://rubygems.org'

gem 'activerecord'
gem 'sinatra'
gem 'pg'
gem 'bcrypt'
gem 'httparty'
gem 'pry'
```

2. We need to `gem install bundler`, then enter the `bundler` command in our
   terminal to build a `Gemfile.lock` file.

3. In your db_config.rb, change the `ActiveRecord::Base.establish_connection`
   line to look like below:

```
ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)
```

4. Comment out your `require sinatra/reloader` line, its not necessary on
   heroku. Also make sure you don't have any `binding.pry` in your code, you
   don't want your production server to pause execution!

This concludes our local file setup.

## Heroku Stuff

Now we need to do the heroku stuff. Visit the link below:

[Heroku deploy Guide](https://devcenter.heroku.com/articles/getting-started-with-ruby#introduction)

### Database stuff

Take a dump:
`pg_dump -Fc --no-acl --no-owner -h localhost -U <db_username> <db_name> > db.dump`

Restore the dump on production:
`heroku pg:backups:restore '<URL_to_database_on_github>' DATABASE_URL`

### Every change you make to source code locally

Type `git add -A`, `git commit -m "message"`
Finally, type `git push heroku master`.
Hit `heroku open` to open the site in your browser.

## Troubleshooting

`heroku logs` to see what's wrong
`heroku restart` sometimes helps
`heroku create` sometimes it's better to kill it with fire
