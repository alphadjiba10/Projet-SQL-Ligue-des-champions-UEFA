-- ============================================================
-- analysis.sql — Requêtes d'analyse et statistiques
-- Requêtes complexes utilisant JOIN, GROUP BY, HAVING,
-- sous-requêtes, CASE, agrégations, etc.
-- ============================================================

-- ============================================================
-- 1. CLASSEMENTS
-- ============================================================

-- 1.1 Afficher le classement complet de tous les groupes
-- Utilise la vue "classement" créée dans schema.sql
-- Fonctionnalités : VIEW, CASE, SUM, GROUP BY, ORDER BY
SELECT * FROM "classement";

-- 1.2 Classement d'un groupe spécifique (ex: Groupe B)
-- Cas d'usage : un supporter veut voir le classement de son groupe
SELECT "equipe", "MJ", "V", "N", "D", "BP", "BC", "DB", "Pts"
FROM "classement"
WHERE "groupe" = 'B';

-- 1.3 Identifier les équipes qualifiées (les 2 premières de chaque groupe)
-- Fonctionnalités : sous-requête, ROW_NUMBER (simulé), GROUP BY
-- On sélectionne les équipes qui ont le plus de points dans chaque groupe
SELECT "groupe", "equipe", "Pts", "DB"
FROM "classement"
WHERE ("groupe", "Pts", "DB") IN (
    SELECT "groupe",
           MAX("Pts"),
           MAX("DB")
    FROM "classement"
    GROUP BY "groupe"
)
ORDER BY "groupe";

-- ============================================================
-- 2. STATISTIQUES DES BUTEURS
-- ============================================================

-- 2.1 Classement des buteurs de la compétition
-- Fonctionnalités : JOIN (3 tables), GROUP BY, ORDER BY, COUNT
-- Cas d'usage : un journaliste veut le tableau des meilleurs buteurs
SELECT
    p."first_name" || ' ' || p."last_name" AS "Joueur",
    t."name" AS "Équipe",
    p."position" AS "Poste",
    COUNT(*) AS "Buts"
FROM "goals" g
JOIN "players" p ON g."player_id" = p."id"
JOIN "teams" t ON p."team_id" = t."id"
GROUP BY p."id"
ORDER BY "Buts" DESC, p."last_name" ASC;

-- 2.2 Buteurs avec 3 buts ou plus (le club des top scorers)
-- Fonctionnalités : HAVING pour filtrer après agrégation
SELECT
    p."first_name" || ' ' || p."last_name" AS "Joueur",
    t."name" AS "Équipe",
    COUNT(*) AS "Buts"
FROM "goals" g
JOIN "players" p ON g."player_id" = p."id"
JOIN "teams" t ON p."team_id" = t."id"
GROUP BY p."id"
HAVING COUNT(*) >= 3
ORDER BY "Buts" DESC;

-- 2.3 Répartition des buts par type (normal, penalty, csc)
-- Fonctionnalités : GROUP BY, COUNT, pourcentages
SELECT
    "goal_type" AS "Type de but",
    COUNT(*) AS "Nombre",
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM "goals"), 1) AS "Pourcentage (%)"
FROM "goals"
GROUP BY "goal_type"
ORDER BY "Nombre" DESC;

-- 2.4 Nombre de buts par équipe (attaque totale)
-- Fonctionnalités : JOIN, sous-requête avec UNION, GROUP BY
-- On compte les buts marqués par les joueurs de chaque équipe
SELECT
    t."name" AS "Équipe",
    COUNT(g."id") AS "Buts marqués"
FROM "teams" t
JOIN "players" p ON p."team_id" = t."id"
JOIN "goals" g ON g."player_id" = p."id"
WHERE g."goal_type" != 'csc'  -- On exclut les CSC (buts pour l'adversaire)
GROUP BY t."id"
ORDER BY "Buts marqués" DESC;

-- ============================================================
-- 3. STATISTIQUES DES CARTONS (DISCIPLINE)
-- ============================================================

-- 3.1 Joueurs les plus sanctionnés
-- Fonctionnalités : JOIN, GROUP BY, ORDER BY
-- Cas d'usage : l'UEFA vérifie quels joueurs risquent une suspension
SELECT
    p."first_name" || ' ' || p."last_name" AS "Joueur",
    t."name" AS "Équipe",
    SUM(CASE WHEN c."card_type" = 'jaune' THEN 1 ELSE 0 END) AS "Jaunes",
    SUM(CASE WHEN c."card_type" = 'rouge' THEN 1 ELSE 0 END) AS "Rouges",
    COUNT(*) AS "Total cartons"
FROM "cards" c
JOIN "players" p ON c."player_id" = p."id"
JOIN "teams" t ON p."team_id" = t."id"
GROUP BY p."id"
ORDER BY "Total cartons" DESC, "Rouges" DESC
LIMIT 10;

-- 3.2 Équipes les plus indisciplinées
-- Fonctionnalités : JOIN, CASE, SUM, GROUP BY
-- Cas d'usage : classement fair-play de l'UEFA
SELECT
    t."name" AS "Équipe",
    SUM(CASE WHEN c."card_type" = 'jaune' THEN 1 ELSE 0 END) AS "Jaunes",
    SUM(CASE WHEN c."card_type" = 'rouge' THEN 1 ELSE 0 END) AS "Rouges",
    SUM(CASE WHEN c."card_type" = 'jaune' THEN 1 ELSE 3 END) AS "Points disciplinaires"
FROM "cards" c
JOIN "players" p ON c."player_id" = p."id"
JOIN "teams" t ON p."team_id" = t."id"
GROUP BY t."id"
ORDER BY "Points disciplinaires" DESC;

-- 3.3 Joueurs qui ont reçu un carton rouge (suspendus pour le prochain match)
-- Fonctionnalités : JOIN, WHERE
-- Cas d'usage : l'UEFA vérifie les joueurs suspendus
SELECT
    p."first_name" || ' ' || p."last_name" AS "Joueur",
    t."name" AS "Équipe",
    c."minute" AS "Minute",
    m."match_date" AS "Date du match"
FROM "cards" c
JOIN "players" p ON c."player_id" = p."id"
JOIN "teams" t ON p."team_id" = t."id"
JOIN "matches" m ON c."match_id" = m."id"
WHERE c."card_type" = 'rouge'
ORDER BY m."match_date";

-- ============================================================
-- 4. STATISTIQUES DES MATCHS
-- ============================================================

-- 4.1 Résultats détaillés de tous les matchs
-- Fonctionnalités : double JOIN sur la même table (teams), concaténation
-- Cas d'usage : un supporter consulte les résultats
SELECT
    m."match_date" AS "Date",
    'J' || m."matchday" AS "Journée",
    th."name" AS "Domicile",
    m."home_score" || ' - ' || m."away_score" AS "Score",
    ta."name" AS "Extérieur",
    th."group_name" AS "Groupe"
FROM "matches" m
JOIN "teams" th ON m."home_team_id" = th."id"
JOIN "teams" ta ON m."away_team_id" = ta."id"
ORDER BY m."match_date", th."group_name";

-- 4.2 Le match avec le plus de buts
-- Fonctionnalités : expression calculée, ORDER BY, LIMIT
SELECT
    th."name" AS "Domicile",
    m."home_score" || ' - ' || m."away_score" AS "Score",
    ta."name" AS "Extérieur",
    (m."home_score" + m."away_score") AS "Total buts",
    m."match_date" AS "Date"
FROM "matches" m
JOIN "teams" th ON m."home_team_id" = th."id"
JOIN "teams" ta ON m."away_team_id" = ta."id"
ORDER BY "Total buts" DESC
LIMIT 1;

-- 4.3 Nombre de victoires à domicile, à l'extérieur et de matchs nuls
-- Fonctionnalités : CASE, SUM, sous-requête
-- Cas d'usage : statistique globale de la compétition
SELECT
    SUM(CASE WHEN "home_score" > "away_score" THEN 1 ELSE 0 END) AS "Victoires domicile",
    SUM(CASE WHEN "home_score" = "away_score" THEN 1 ELSE 0 END) AS "Matchs nuls",
    SUM(CASE WHEN "home_score" < "away_score" THEN 1 ELSE 0 END) AS "Victoires extérieur",
    COUNT(*) AS "Total matchs"
FROM "matches";

-- 4.4 Score moyen par match
-- Fonctionnalités : AVG, ROUND
SELECT
    ROUND(AVG("home_score" + "away_score"), 2) AS "Buts par match (moyenne)",
    ROUND(AVG("home_score"), 2) AS "Buts domicile (moyenne)",
    ROUND(AVG("away_score"), 2) AS "Buts extérieur (moyenne)"
FROM "matches";

-- ============================================================
-- 5. ANALYSES CROISÉES AVANCÉES
-- ============================================================

-- 5.1 Fiche complète d'une équipe (ex: Real Madrid)
-- Fonctionnalités : sous-requêtes multiples, CASE
-- Cas d'usage : un journaliste prépare un article sur le Real Madrid
SELECT
    t."name" AS "Équipe",
    t."country" AS "Pays",
    t."stadium" AS "Stade",
    t."coach" AS "Entraîneur",
    t."group_name" AS "Groupe",
    (SELECT COUNT(*) FROM "players" WHERE "team_id" = t."id") AS "Nb joueurs",
    (SELECT "Pts" FROM "classement" WHERE "equipe" = t."name") AS "Points",
    (SELECT COUNT(*) FROM "goals" g
     JOIN "players" p ON g."player_id" = p."id"
     WHERE p."team_id" = t."id" AND g."goal_type" != 'csc') AS "Buts marqués",
    (SELECT COUNT(*) FROM "cards" c
     JOIN "players" p ON c."player_id" = p."id"
     WHERE p."team_id" = t."id") AS "Cartons reçus"
FROM "teams" t
WHERE t."name" = 'Real Madrid';

-- 5.2 Historique des buts d'un match précis (ex: Barcelone 2-2 Bayern)
-- Fonctionnalités : JOIN multiple, ORDER BY
-- Cas d'usage : un supporter veut revoir le déroulé du match
SELECT
    g."minute" || '''' AS "Minute",
    p."first_name" || ' ' || p."last_name" AS "Buteur",
    t."name" AS "Équipe du buteur",
    g."goal_type" AS "Type"
FROM "goals" g
JOIN "players" p ON g."player_id" = p."id"
JOIN "teams" t ON p."team_id" = t."id"
WHERE g."match_id" = 7  -- Match Barcelone vs Bayern
ORDER BY g."minute";

-- 5.3 Joueurs qui n'ont marqué aucun but (pour les attaquants uniquement)
-- Fonctionnalités : LEFT JOIN, IS NULL, WHERE
-- Cas d'usage : identifier les attaquants en manque d'efficacité
SELECT
    p."first_name" || ' ' || p."last_name" AS "Joueur",
    t."name" AS "Équipe"
FROM "players" p
JOIN "teams" t ON p."team_id" = t."id"
LEFT JOIN "goals" g ON g."player_id" = p."id"
WHERE p."position" = 'Attaquant' AND g."id" IS NULL
ORDER BY t."name", p."last_name";

-- 5.4 Statistiques par pays (quel pays produit les meilleures équipes ?)
-- Fonctionnalités : JOIN sur vue, GROUP BY, agrégation
-- Cas d'usage : analyse géographique de la compétition
SELECT
    t."country" AS "Pays",
    COUNT(*) AS "Nb équipes",
    SUM(c."Pts") AS "Total points",
    ROUND(AVG(c."Pts"), 1) AS "Moyenne points",
    SUM(c."BP") AS "Total buts"
FROM "teams" t
JOIN "classement" c ON t."name" = c."equipe"
GROUP BY t."country"
ORDER BY "Total points" DESC;

-- 5.5 Buts marqués par tranche de temps (quand les buts tombent-ils ?)
-- Fonctionnalités : CASE pour créer des catégories, GROUP BY
-- Cas d'usage : analyse tactique — à quel moment les équipes sont vulnérables
SELECT
    CASE
        WHEN "minute" BETWEEN 1 AND 15 THEN '01-15 min'
        WHEN "minute" BETWEEN 16 AND 30 THEN '16-30 min'
        WHEN "minute" BETWEEN 31 AND 45 THEN '31-45 min'
        WHEN "minute" BETWEEN 46 AND 60 THEN '46-60 min'
        WHEN "minute" BETWEEN 61 AND 75 THEN '61-75 min'
        WHEN "minute" BETWEEN 76 AND 90 THEN '76-90 min'
    END AS "Période",
    COUNT(*) AS "Nombre de buts",
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM "goals"), 1) AS "% du total"
FROM "goals"
GROUP BY "Période"
ORDER BY MIN("minute");

-- 5.6 Équipes invaincues (aucune défaite)
-- Fonctionnalités : sous-requête avec NOT EXISTS, ou filtrage via la vue
-- Cas d'usage : quelles équipes n'ont jamais perdu ?
SELECT "equipe" AS "Équipe", "Pts", "V", "N", "D"
FROM "classement"
WHERE "D" = 0
ORDER BY "Pts" DESC;

-- 5.7 Comparaison attaque/défense de chaque équipe
-- Fonctionnalités : vue, colonnes calculées, CASE pour évaluation
-- Cas d'usage : profil offensif vs défensif de chaque club
SELECT
    "equipe" AS "Équipe",
    "BP" AS "Buts pour",
    "BC" AS "Buts contre",
    "DB" AS "Différence",
    CASE
        WHEN "BP" > "BC" THEN 'Offensive'
        WHEN "BP" < "BC" THEN 'Défensive'
        ELSE 'Équilibrée'
    END AS "Profil"
FROM "classement"
ORDER BY "DB" DESC;
