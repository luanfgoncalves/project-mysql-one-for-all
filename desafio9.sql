SELECT
    COUNT(h.user_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.users_table AS u
INNER JOIN SpotifyClone.history_table AS h
    ON h.user_id = u.user_id
WHERE u.users = "Barbara Liskov"
GROUP BY u.users;
