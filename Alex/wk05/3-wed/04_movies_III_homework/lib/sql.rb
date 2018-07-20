def conn_sql
  conn = PG.connect(dbname: ENV["DB_NAME"], port: ENV["DB_PORT"],
                    user: ENV["DB_USER"], hostaddr: ENV["DB_ADDR"])
  yield conn
ensure
  conn.close
end

def run_sql(sql)
  conn_sql { |conn| conn.exec(sql) }
end

def prepare_sql(name, sql, *args)
  conn_sql do |conn|
    conn.prepare(name, sql)
    conn.exec_prepared(name, args)
  end
end

module PSQL
  class << self
    def connect
      conn = PG.connect(dbname: ENV["DB_NAME"], port: ENV["DB_PORT"],
                        user: ENV["DB_USER"], hostaddr: ENV["DB_ADDR"])
      yield conn
    ensure
      conn.close
    end

    def exec(sql)
      connect { |conn| conn.exec(sql) }
    end

    # def prepare(name, sql)
    #   connect { |conn| conn.prepare(name, sql) }
    # end

    def exec_prepared(name, sql, *args)
      connect do |conn|
        conn.prepare(name, sql)
        conn.exec_prepared(name, args)
      end
    end
  end
end
