DROP TABLE IF EXISTS words, phonemes;

CREATE TABLE words (
  id SERIAL PRIMARY KEY,
  english varchar(100) NOT NULL,
  phonetic varchar(100) NOT NULL,
  difficulty int,
  category varchar(100)
);

CREATE TABLE phonemes (
  id SERIAL PRIMARY KEY,
  symbol varchar(100),
  category varchar(100),
  place varchar(100),
  manner varchar(100),
  voiced varchar(100)
)

-- CREATE TABLE phonetic_link (
--   id SERIAL PRIMARY KEY,
--   phoneme_id int,
--   word_id int
-- )

-- SELECT phonemes.* FROM words
-- JOIN phonetic_link ON words.id = phonetic_link.word_id
-- JOIN phonemes ON phonemes.id = phonetic_link.phoneme_id
-- WHERE words.id = $1
-- http://www2.sharonherald.com/herald/nie/spellb/spelllist2.html
--
