SELECT
    EXTRACT(YEAR FROM datefacture) AS annee,
    EXTRACT(MONTH FROM datefacture) AS mois,
    SUM(montantht) AS ca,
    NTILE(2) OVER (PARTITION BY EXTRACT(YEAR FROM datefacture) ORDER BY SUM(montantht) DESC)
FROM inscription.facture f
WHERE EXTRACT(YEAR FROM datefacture) IN (2001, 2002)
GROUP BY EXTRACT(YEAR FROM datefacture), EXTRACT(MONTH FROM datefacture)

