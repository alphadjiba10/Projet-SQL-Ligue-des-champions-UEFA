-- ============================================================
-- queries.sql — Requêtes de manipulation quotidienne
-- Simule l'utilisation réelle de la base par les admins UEFA
-- Opérations : INSERT, UPDATE, DELETE
-- ============================================================

-- ============================================================
-- 1. INSERTIONS — Ajouter de nouvelles données
-- ============================================================

-- 1.1 Ajouter un nouveau joueur dans l'effectif du Real Madrid
-- Cas d'usage : un club recrute un joueur pendant la fenêtre de transfert
INSERT INTO "players" ("first_name", "last_name", "position", "jersey_number", "team_id")
VALUES ('Endrick', 'Felipe', 'Attaquant', 16, 1);

-- 1.2 Enregistrer un nouveau match (Journée 1, match ajouté tardivement)
-- Cas d'usage : un match reporté est finalement programmé
INSERT INTO "matches" ("matchday", "match_date", "home_team_id", "away_team_id", "home_score", "away_score")
VALUES (1, '2024-09-19', 1, 3, 0, 0);

-- 1.3 Enregistrer un but dans un match existant
-- Cas d'usage : l'opérateur saisit les événements en temps réel pendant un match
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type")
VALUES (1, 8, 90, 'normal');  -- Vinícius marque à la 90e minute du match 1

-- 1.4 Enregistrer un carton jaune
-- Cas d'usage : l'arbitre donne un carton, l'opérateur le saisit
INSERT INTO "cards" ("match_id", "player_id", "card_type", "minute")
VALUES (1, 5, 'jaune', 45);  -- Modric reçoit un jaune à la 45e minute

-- ============================================================
-- 2. MISES À JOUR — Modifier des données existantes
-- ============================================================

-- 2.1 Corriger le score d'un match après vérification VAR
-- Cas d'usage : un but est annulé par la VAR après la saisie initiale
UPDATE "matches"
SET "home_score" = 1
WHERE "id" = 1;

-- 2.2 Changer l'entraîneur d'une équipe en cours de compétition
-- Cas d'usage : un club limoge son entraîneur après de mauvais résultats
UPDATE "teams"
SET "coach" = 'Zinédine Zidane'
WHERE "name" = 'Bayern Munich';

-- 2.3 Corriger le type d'un but (initialement noté "normal", finalement c'était un penalty)
-- Cas d'usage : erreur de saisie corrigée après relecture
UPDATE "goals"
SET "goal_type" = 'penalty'
WHERE "match_id" = 1 AND "player_id" = 10 AND "minute" = 23;

-- 2.4 Transformer un carton jaune en carton rouge
-- Cas d'usage : l'arbitre a en fait donné un rouge direct (erreur de saisie)
UPDATE "cards"
SET "card_type" = 'rouge'
WHERE "match_id" = 5 AND "player_id" = 31 AND "card_type" = 'jaune';

-- 2.5 Modifier la date d'un match reporté
-- Cas d'usage : un match est reprogrammé à cause de la météo
UPDATE "matches"
SET "match_date" = '2024-10-25'
WHERE "id" = 6;

-- ============================================================
-- 3. SUPPRESSIONS — Retirer des données
-- ============================================================

-- 3.1 Supprimer un but annulé après révision vidéo
-- Cas d'usage : le VAR annule un but pour hors-jeu
DELETE FROM "goals"
WHERE "match_id" = 1 AND "player_id" = 8 AND "minute" = 90;

-- 3.2 Supprimer un joueur retiré de la liste UEFA (blessure longue durée)
-- Cas d'usage : un joueur se blesse gravement et est retiré de l'effectif
-- On doit d'abord vérifier qu'il n'a pas de buts ou cartons enregistrés
DELETE FROM "players"
WHERE "first_name" = 'Endrick' AND "last_name" = 'Felipe'
AND "id" NOT IN (SELECT "player_id" FROM "goals")
AND "id" NOT IN (SELECT "player_id" FROM "cards");

-- 3.3 Annuler un carton après réclamation acceptée par l'UEFA
-- Cas d'usage : le club fait appel et le carton est retiré
DELETE FROM "cards"
WHERE "match_id" = 1 AND "player_id" = 5 AND "minute" = 45;

-- 3.4 Supprimer un match annulé définitivement
-- Cas d'usage : un match est annulé et ne sera pas rejoué
-- On supprime d'abord les buts et cartons liés, puis le match
DELETE FROM "goals" WHERE "match_id" = 25;
DELETE FROM "cards" WHERE "match_id" = 25;
DELETE FROM "matches" WHERE "id" = 25;
