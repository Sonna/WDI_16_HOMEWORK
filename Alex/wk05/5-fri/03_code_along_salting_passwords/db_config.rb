require "active_record"

options = {
  adapter: 'postgresql',
  database: 'goodfoodhunting',
  username: "postgres",
  hostaddr: "::",
  port: 5433
}

ActiveRecord::Base.establish_connection(options)
