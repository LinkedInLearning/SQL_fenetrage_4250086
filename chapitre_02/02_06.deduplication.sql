SELECT *
FROM contact.prospect
ORDER BY email;

WITH t AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY email, nom, prenom ORDER BY dateajout DESC) AS rn
    FROM contact.prospect
)
SELECT *
FROM t
WHERE rn > 1;


BEGIN TRANSACTION;

WITH t AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY email ORDER BY dateajout DESC) AS rn
    FROM contact.prospect
)
DELETE
FROM contact.prospect
USING t 
WHERE contact.prospect.email = t.email 
AND contact.prospect.nom = t.nom
AND contact.prospect.prenom = t.prenom
AND contact.prospect.dateajout = t.dateajout
AND rn > 1;

SELECT *
FROM contact.prospect
ORDER BY email;

ROLLBACK;