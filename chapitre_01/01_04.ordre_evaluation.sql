/* 6 */ SELECT
/*   */     EXTRACT(YEAR FROM datefacture) AS Annee, 
/*   */     EXTRACT(MONTH FROM datefacture) AS Mois,
/*   */     SUM(montantht) AS ca,
/*   */     ROW_NUMBER() OVER y AS rn
/* 1 */ FROM inscription.facture f
/* 2 */ WHERE datefacture IS NOT NULL
/* 3 */ GROUP BY EXTRACT(YEAR FROM datefacture), EXTRACT(MONTH FROM datefacture)
/* 4 */ HAVING COUNT(*) > 10
/* 5 */ WINDOW y AS (ORDER BY sum(montantht) DESC)
/* 7 */ ORDER BY rn, annee, mois;