-- Requête de base
select
	datefacture,
	montantht
from inscription.facture f
order by datefacture;

-- Agrégation classique
select
	extract(year from datefacture) as annee,
	extract(month from datefacture) as mois,
	sum(montantht) as ca
from inscription.facture f
group by extract(year from datefacture), extract(month from datefacture)
order by annee, mois;

-- Fonction de fenêtrage
select
	sum(montantht) over (partition by extract(year from datefacture), 
	                     extract(month from datefacture)) as ca,
	*
from inscription.facture f
order by datefacture;
