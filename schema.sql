DROP TABLE IF EXISTS words;

CREATE TABLE words (
  id SERIAL PRIMARY KEY,
  english varchar(100) NOT NULL,
  phonetic varchar(100) NOT NULL,
  reading_level int,
  syllables int
);
