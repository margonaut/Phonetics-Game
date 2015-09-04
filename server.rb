require "sinatra"
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

def random_word
  word = {english: "", phonetic: ""}
  id_num = rand(1..74467)
  db_connection do |conn|
    new_word = conn.exec("SELECT words.english, words.phonetic FROM words WHERE words.id = $1", [id_num])
    word[:english] = new_word[0]["english"]
    word[:phonetic] = new_word[0]["phonetic"]
  end
  word
end

def fetch_phoneme(character)
  result = []
  db_connection do |conn|
    result = conn.exec("SELECT * FROM phonemes WHERE phonemes.symbol = $1", [character])
  end
  result.first
end

def array_of_phonemes(word)
  phoneme_array = []
  result = word.split(//)
  result.each do |symbol|
    phoneme = fetch_phoneme(symbol)
      phoneme_array << phoneme
  end
  phoneme_array
end

get "/" do
  word = random_word
  erb :index, locals: { word: word, phonemes: array_of_phonemes(word[:phonetic]) }
end

get "/practice" do
  word = random_word
  erb :practice, locals: { word: word, phonemes: array_of_phonemes(word[:phonetic]) }
end
