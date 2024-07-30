WITH cte AS (
    SELECT
        EXTRACT(YEAR FROM datefacture) AS annee,
        EXTRACT(MONTH FROM datefacture) AS mois,
        SUM(montantht) AS ca,
        ROW_NUMBER() OVER (PARTITION BY EXTRACT(YEAR FROM datefacture) 
                           ORDER BY SUM(montantht) DESC) AS rn
    FROM inscription.facture f
    WHERE f.datefacture IS NOT NULL
    GROUP BY EXTRACT(YEAR FROM datefacture), EXTRACT(MONTH FROM datefacture)
)
SELECT annee, mois, ca
FROM cte
WHERE rn BETWEEN 1 AND 2
ORDER BY annee, rn;