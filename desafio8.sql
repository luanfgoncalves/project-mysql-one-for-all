SELECT
    art.artist artista,
    alb.albums AS album FROM SpotifyClone.artists_table AS art
INNER JOIN SpotifyClone.albums_table AS alb
ON art.artist_id = alb.artist_id
WHERE art.artist = 'Elis Regina'
ORDER BY alb.albums;
