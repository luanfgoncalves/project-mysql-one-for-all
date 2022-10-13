DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE SpotifyClone;

  -- Planos --

  CREATE TABLE SpotifyClone.plans_table(
      plan_id INT AUTO_INCREMENT PRIMARY KEY,
      plans VARCHAR(15) NOT NULL,
      plan_value FLOAT NOT NULL
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.plans_table(plans, plan_value)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitario', 5.99),
    ('pessoal', 6.99);

  -- Usuários --

  CREATE TABLE SpotifyClone.users_table(
      user_id INT AUTO_INCREMENT PRIMARY KEY,
      users VARCHAR(50) NOT NULL,
      age INT NOT NULL,
      plan_id INTEGER NOT NULL,
      singnature_date DATE,
      CONSTRAINT FOREIGN KEY (plan_id) REFERENCES plans_table (plan_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.users_table (users, age,	plan_id, singnature_date)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2018-04-29'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');

  -- Artistas --

  CREATE TABLE SpotifyClone.artists_table(
      artist_id INT AUTO_INCREMENT PRIMARY KEY,
      artist VARCHAR(50) NOT NULL
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.artists_table (artist)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  -- Artistas seguidos --

  CREATE TABLE SpotifyClone.followed_table(
      user_id INTEGER NOT NULL,
      followed INT NOT NULL,
      CONSTRAINT PRIMARY KEY (followed, user_id),
      FOREIGN KEY (followed) REFERENCES artists_table (artist_id),
      FOREIGN KEY (user_id) REFERENCES users_table (user_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.followed_table(user_id, followed)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);

  -- Albuns --

  CREATE TABLE SpotifyClone.albums_table(
      album_id INT AUTO_INCREMENT PRIMARY KEY,
      albums VARCHAR(50) NOT NULL UNIQUE,
      artist_id INTEGER NOT NULL,
      release_year YEAR NOT NULL,
      FOREIGN KEY (artist_id) REFERENCES artists_table (artist_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.albums_table (albums, artist_id, release_year)
  VALUES
    ('Renaissance', 1, 2022),
    ('Jazz', 2, 1978),
    ('Hot Space', 2, 1982),
    ('Falso Brilhante', 3, 1998),
    ('Vento de Maio', 3, 2001),
    ('QVVJFA?', 4, '2003'),
    ('Somewhere Far Beyond', 5, 2007),
    ('I Put A Spell On You', 6, 2012);
  
  -- Musicas --

   CREATE TABLE SpotifyClone.musics_table(
      music_id INT AUTO_INCREMENT PRIMARY KEY,
      musics VARCHAR(50) NOT NULL,
      duration INT NOT NULL,
      album_id INTEGER NOT NULL,
      CONSTRAINT FOREIGN KEY (album_id) REFERENCES albums_table (album_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.musics_table (musics, duration, album_id)
  VALUES
    ("BREAK MY SOUL", 279, 1),
    ("VIRGO’S GROOVE", 369, 1),
    ("ALIEN SUPERSTAR", 116, 1),
    ("Don’t Stop Me Now", 203, 2),
    ("Under Pressure", 152, 3),
    ("Como Nossos Pais", 105, 4),
    ("O Medo de Amar é o Medo de Ser Livre", 207, 5),
    ("Samba em Paris", 267, 6),
    ("The Bard’s Song", 244, 7),
    ("Feeling Good", 100, 8);

  -- Histórico --

  CREATE TABLE SpotifyClone.history_table(
    history INT NOT NULL,
	  user_id integer,
    reproduction_date DATETIME,
    CONSTRAINT PRIMARY KEY(user_id, history),
    FOREIGN KEY (history) REFERENCES musics_table (music_id),
    FOREIGN KEY (user_id) REFERENCES users_table (user_id)
  ) engine = InnoDB;
    
  INSERT INTO SpotifyClone.history_table(history, user_id, reproduction_date)
  VALUES
    (8, 1, "2022-02-28 10:45:55"),
    (2, 1, "2020-05-02 05:30:35"),
    (10, 1, "2020-03-06 11:22:33"),
    (10, 2, "2022-08-05 08:05:17"),
    (7, 2, "2020-01-02 07:40:33"),
    (10, 3, "2020-11-13 16:55:13"),
    (2, 3, "2020-12-05 18:38:30"),
    (8, 4, "2021-08-15 17:10:10"),
    (8, 5, "2022-01-09 01:44:33"),
    (5, 5,  "2020-08-06 15:23:43"),
    (7, 6, "2017-01-24 00:31:17"),
    (1, 6, "2017-10-12 12:35:20"),
    (4, 7, "2011-12-15 22:30:49"),
    (4, 8, "2012-03-17 14:56:41"),
    (9, 9, "2022-02-24 21:14:22"),
    (3, 10, "2015-12-13 08:30:22");
