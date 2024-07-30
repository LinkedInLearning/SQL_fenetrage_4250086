SELECT
	datefacture,
	montantht,
	row_number() over (partition by extract(year from datefacture) order by facturecd) as rn
FROM inscription.facture f
ORDER BY datefacture;
