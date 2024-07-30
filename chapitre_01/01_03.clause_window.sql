SELECT
	datefacture,
	montantht,
	row_number() over y2 as rn,
	rank() over (y ORDER BY datefacture) as r
FROM inscription.facture f
WINDOW y  AS (partition by extract(year from datefacture)),
       y2 AS (y order by facturecd)
ORDER BY datefacture;