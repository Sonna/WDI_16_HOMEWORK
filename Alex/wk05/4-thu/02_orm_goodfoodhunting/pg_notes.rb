require "pg"

connection = PG.connect(dbname: "goodfoodhunting", port: 5433, user: "postgres", hostaddr: "::")
# => #<PG::Connection:0x00007fc95f9a00a8>

results = connection.exec("SELECT * FROM dishes;")
# => #<PG::Result:0x00007fc96286a708 status=PGRES_TUPLES_OK ntuples=3 nfields=3 cmd_tuples=3>

results.first # => {"id"=>"1", "name"=>"birthday cake", "image_url"=>"https://www.stayathomemum.com.au/cache/860x380-0/wp-content/uploads/2015/04/bigstock-Delicious-birthday-cake-on-tab-78718583.jpg"}
results[0] # => {"id"=>"1", "name"=>"birthday cake", "image_url"=>"https://www.stayathomemum.com.au/cache/860x380-0/wp-content/uploads/2015/04/bigstock-Delicious-birthday-cake-on-tab-78718583.jpg"}
results.first["id"] # => "1"
