-- affichez les quatre meilleurs montants facturés par mois
SELECT 
    facturecd,
    datefacture,
    montantht
FROM inscription.facture f
WHERE datefacture IS NOT NULL
ORDER BY datefacture DESC;
