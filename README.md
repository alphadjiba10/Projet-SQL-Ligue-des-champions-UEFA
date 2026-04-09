# ⚽ Projet SQL — Ligue des Champions UEFA (Phase de Groupes)

## Sujet et Contexte

La **Ligue des Champions UEFA** est la compétition de clubs la plus prestigieuse du football européen. Ce projet modélise la **phase de groupes** d'une édition simplifiée de la compétition.

Le problème que cette base résout est le suivant : comment organiser, stocker et analyser les données d'une compétition de football ? À partir d'un petit nombre de tables bien reliées, on peut retrouver les résultats des matchs, calculer les classements de chaque groupe, identifier les meilleurs buteurs, et bien plus encore.

**Périmètre volontairement réduit :**
- Une seule saison (2024–2025)
- Phase de groupes uniquement (pas de phase à élimination directe)
- 4 groupes de 4 équipes = **16 équipes**
- Chaque équipe joue 3 matchs (un contre chaque adversaire du groupe) = **24 matchs au total**

Ce choix de simplification permet de garder le projet **lisible et compréhensible** tout en offrant assez de données pour des requêtes SQL intéressantes.

## Utilisateurs Cibles

| Utilisateur | Usage |
|-------------|-------|
| **Organisateur (UEFA)** | Planifier les matchs, enregistrer les résultats et les événements |
| **Journaliste sportif** | Consulter les statistiques : meilleurs buteurs, classements, cartons |
| **Supporter** | Voir les résultats de son équipe, le classement de son groupe |

## Structure du Projet

```
projet_ucl/
├── README.md          ← Ce fichier
├── DESIGN.md          ← Conception et diagramme ER
├── schema.sql         ← Création des tables, index et vues
├── seed.sql           ← Peuplement de la base (INSERT INTO)
├── queries.sql        ← Requêtes de manipulation quotidienne
├── analysis.sql       ← Requêtes d'analyse et statistiques
└── ucl.db             ← Base de données SQLite générée
```

## Sources de Données

Les données sont **générées à la main** de manière réaliste :
- Les **noms de clubs et stades** sont inspirés de vrais clubs européens
- Les **noms de joueurs** sont fictifs mais réalistes
- Les **scores et événements** (buts, cartons) sont inventés de façon cohérente

Aucune API externe ni script Python n'est nécessaire. Le fichier `seed.sql` contient directement tous les `INSERT INTO`.

## Moteur de Base de Données

**SQLite** — choisi pour sa simplicité (pas de serveur à installer).

Pour recréer la base depuis zéro :
```bash
sqlite3 ucl.db < schema.sql
sqlite3 ucl.db < seed.sql
```

Pour tester les requêtes :
```bash
sqlite3 ucl.db < queries.sql
sqlite3 ucl.db < analysis.sql
```

## Technologies et Ressources

- [SQLite Documentation](https://www.sqlite.org/docs.html)
- [DB Browser for SQLite](https://sqlitebrowser.org/)
- [Mermaid — Diagrammes ER](https://mermaid.js.org/syntax/entityRelationshipDiagram.html)
