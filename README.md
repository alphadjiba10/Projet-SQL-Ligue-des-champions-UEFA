# Projet SQL — "Ligue des Champions UEFA" : Gestion de Compétition Européenne

## 1. Sujet et Contexte
Cette base de données relationnelle est conçue pour gérer l'intégralité de la **Ligue des Champions UEFA**. 
Le système ne se contente pas de planifier les rencontres européennes ; il gère les effectifs des grands clubs, l'affectation des stades à travers l'Europe, les scores finaux, ainsi que les événements détaillés de chaque match (buts, cartons jaunes, cartons rouges). Cette granularité permet de générer des classements dynamiques pour la phase de groupes et des statistiques poussées sur les joueurs et les équipes.

## 2. Utilisateurs Cibles
Cette base de données est destinée à :
* **L'UEFA (Admins) :** Pour planifier les matchs, assigner les arbitres/stades et vérifier la validité des effectifs européens.
* **Les journalistes et analystes sportifs :** Pour extraire des statistiques complexes (meilleurs buteurs de la compétition, équipes avec la meilleure attaque, affluences par pays).
* **Les supporters (via une application web) :** Pour consulter les résultats, les classements de poules et l'historique des événements de match en temps réel.

## 3. Sources de Données
Afin d'obtenir un jeu de données réaliste, les données seront générées de manière synthétique via un script Python utilisant la librairie `Faker`. Des listes personnalisées seront intégrées pour utiliser de vrais noms de clubs européens (ex: FC Barcelone, Bayern Munich, Manchester City), de vrais stades (Camp Nou, Allianz Arena) et des joueurs existants. Les scores et événements seront générés aléatoirement mais de façon logique. Un fichier `seed.sql` sera généré pour le peuplement de la base.
