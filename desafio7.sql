SELECT
    art.artist AS artista, 
    alb.albums AS album, 
    count(f.user_id) AS seguidores
FROM SpotifyClone.artists_table AS art
INNER JOIN SpotifyClone.albums_table AS alb
    ON art.artist_id = alb.artist_id
INNER JOIN SpotifyClone.followed_table AS f
    ON f.followed = art.artist_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;
