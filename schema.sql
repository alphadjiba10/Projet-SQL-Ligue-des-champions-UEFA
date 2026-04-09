-- ============================================================
-- schema.sql — Création du schéma de la base UCL
-- Projet : Ligue des Champions UEFA (Phase de Groupes)
-- Moteur : SQLite
-- ============================================================

-- Activation des clés étrangères (désactivées par défaut dans SQLite)
PRAGMA foreign_keys = ON;

-- ============================================================
-- TABLE : teams
-- Stocke les 16 clubs participant à la compétition.
-- Chaque équipe appartient à un groupe (A, B, C ou D).
-- ============================================================
CREATE TABLE "teams" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL UNIQUE,
    "country" TEXT NOT NULL,
    "stadium" TEXT NOT NULL,
    "coach" TEXT NOT NULL,
    "group_name" TEXT NOT NULL CHECK("group_name" IN ('A', 'B', 'C', 'D'))
);

-- ============================================================
-- TABLE : players
-- Stocke les joueurs inscrits pour la compétition.
-- Chaque joueur est rattaché à une équipe via team_id.
-- ============================================================
CREATE TABLE "players" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "position" TEXT NOT NULL CHECK("position" IN ('Gardien', 'Défenseur', 'Milieu', 'Attaquant')),
    "jersey_number" INTEGER NOT NULL,
    "team_id" INTEGER NOT NULL,
    FOREIGN KEY ("team_id") REFERENCES "teams"("id")
);

-- ============================================================
-- TABLE : matches
-- Stocke les 24 matchs de la phase de groupes.
-- Chaque match oppose une équipe à domicile et une à l'extérieur.
-- Le score est stocké directement pour faciliter les classements.
-- ============================================================
CREATE TABLE "matches" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "matchday" INTEGER NOT NULL CHECK("matchday" BETWEEN 1 AND 3),
    "match_date" TEXT NOT NULL,
    "home_team_id" INTEGER NOT NULL,
    "away_team_id" INTEGER NOT NULL,
    "home_score" INTEGER NOT NULL DEFAULT 0,
    "away_score" INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY ("home_team_id") REFERENCES "teams"("id"),
    FOREIGN KEY ("away_team_id") REFERENCES "teams"("id"),
    CHECK("home_team_id" != "away_team_id")
);

-- ============================================================
-- TABLE : goals
-- Stocke chaque but marqué pendant la compétition.
-- Permet de savoir qui a marqué, à quelle minute et comment.
-- ============================================================
CREATE TABLE "goals" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "match_id" INTEGER NOT NULL,
    "player_id" INTEGER NOT NULL,
    "minute" INTEGER NOT NULL CHECK("minute" BETWEEN 1 AND 90),
    "goal_type" TEXT NOT NULL DEFAULT 'normal' CHECK("goal_type" IN ('normal', 'penalty', 'csc')),
    FOREIGN KEY ("match_id") REFERENCES "matches"("id"),
    FOREIGN KEY ("player_id") REFERENCES "players"("id")
);

-- ============================================================
-- TABLE : cards
-- Stocke les cartons jaunes et rouges distribués.
-- Permet de suivre la discipline des joueurs.
-- ============================================================
CREATE TABLE "cards" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "match_id" INTEGER NOT NULL,
    "player_id" INTEGER NOT NULL,
    "card_type" TEXT NOT NULL CHECK("card_type" IN ('jaune', 'rouge')),
    "minute" INTEGER NOT NULL CHECK("minute" BETWEEN 1 AND 90),
    FOREIGN KEY ("match_id") REFERENCES "matches"("id"),
    FOREIGN KEY ("player_id") REFERENCES "players"("id")
);

-- ============================================================
-- INDEX : pour accélérer les requêtes fréquentes
-- ============================================================

-- Rechercher les joueurs d'une équipe
CREATE INDEX "idx_players_team" ON "players"("team_id");

-- Rechercher les matchs d'une journée ou d'une équipe
CREATE INDEX "idx_matches_matchday" ON "matches"("matchday");
CREATE INDEX "idx_matches_home" ON "matches"("home_team_id");
CREATE INDEX "idx_matches_away" ON "matches"("away_team_id");

-- Rechercher les buts d'un match ou d'un joueur
CREATE INDEX "idx_goals_match" ON "goals"("match_id");
CREATE INDEX "idx_goals_player" ON "goals"("player_id");

-- Rechercher les cartons d'un match ou d'un joueur
CREATE INDEX "idx_cards_match" ON "cards"("match_id");
CREATE INDEX "idx_cards_player" ON "cards"("player_id");

-- ============================================================
-- VUE : classement
-- Calcule automatiquement le classement de chaque groupe
-- avec les points, victoires, nuls, défaites, buts pour/contre.
-- Règle : 3 pts pour une victoire, 1 pt pour un nul, 0 pour une défaite.
-- ============================================================
CREATE VIEW "classement" AS
SELECT
    t."group_name" AS "groupe",
    t."name" AS "equipe",
    -- Nombre de matchs joués
    COUNT(*) AS "MJ",
    -- Victoires
    SUM(CASE
        WHEN (m."home_team_id" = t."id" AND m."home_score" > m."away_score")
          OR (m."away_team_id" = t."id" AND m."away_score" > m."home_score")
        THEN 1 ELSE 0
    END) AS "V",
    -- Nuls
    SUM(CASE
        WHEN m."home_score" = m."away_score" THEN 1 ELSE 0
    END) AS "N",
    -- Défaites
    SUM(CASE
        WHEN (m."home_team_id" = t."id" AND m."home_score" < m."away_score")
          OR (m."away_team_id" = t."id" AND m."away_score" < m."home_score")
        THEN 1 ELSE 0
    END) AS "D",
    -- Buts pour
    SUM(CASE
        WHEN m."home_team_id" = t."id" THEN m."home_score"
        ELSE m."away_score"
    END) AS "BP",
    -- Buts contre
    SUM(CASE
        WHEN m."home_team_id" = t."id" THEN m."away_score"
        ELSE m."home_score"
    END) AS "BC",
    -- Différence de buts
    SUM(CASE
        WHEN m."home_team_id" = t."id" THEN m."home_score" - m."away_score"
        ELSE m."away_score" - m."home_score"
    END) AS "DB",
    -- Points (3V + 1N)
    SUM(CASE
        WHEN (m."home_team_id" = t."id" AND m."home_score" > m."away_score")
          OR (m."away_team_id" = t."id" AND m."away_score" > m."home_score")
        THEN 3
        WHEN m."home_score" = m."away_score" THEN 1
        ELSE 0
    END) AS "Pts"
FROM "teams" t
JOIN "matches" m ON t."id" = m."home_team_id" OR t."id" = m."away_team_id"
GROUP BY t."id"
ORDER BY t."group_name", "Pts" DESC, "DB" DESC, "BP" DESC;
