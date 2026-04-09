# ⚽ Projet Final SQL — Ligue des Champions UEFA (Phase de Groupes)

## Sujet et Contexte

La **Ligue des Champions UEFA** est la compétition de clubs la plus prestigieuse du football européen. Ce projet modélise la **phase de groupes** d'une édition simplifiée de la compétition.

Le problème que cette base résout est le suivant : comment organiser, stocker et analyser les données d'une compétition de football ? À partir de 5 tables bien reliées, on peut retrouver les résultats des matchs, calculer les classements de chaque groupe, identifier les meilleurs buteurs, et suivre la discipline des joueurs.

**Périmètre :**

- Une seule saison (2024–2025)
- Phase de groupes uniquement (pas de phase à élimination directe)
- 4 groupes de 4 équipes = **16 équipes** issues de **8 pays** européens
- Chaque groupe joue 3 journées = **24 matchs** au total
- **160 joueurs** (10 par équipe), **62 buts** et **34 cartons** enregistrés

## Utilisateurs Cibles

| Utilisateur | Usage |
|-------------|-------|
| **Organisateur (UEFA)** | Planifier les matchs, enregistrer les résultats et les événements, vérifier les suspensions |
| **Journaliste sportif** | Consulter les classements des buteurs, les statistiques par équipe, les analyses par pays |
| **Supporter** | Voir les résultats, le classement de son groupe, le déroulé minute par minute d'un match |

## Composition des Groupes

| Groupe A | Groupe B | Groupe C | Groupe D |
|----------|----------|----------|----------|
| Real Madrid | FC Barcelone | Manchester City | Liverpool |
| Paris Saint-Germain | Bayern Munich | Inter Milan | Juventus Turin |
| Ajax Amsterdam | FC Porto | Borussia Dortmund | Atlético Madrid |
| Celtic Glasgow | Feyenoord Rotterdam | Benfica Lisbonne | AC Milan |

## Structure du Projet

```
projet_ucl/
├── README.md          ← Ce fichier (présentation du projet)
├── DESIGN.md          ← Conception : entités, relations, diagramme ER, choix et limitations
├── schema.sql         ← Création des 5 tables, 8 index et 1 vue (classement)
├── seed.sql           ← Peuplement : 16 équipes, 160 joueurs, 24 matchs, 62 buts, 34 cartons
├── queries.sql        ← 13 requêtes de manipulation (4 INSERT, 5 UPDATE, 4 DELETE)
├── analysis.sql       ← 21 requêtes d'analyse (JOIN, GROUP BY, HAVING, CASE, sous-requêtes…)
└── ucl.db             ← Base de données SQLite générée
```

## Sources de Données

Les données utilisent des **informations réelles** pour les clubs :

| Donnée | Source |
|--------|--------|
| Noms des clubs, stades, entraîneurs | Inspirés de la saison réelle 2024-2025 de l'UEFA Champions League |
| Noms des joueurs | Joueurs réels des effectifs 2024-2025 |
| Scores et événements (buts, cartons) | **Fictifs**, inventés de manière réaliste et cohérente |
| Format (4 groupes de 4) | **Simplifié** par rapport au vrai format 2024-2025 (qui utilise une ligue unique de 36 équipes) |

Toutes les données sont contenues dans le fichier `seed.sql` sous forme d'`INSERT INTO`. Aucune API externe ni script Python n'est nécessaire.

## Moteur de Base de Données

**SQLite** — choisi pour sa simplicité (pas de serveur à installer).

### Recréer la base depuis zéro

```bash
sqlite3 ucl.db < schema.sql
sqlite3 ucl.db < seed.sql
```

### Tester les requêtes de manipulation

```bash
sqlite3 ucl.db < queries.sql
```

### Lancer les requêtes d'analyse

```bash
sqlite3 -header -column ucl.db < analysis.sql
```

## Fonctionnalités SQL Utilisées

Le projet mobilise les fonctionnalités suivantes du langage SQL :

| Fonctionnalité | Où elle est utilisée |
|----------------|---------------------|
| `CREATE TABLE` avec contraintes (`PK`, `FK`, `NOT NULL`, `CHECK`) | `schema.sql` |
| `CREATE INDEX` (8 index sur les clés étrangères) | `schema.sql` |
| `CREATE VIEW` (classement dynamique des groupes) | `schema.sql` |
| `INSERT INTO`, `UPDATE`, `DELETE FROM` | `queries.sql` |
| `JOIN` (simple, double, triple, `LEFT JOIN`) | `analysis.sql` |
| `GROUP BY` + `HAVING` | `analysis.sql` |
| `CASE` (catégories, profils, tranches de temps) | `schema.sql`, `analysis.sql` |
| Sous-requêtes (dans `SELECT`, `WHERE`) | `analysis.sql` |
| Fonctions d'agrégation (`COUNT`, `SUM`, `AVG`, `ROUND`) | `analysis.sql` |

## Technologies et Ressources

- [SQLite Documentation](https://www.sqlite.org/docs.html)
- [DB Browser for SQLite](https://sqlitebrowser.org/)
- [Mermaid — Diagrammes ER](https://mermaid.js.org/syntax/entityRelationshipDiagram.html)
