SELECT *
FROM inscription.facture f;

SELECT 
    COUNT(*),
    COUNT(remise)
FROM inscription.facture f;

SELECT 
    facturecd,
    remise,
    COUNT(*) OVER (PARTITION BY remise),
    COUNT(remise) OVER (PARTITION BY remise)
FROM inscription.facture f
ORDER BY remise DESC;

SELECT facturecd,
    remise,
    ROW_NUMBER() OVER (ORDER BY remise NULLS LAST)
FROM inscription.facture f;


SELECT facturecd,
    ROW_NUMBER() OVER ()
FROM inscription.facture f;
