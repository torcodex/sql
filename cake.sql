SELECT
  *
FROM
  product
WHERE
  (
    brand LIKE "Cadbury"
    OR brand LIKE "Britannia"
  )
  AND rating > 4
  AND name LIKE "%Cake%";
