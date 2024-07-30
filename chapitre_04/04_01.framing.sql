WITH t AS (
    SELECT
        EXTRACT(YEAR FROM datefacture) AS annee,
        EXTRACT(MONTH FROM datefacture) AS mois,
        SUM(montantht) AS ca
    FROM inscription.facture f
    WHERE EXTRACT(YEAR FROM datefacture) >= 2001
    GROUP BY EXTRACT(YEAR FROM datefacture), EXTRACT(MONTH FROM datefacture)
)
SELECT *,
    AVG(ca) OVER (ORDER BY annee, mois ROWS BETWEEN 1 PRECEDING AND CURRENT ROW)
FROM t
ORDER BY annee, mois;
