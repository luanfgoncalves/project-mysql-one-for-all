SELECT 
    m.musics As cancao,
    COUNT(m.musics) AS reproducoes FROM SpotifyClone.musics_table AS m
INNER JOIN SpotifyClone.history_table h
    ON m.music_id = h.history
GROUP BY m.musics
ORDER BY reproducoes DESC, cancao LIMIT 2;
