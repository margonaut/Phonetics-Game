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

db_connection do |conn|
  CSV.foreach('words.csv', headers: true, header_converters: :symbol) do |row|
    conn.exec_params("INSERT INTO words (english, phonetic) VALUES ($1, $2)", [row[:english], row[:phonetic]])
  end
end

db_connection do |conn|
  CSV.foreach('phonemes.csv', headers: true, header_converters: :symbol) do |row|
    conn.exec_params("INSERT INTO phonemes (symbol) VALUES ($1)", [row[:symbol]])
  end
end
