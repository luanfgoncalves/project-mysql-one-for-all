SELECT 
  COUNT(*) AS cancoes,
	  (SELECT COUNT(*) FROM SpotifyClone.artists_table) AS artistas,
      (SELECT COUNT(*) FROM SpotifyClone.albums_table) AS albuns
FROM SpotifyClone.musics_table;
