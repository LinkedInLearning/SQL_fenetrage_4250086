WITH t AS (
    SELECT
        EXTRACT(YEAR FROM datefacture) AS annee,
        EXTRACT(MONTH FROM datefacture) AS mois,
        EXTRACT(WEEK FROM datefacture) AS semaine,
        CAST(DATE_TRUNC('month', MIN(datefacture)) AS DATE) AS datefacture,
        SUM(montantht) AS ca
    FROM inscription.facture f
    WHERE EXTRACT(YEAR FROM datefacture) >= 2001
    GROUP BY EXTRACT(YEAR FROM datefacture), EXTRACT(MONTH FROM datefacture),
        EXTRACT(WEEK FROM datefacture)
)
SELECT *,
    SUM(ca) 
      FILTER (WHERE mois <> 2)
      OVER (ORDER BY datefacture RANGE '1 month' PRECEDING EXCLUDE GROUP)
FROM t
ORDER BY annee, mois, semaine;
