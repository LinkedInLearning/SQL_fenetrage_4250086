WITH ca AS (
    SELECT
        EXTRACT(YEAR FROM datefacture) AS annee,
        EXTRACT(MONTH FROM datefacture) AS mois,
        SUM(montantht) AS ca
    FROM inscription.facture f
    GROUP BY EXTRACT(YEAR FROM datefacture), EXTRACT(MONTH FROM datefacture)
)
SELECT *,
    SUM(ca) OVER (PARTITION BY annee),
    SUM(ca) OVER ()
FROM ca
ORDER BY annee, mois;