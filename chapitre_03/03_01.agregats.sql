SELECT 
    c.contactid ,
    c.nom,
    c.prenom,
    COUNT(*) OVER (PARTITION BY nom) AS noms,
    COUNT(*) OVER (PARTITION BY prenom) AS prenoms,
    MIN(contactid) OVER (PARTITION BY nom),
    COUNT(*) OVER ()
FROM contact.contact c 
ORDER BY noms DESC;
