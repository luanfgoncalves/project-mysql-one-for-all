SELECT u.users AS usuario,
IF(MAX(YEAR(h.reproduction_date)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.users_table AS u
INNER JOIN SpotifyClone.history_table AS h
ON u.user_id = h.user_id
GROUP BY u.users
ORDER BY u.users;
