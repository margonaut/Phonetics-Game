require "csv"
require "pg"
require "pry"

def db_connection
  begin
    connection = PG.connect(dbname: "words")
    yield(connection)
  ensure
    connection.close
  end
end
