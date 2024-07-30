SELECT 
    c.contactid,
    c.nom, 
    c.prenom,
    COUNT(*) AS inscriptions,
    DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS rang
FROM contact.contact c 
JOIN inscription.inscription i ON c.contactid = i.contactid 
GROUP BY c.contactid, c.nom, c.prenom
ORDER BY inscriptions DESC