# SQL : Les fonctions de fenêtrage

Ce dossier Repository est lié au cours `SQL : Les fonctions de fenêtrage`. Le cours entier est disponible sur [LinkedIn Learning][lil-course-url].

![Nom final de la formation][lil-thumbnail-url] 

Rudi Bruchez vous propose de suivre cette formation sur les fonctions de fenêtrage SQL. Après avoir suivi les prérequis et préparé l'environnement, vous apprendrez les fonctions de fenêtrage, leur syntaxe de base, l'utilisation de la clause WINDOW, et la gestion des NULL. Vous aborderez également les fonctions de ranking et de distribution, avec des exercices pratiques pour trouver des positions dans un ensemble et dédupliquer des données. Vous analyserez des agrégats, utiliserez des fonctions de fenêtrage sur des requêtes agrégées, et résoudrez des problèmes courants. Enfin, vous apprendrez à définir et utiliser le cadrage dans les fenêtres SQL.		

## Instructions

Ce dossier Repository contient des dossiers pour chacun des chapitres de la formation. Dans ces dossiers, vous trouverez simplement les fichiers `.sql` numérotés selon la numéro de la vidéo dans le chapitre. 

## Installation

1. Pour utiliser ces fichiers d’exercice, vous avez besoin de : 
   - [PostgreSQL](https://www.postgresql.org/download/) 
   - [DBeaver](https://dbeaver.io/) ou tout autre outil de requête qui se connecte à PostgreSQL
2. Clonez ce dossier Repository sur votre machine locale (Mac), CMD (Windows), ou sur un outil GUI tel que SourceTree
   - `git clone https://github.com/LinkedInLearning/SQL_fenetrage_4250086.git`
4. Pour restaurer la sauvegarde de la base de données PachadataFormation dans PostgreSQL :
   - Créez la base de données au préalable à partir du `template0`, par exemple avec la commande suivante : `createdb -T template0 pachadataformation`
   - Utilisez `psql` pour restaurer la base : `psql pachadataformation < pachadataformation.pgdump`
   - Vous pouvez aussi restaurer la base dans DBeaver, avec la fonctionnalité d'importation

### Formateur

**Rudi Bruchez** 

 Retrouvez mes autres formations sur [LinkedIn Learning][lil-URL-trainer].

[0]: # (Replace these placeholder URLs with actual course URLs)
[lil-course-url]: https://www.linkedin.com/learning/sql-les-fonctions-de-fenetrage
[lil-thumbnail-url]: https://media.licdn.com/dms/image/v2/D4E0DAQHRQzo82bWjrw/learning-public-crop_675_1200/learning-public-crop_675_1200/0/1727365732696?e=2147483647&v=beta&t=DMN8Z4XF011I2pqdH6PPTJGlpd41_4EzxnnnO1ZUphU
[lil-URL-trainer]: https://www.linkedin.com/learning/instructors/rudi-bruchez

[1]: # (End of FR-Instruction ###############################################################################################)

