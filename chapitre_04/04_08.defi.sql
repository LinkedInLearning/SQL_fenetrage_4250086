-- Y a-t-il des trous dans la numérotation des contactid ?
-- si oui, lesquels ?
SELECT 
    c.contactid,
    c.prenom,
    c.nom
FROM contact.contact c
ORDER BY c.contactid;

SELECT 
    COUNT(*),
    MAX(c.contactid)
FROM contact.contact c;