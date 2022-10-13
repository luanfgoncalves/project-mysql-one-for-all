SELECT
    u.users AS usuario,
    COUNT(h.history) AS qt_de_musicas_ouvidas,
    ROUND(SUM(m.duration) / 60, 2) AS total_minutos
FROM SpotifyClone.users_table AS u
INNER JOIN SpotifyClone.history_table AS h
    ON u.user_id = h.user_id
INNER JOIN SpotifyClone.musics_table AS m
    ON m.music_id = h.history
GROUP BY u.user_id
ORDER BY u.users;
