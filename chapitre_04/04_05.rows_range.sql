WITH t AS (
    SELECT
        EXTRACT(YEAR FROM datefacture) AS annee,
        EXTRACT(MONTH FROM datefacture) AS mois,
        MIN(datefacture) AS datefacture,
        SUM(montantht) AS ca
    FROM inscription.facture f
    WHERE EXTRACT(YEAR FROM datefacture) >= 2001
    GROUP BY EXTRACT(YEAR FROM datefacture), EXTRACT(MONTH FROM datefacture)
)
SELECT *,
    SUM(ca) OVER (ORDER BY annee, mois ROWS 3 PRECEDING),
    SUM(ca) OVER (ORDER BY datefacture RANGE '3 month' PRECEDING)
FROM t
ORDER BY annee, mois;
