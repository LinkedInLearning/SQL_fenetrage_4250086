-- quel est le pourcent de CA par rapport à la moyenne des CA de l'année ?
WITH t AS (
    SELECT
        EXTRACT(YEAR FROM datefacture) AS annee,
        EXTRACT(MONTH FROM datefacture) AS mois,
        SUM(montantht) AS ca
    FROM inscription.facture f
    GROUP BY EXTRACT(YEAR FROM datefacture), EXTRACT(MONTH FROM datefacture)
)
SELECT annee, mois, ca
FROM t
ORDER BY annee, mois DESC;