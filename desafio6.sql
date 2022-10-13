SELECT
  CAST(MIN(plan_value) AS DECIMAL ( 4 , 2 )) faturamento_minimo,
  CAST(MAX(plan_value) AS DECIMAL ( 4 , 2 )) faturamento_maximo,
  CAST(ROUND(AVG(plan_value), 2) AS DECIMAL ( 4 , 2 )) faturamento_medio,
  CAST(ROUND(SUM(plan_value), 2) AS DECIMAL ( 4 , 2 )) faturamento_total
FROM SpotifyClone.plans_table p
INNER JOIN SpotifyClone.users_table u
ON p.plan_id = u.plan_id;
