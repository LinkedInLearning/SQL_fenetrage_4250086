SELECT 
    facturecd,
    datefacture,
    montantht,
    RANK() OVER (ORDER BY montantht),
    1.0 * (RANK() OVER (ORDER BY montantht) - 1) / (COUNT(*) OVER () - 1),
    PERCENT_RANK() OVER (ORDER BY montantht),
    CUME_DIST() OVER (ORDER BY montantht)
FROM inscription.facture f
WHERE f.datefacture BETWEEN '2011-01-01' AND '2011-01-10';

