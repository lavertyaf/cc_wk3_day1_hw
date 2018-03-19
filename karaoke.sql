DROP TABLE rooms_songs;
DROP TABLE bar_tab;
DROP TABLE guests;
DROP TABLE songs;
DROP TABLE rooms;

CREATE TABLE rooms (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(225) NOT NULL,
  capacity INT NOT NULL,
  time_limit INT NOT NULL,
  entry_fee INT NOT NULL
);

CREATE TABLE songs (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(225) NOT NULL,
  artist VARCHAR(225) NOT NULL,
  run_time INT NOT NULL,
  genre VARCHAR (225)
);

CREATE TABLE guests (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(225) NOT NULL,
  favourite_song_id INT8 REFERENCES songs(id) ON DELETE CASCADE,
  wallet_amount INT NOT NULL,
  room_id INT8 REFERENCES rooms(id) ON DELETE CASCADE
);

CREATE TABLE rooms_songs (
  room_id INT8 REFERENCES rooms(id) ON DELETE CASCADE,
  song_id INT8 REFERENCES songs(id) ON DELETE CASCADE
);

CREATE TABLE bar_tab (
  id SERIAL8 PRIMARY KEY,
  total INT NOT NULL,
  room_id INT8 REFERENCES rooms(id) ON DELETE CASCADE
);

INSERT INTO rooms (name, capacity, time_limit, entry_fee) VALUES ('Rock', 4, 30, 15);
INSERT INTO rooms (name, capacity, time_limit, entry_fee) VALUES ('Jazz', 6, 30, 10);
INSERT INTO rooms (name, capacity, time_limit, entry_fee) VALUES ('Pop', 8, 30, 20);
INSERT INTO rooms (name, capacity, time_limit, entry_fee) VALUES ('Country', 4, 30, 8);
INSERT INTO rooms (name, capacity, time_limit, entry_fee) VALUES ('RnB', 10, 45, 10);

UPDATE rooms
  SET name = 'Rap'
  WHERE name = 'RnB' ;

SELECT * FROM rooms ORDER BY id;
SELECT name FROM rooms;
SELECT * FROM rooms WHERE id = 2;

INSERT INTO songs (title, artist, run_time, genre) VALUES ('Hero', 'Mariah Carey', 4, 'Pop');
INSERT INTO songs (title, artist, run_time, genre) VALUES ('Achey-Breaky Heart', 'Billy-Ray Cyrus', 3, 'Country');
INSERT INTO songs (title, artist, run_time, genre) VALUES ('Everlong', 'Foo Fighters', 5, 'Rock');
INSERT INTO songs (title, artist, run_time, genre) VALUES ('Remix to Ignition', 'R Kelly', 6, 'RnB');
INSERT INTO songs (title, artist, run_time, genre) VALUES ('Wonderful World', 'Louis Armstrong', 5, 'Jazz');

UPDATE songs
  SET title = 'All I want for Christmas'
  WHERE id  = 1 ;

SELECT * FROM songs ORDER BY id;
SELECT title FROM songs;
SELECT * FROM songs WHERE id = 5;

INSERT INTO guests (name, favourite_song_id, wallet_amount, room_id) VALUES ('Sarah', 1, 20, 3);
INSERT INTO guests (name, favourite_song_id, wallet_amount, room_id) VALUES ('Laura', 2, 50, 4);
INSERT INTO guests (name, favourite_song_id, wallet_amount, room_id) VALUES ('Kathryn', 3, 25, 1);
INSERT INTO guests (name, favourite_song_id, wallet_amount, room_id) VALUES ('Claire', 4, 20, 5);
INSERT INTO guests (name, favourite_song_id, wallet_amount, room_id) VALUES ('Rodney', 5, 30, 2);

UPDATE guests
  SET (name, wallet_amount) = ('Nicol', 30)
  WHERE name = 'Sarah' ;

SELECT * FROM guests ORDER BY id;
SELECT name FROM guests;
SELECT * FROM guests WHERE id = 1;

INSERT INTO rooms_songs (room_id, song_id) VALUES (1, 2);
INSERT INTO rooms_songs (room_id, song_id) VALUES (1, 3);
INSERT INTO rooms_songs (room_id, song_id) VALUES (1, 5);
INSERT INTO rooms_songs (room_id, song_id) VALUES (2, 2);
INSERT INTO rooms_songs (room_id, song_id) VALUES (5, 5);
INSERT INTO rooms_songs (room_id, song_id) VALUES (5, 4);
INSERT INTO rooms_songs (room_id, song_id) VALUES (5, 3);
INSERT INTO rooms_songs (room_id, song_id) VALUES (3, 5);
INSERT INTO rooms_songs (room_id, song_id) VALUES (3, 1);
INSERT INTO rooms_songs (room_id, song_id) VALUES (4, 2);

SELECT * FROM rooms_songs ORDER BY room_id;

INSERT INTO bar_tab (total, room_id) VALUES (30, 5);
INSERT INTO bar_tab (total, room_id) VALUES (27, 2);
INSERT INTO bar_tab (total, room_id) VALUES (18, 4);
INSERT INTO bar_tab (total, room_id) VALUES (55, 1);
INSERT INTO bar_tab (total, room_id) VALUES (97, 3);

SELECT * FROM bar_tab ORDER BY room_id;
