WITH cte AS (
    SELECT 
        c.contactid,
        c.prenom,
        c.nom,
        LAG(c.contactid) OVER (ORDER BY c.contactid) AS l
    FROM contact.contact c
)
SELECT 
    contactid - 1 AS manquant
FROM cte
WHERE l <> contactid - 1
ORDER BY contactid;

SELECT *
FROM contact.contact c 
WHERE contactid IN (20084, 20087);