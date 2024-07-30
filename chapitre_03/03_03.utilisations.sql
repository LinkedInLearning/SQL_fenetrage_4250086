SELECT
    EXTRACT(YEAR FROM datefacture) AS annee,
    EXTRACT(MONTH FROM datefacture) AS mois,
    SUM(montantht) AS ca
FROM inscription.facture f
GROUP BY EXTRACT(YEAR FROM datefacture), EXTRACT(MONTH FROM datefacture)
ORDER BY annee, mois;

SELECT
    EXTRACT(YEAR FROM datefacture) AS annee,
    EXTRACT(MONTH FROM datefacture) AS mois,
    SUM(montantht) AS ca,
    SUM(SUM(montantht)) OVER (PARTITION BY EXTRACT(YEAR FROM datefacture)) AS ca_annee,
    SUM(SUM(montantht)) OVER () AS ca_total
FROM inscription.facture f
GROUP BY EXTRACT(YEAR FROM datefacture), EXTRACT(MONTH FROM datefacture)
ORDER BY annee, mois;

WITH t AS (
    SELECT
        EXTRACT(YEAR FROM datefacture) AS annee,
        EXTRACT(MONTH FROM datefacture) AS mois,
        SUM(montantht) AS ca,
        SUM(SUM(montantht)) OVER (PARTITION BY EXTRACT(YEAR FROM datefacture)) AS ca_annee,
        SUM(SUM(montantht)) OVER () AS ca_total
    FROM inscription.facture f
    GROUP BY EXTRACT(YEAR FROM datefacture), EXTRACT(MONTH FROM datefacture)
)
SELECT *,
    (ca / ca_annee) * 100 AS pourcent_sur_annee
FROM t
ORDER BY annee, pourcent_sur_annee DESC;