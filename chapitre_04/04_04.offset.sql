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
    SUM(ca) OVER (ORDER BY annee, mois) AS total_cumule,
    LAG(ca, 2) OVER (ORDER BY annee, mois),
    LEAD(ca, 2) OVER (ORDER BY annee, mois),
    FIRST_VALUE(ca) OVER (ORDER BY annee, mois),
    LAST_VALUE(ca) OVER (ORDER BY annee, mois)
FROM t
ORDER BY annee, mois;
