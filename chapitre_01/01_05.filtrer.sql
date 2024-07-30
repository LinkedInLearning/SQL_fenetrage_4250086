WITH t AS (
    SELECT
        facturecd,
        datefacture,
        montantht,
        ROW_NUMBER() OVER (
            PARTITION BY 
                EXTRACT(YEAR FROM datefacture),
                EXTRACT(MONTH FROM datefacture) 
            ORDER BY montantht DESC) as meilleures
    FROM inscription.facture f
)
SELECT *
FROM t 
WHERE t.meilleures <= 10;
