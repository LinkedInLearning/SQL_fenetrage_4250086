WITH t AS (
    SELECT
        EXTRACT(YEAR FROM datefacture) AS annee,
        EXTRACT(MONTH FROM datefacture) AS mois,
        SUM(montantht) AS ca
    FROM inscription.facture f
    WHERE EXTRACT(YEAR FROM datefacture) = 2001
    GROUP BY EXTRACT(YEAR FROM datefacture), EXTRACT(MONTH FROM datefacture)
) , t2 AS (
    SELECT 
        ca,
        AVG(ca) OVER () AS moyenne,
        ROW_NUMBER() OVER (ORDER BY ca) AS rn,
        COUNT(*) OVER () AS nb
    FROM t
)
SELECT 
    AVG(ca)
FROM t2
WHERE rn IN (
    (nb + 1) / 2,
    (nb + 2) / 2
);