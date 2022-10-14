SELECT
    m.musics AS nome,
    COUNT(h.history) AS reproducoes 
FROM SpotifyClone.musics_table AS m
INNER JOIN SpotifyClone.history_table AS h
    ON h.history = m.music_id
INNER JOIN SpotifyClone.users_table AS u
    ON u.user_id = h.user_id
WHERE u.plan_id = 1 OR u.plan_id = 4
GROUP BY m.musics ORDER BY m.musics;
