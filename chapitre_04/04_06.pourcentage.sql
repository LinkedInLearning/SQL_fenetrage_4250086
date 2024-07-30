WITH t AS (
    SELECT
        EXTRACT(YEAR FROM datefacture) AS annee,
        EXTRACT(MONTH FROM datefacture) AS mois,
        CAST(DATE_TRUNC('month', MIN(datefacture)) AS DATE) AS datefacture,
        SUM(montantht) AS ca
    FROM inscription.facture f
    WHERE EXTRACT(YEAR FROM datefacture) >= 2001
    GROUP BY EXTRACT(YEAR FROM datefacture), EXTRACT(MONTH FROM datefacture)
)
SELECT *,
    LAG(ca) OVER (ORDER BY datefacture),
    SUM(ca) OVER (ORDER BY datefacture 
                  RANGE BETWEEN '3 month' PRECEDING AND '1 month' PRECEDING),
    ca / LAG(ca) OVER (ORDER BY datefacture) * 100,
    ca / AVG(ca) OVER (ORDER BY datefacture 
                  RANGE BETWEEN '3 month' PRECEDING AND '1 month' PRECEDING) * 100
FROM t
ORDER BY annee, mois;
