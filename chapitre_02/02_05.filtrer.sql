WITH t AS (
    SELECT 
        c.contactid,
        MIN(c.prenom) AS prenom,
        MIN(c.nom) AS nom,
        SUM(f.montantht) AS ca,
        NTILE(10) OVER (ORDER BY SUM(f.montantht) DESC) AS groupe
    FROM contact.contact c
    JOIN inscription.inscription i 
        ON c.contactid = i.contactid
    JOIN inscription.inscriptionfacture inf
        ON i.inscriptionid = inf.inscriptionid
    JOIN inscription.facture f 
        ON f.facturecd = inf.facturecd 
    GROUP BY c.contactid
)
SELECT contactid, prenom, nom, ca
FROM t
WHERE groupe = 1;
