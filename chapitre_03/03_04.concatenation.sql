SELECT c.nom, c.prenom,
    STRING_AGG(c.prenom, ', ') OVER (PARTITION BY c.nom)
FROM contact.contact c;

SELECT c.nom,
    STRING_AGG(c.prenom, ', ' ORDER BY c.prenom)
    --STRING_AGG(c.prenom, ', ') WITHIN GROUP (ORDER BY c.prenom),
FROM contact.contact c
GROUP BY c.nom
ORDER BY c.nom;
