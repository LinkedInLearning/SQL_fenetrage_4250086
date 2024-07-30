SELECT nom, prenom,
    -- à combien de lignes sommes-nous 
    -- de la prochaine initiale de nom de famille ?
    COUNT(*) OVER w -
    ROW_NUMBER() OVER (w ORDER BY nom, prenom) AS il_reste
FROM contact.contact c
WINDOW w AS (PARTITION BY LEFT(nom, 1))
ORDER BY nom, prenom;