-- affichez les quatre meilleurs montants facturés par mois
WITH t AS (
    SELECT 
        facturecd,
        datefacture,
        montantht,
        DENSE_RANK() OVER (
            PARTITION BY EXTRACT(YEAR FROM datefacture), EXTRACT(MONTH FROM datefacture)
            ORDER BY montantht DESC
            ) AS r
    FROM inscription.facture f
    WHERE datefacture IS NOT NULL
)
SELECT
    facturecd,
    datefacture,
    montantht
FROM t
WHERE r <= 4
ORDER BY datefacture DESC;