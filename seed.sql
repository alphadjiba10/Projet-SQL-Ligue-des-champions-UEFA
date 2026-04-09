-- ============================================================
-- seed.sql — Peuplement de la base UCL
-- Données réalistes : vrais clubs, stades et entraîneurs
-- Joueurs et résultats fictifs mais cohérents
-- ============================================================

-- ============================================================
-- ÉQUIPES (16 clubs réels répartis en 4 groupes)
-- Source : noms, stades et entraîneurs inspirés de la saison 2024-2025
-- ============================================================

-- Groupe A
INSERT INTO "teams" ("name", "country", "stadium", "coach", "group_name") VALUES
('Real Madrid', 'Espagne', 'Santiago Bernabéu', 'Carlo Ancelotti', 'A'),
('Paris Saint-Germain', 'France', 'Parc des Princes', 'Luis Enrique', 'A'),
('Ajax Amsterdam', 'Pays-Bas', 'Johan Cruyff Arena', 'Francesco Farioli', 'A'),
('Celtic Glasgow', 'Écosse', 'Celtic Park', 'Brendan Rodgers', 'A');

-- Groupe B
INSERT INTO "teams" ("name", "country", "stadium", "coach", "group_name") VALUES
('FC Barcelone', 'Espagne', 'Estadi Olímpic', 'Hansi Flick', 'B'),
('Bayern Munich', 'Allemagne', 'Allianz Arena', 'Vincent Kompany', 'B'),
('FC Porto', 'Portugal', 'Estádio do Dragão', 'Vítor Bruno', 'B'),
('Feyenoord Rotterdam', 'Pays-Bas', 'De Kuip', 'Brian Priske', 'B');

-- Groupe C
INSERT INTO "teams" ("name", "country", "stadium", "coach", "group_name") VALUES
('Manchester City', 'Angleterre', 'Etihad Stadium', 'Pep Guardiola', 'C'),
('Inter Milan', 'Italie', 'San Siro', 'Simone Inzaghi', 'C'),
('Borussia Dortmund', 'Allemagne', 'Signal Iduna Park', 'Nuri Sahin', 'C'),
('Benfica Lisbonne', 'Portugal', 'Estádio da Luz', 'Bruno Lage', 'C');

-- Groupe D
INSERT INTO "teams" ("name", "country", "stadium", "coach", "group_name") VALUES
('Liverpool', 'Angleterre', 'Anfield', 'Arne Slot', 'D'),
('Juventus Turin', 'Italie', 'Allianz Stadium', 'Thiago Motta', 'D'),
('Atlético Madrid', 'Espagne', 'Cívitas Metropolitano', 'Diego Simeone', 'D'),
('AC Milan', 'Italie', 'San Siro', 'Paulo Fonseca', 'D');

-- ============================================================
-- JOUEURS (10 par équipe = 160 joueurs)
-- Noms fictifs mais réalistes selon la nationalité du club
-- Format : 1 Gardien, 3 Défenseurs, 3 Milieux, 3 Attaquants
-- ============================================================

-- === Real Madrid (team_id = 1) ===
INSERT INTO "players" ("first_name", "last_name", "position", "jersey_number", "team_id") VALUES
('Thibaut', 'Courtois', 'Gardien', 1, 1),
('Daniel', 'Carvajal', 'Défenseur', 2, 1),
('Antonio', 'Rüdiger', 'Défenseur', 22, 1),
('Ferland', 'Mendy', 'Défenseur', 23, 1),
('Luka', 'Modric', 'Milieu', 10, 1),
('Jude', 'Bellingham', 'Milieu', 5, 1),
('Federico', 'Valverde', 'Milieu', 8, 1),
('Vinícius', 'Júnior', 'Attaquant', 7, 1),
('Rodrygo', 'Silva', 'Attaquant', 11, 1),
('Kylian', 'Mbappé', 'Attaquant', 9, 1);

-- === Paris Saint-Germain (team_id = 2) ===
INSERT INTO "players" ("first_name", "last_name", "position", "jersey_number", "team_id") VALUES
('Gianluigi', 'Donnarumma', 'Gardien', 99, 2),
('Achraf', 'Hakimi', 'Défenseur', 2, 2),
('Marquinhos', 'Corrêa', 'Défenseur', 5, 2),
('Lucas', 'Hernandez', 'Défenseur', 21, 2),
('Vitinha', 'Ferreira', 'Milieu', 17, 2),
('Warren', 'Zaïre-Emery', 'Milieu', 33, 2),
('Ousmane', 'Dembélé', 'Milieu', 10, 2),
('Bradley', 'Barcola', 'Attaquant', 29, 2),
('Randal', 'Kolo Muani', 'Attaquant', 23, 2),
('Marco', 'Asensio', 'Attaquant', 11, 2);

-- === Ajax Amsterdam (team_id = 3) ===
INSERT INTO "players" ("first_name", "last_name", "position", "jersey_number", "team_id") VALUES
('Remko', 'Pasveer', 'Gardien', 22, 3),
('Devyne', 'Rensch', 'Défenseur', 2, 3),
('Josip', 'Šutalo', 'Défenseur', 4, 3),
('Jorrel', 'Hato', 'Défenseur', 37, 3),
('Kenneth', 'Taylor', 'Milieu', 8, 3),
('Davy', 'Klaassen', 'Milieu', 10, 3),
('Steven', 'Berghuis', 'Milieu', 23, 3),
('Brian', 'Brobbey', 'Attaquant', 9, 3),
('Chuba', 'Akpom', 'Attaquant', 11, 3),
('Mika', 'Godts', 'Attaquant', 17, 3);

-- === Celtic Glasgow (team_id = 4) ===
INSERT INTO "players" ("first_name", "last_name", "position", "jersey_number", "team_id") VALUES
('Joe', 'Hart', 'Gardien', 1, 4),
('Alistair', 'Johnston', 'Défenseur', 2, 4),
('Cameron', 'Carter-Vickers', 'Défenseur', 20, 4),
('Greg', 'Taylor', 'Défenseur', 3, 4),
('Callum', 'McGregor', 'Milieu', 42, 4),
('Reo', 'Hatate', 'Milieu', 41, 4),
('Matt', 'O''Riley', 'Milieu', 33, 4),
('Kyogo', 'Furuhashi', 'Attaquant', 8, 4),
('Liel', 'Abada', 'Attaquant', 11, 4),
('Daizen', 'Maeda', 'Attaquant', 38, 4);

-- === FC Barcelone (team_id = 5) ===
INSERT INTO "players" ("first_name", "last_name", "position", "jersey_number", "team_id") VALUES
('Marc-André', 'ter Stegen', 'Gardien', 1, 5),
('Jules', 'Koundé', 'Défenseur', 23, 5),
('Ronald', 'Araújo', 'Défenseur', 4, 5),
('Alejandro', 'Balde', 'Défenseur', 28, 5),
('Pedri', 'González', 'Milieu', 8, 5),
('Gavi', 'Páez', 'Milieu', 6, 5),
('Frenkie', 'de Jong', 'Milieu', 21, 5),
('Lamine', 'Yamal', 'Attaquant', 19, 5),
('Robert', 'Lewandowski', 'Attaquant', 9, 5),
('Raphinha', 'Dias', 'Attaquant', 11, 5);

-- === Bayern Munich (team_id = 6) ===
INSERT INTO "players" ("first_name", "last_name", "position", "jersey_number", "team_id") VALUES
('Manuel', 'Neuer', 'Gardien', 1, 6),
('Dayot', 'Upamecano', 'Défenseur', 2, 6),
('Min-Jae', 'Kim', 'Défenseur', 3, 6),
('Alphonso', 'Davies', 'Défenseur', 19, 6),
('Joshua', 'Kimmich', 'Milieu', 6, 6),
('Jamal', 'Musiala', 'Milieu', 42, 6),
('Leon', 'Goretzka', 'Milieu', 8, 6),
('Leroy', 'Sané', 'Attaquant', 10, 6),
('Harry', 'Kane', 'Attaquant', 9, 6),
('Serge', 'Gnabry', 'Attaquant', 7, 6);

-- === FC Porto (team_id = 7) ===
INSERT INTO "players" ("first_name", "last_name", "position", "jersey_number", "team_id") VALUES
('Diogo', 'Costa', 'Gardien', 99, 7),
('João', 'Mário', 'Défenseur', 23, 7),
('Pepe', 'Ferreira', 'Défenseur', 3, 7),
('Wendell', 'Santos', 'Défenseur', 12, 7),
('Alan', 'Varela', 'Milieu', 18, 7),
('Stephen', 'Eustáquio', 'Milieu', 6, 7),
('Otávio', 'Monteiro', 'Milieu', 25, 7),
('Mehdi', 'Taremi', 'Attaquant', 9, 7),
('Evanilson', 'Barbosa', 'Attaquant', 30, 7),
('Galeno', 'Fernandes', 'Attaquant', 70, 7);

-- === Feyenoord Rotterdam (team_id = 8) ===
INSERT INTO "players" ("first_name", "last_name", "position", "jersey_number", "team_id") VALUES
('Justin', 'Bijlow', 'Gardien', 1, 8),
('Lutsharel', 'Geertruida', 'Défenseur', 15, 8),
('Dávid', 'Hancko', 'Défenseur', 4, 8),
('Quilindschy', 'Hartman', 'Défenseur', 22, 8),
('Mats', 'Wieffer', 'Milieu', 14, 8),
('Quinten', 'Timber', 'Milieu', 23, 8),
('Sebastian', 'Szymański', 'Milieu', 10, 8),
('Santiago', 'Giménez', 'Attaquant', 29, 8),
('Igor', 'Paixão', 'Attaquant', 7, 8),
('Calvin', 'Stengs', 'Attaquant', 11, 8);

-- === Manchester City (team_id = 9) ===
INSERT INTO "players" ("first_name", "last_name", "position", "jersey_number", "team_id") VALUES
('Ederson', 'Moraes', 'Gardien', 31, 9),
('Rúben', 'Dias', 'Défenseur', 3, 9),
('John', 'Stones', 'Défenseur', 5, 9),
('Kyle', 'Walker', 'Défenseur', 2, 9),
('Rodri', 'Hernández', 'Milieu', 16, 9),
('Kevin', 'De Bruyne', 'Milieu', 17, 9),
('Bernardo', 'Silva', 'Milieu', 20, 9),
('Phil', 'Foden', 'Attaquant', 47, 9),
('Erling', 'Haaland', 'Attaquant', 9, 9),
('Jack', 'Grealish', 'Attaquant', 10, 9);

-- === Inter Milan (team_id = 10) ===
INSERT INTO "players" ("first_name", "last_name", "position", "jersey_number", "team_id") VALUES
('Yann', 'Sommer', 'Gardien', 1, 10),
('Alessandro', 'Bastoni', 'Défenseur', 95, 10),
('Francesco', 'Acerbi', 'Défenseur', 15, 10),
('Benjamin', 'Pavard', 'Défenseur', 28, 10),
('Nicolò', 'Barella', 'Milieu', 23, 10),
('Hakan', 'Çalhanoğlu', 'Milieu', 20, 10),
('Henrikh', 'Mkhitaryan', 'Milieu', 22, 10),
('Lautaro', 'Martínez', 'Attaquant', 10, 10),
('Marcus', 'Thuram', 'Attaquant', 9, 10),
('Alexis', 'Sánchez', 'Attaquant', 7, 10);

-- === Borussia Dortmund (team_id = 11) ===
INSERT INTO "players" ("first_name", "last_name", "position", "jersey_number", "team_id") VALUES
('Gregor', 'Kobel', 'Gardien', 1, 11),
('Mats', 'Hummels', 'Défenseur', 15, 11),
('Nico', 'Schlotterbeck', 'Défenseur', 4, 11),
('Ian', 'Maatsen', 'Défenseur', 22, 11),
('Marcel', 'Sabitzer', 'Milieu', 20, 11),
('Julian', 'Brandt', 'Milieu', 10, 11),
('Emre', 'Can', 'Milieu', 23, 11),
('Karim', 'Adeyemi', 'Attaquant', 27, 11),
('Donyell', 'Malen', 'Attaquant', 21, 11),
('Niclas', 'Füllkrug', 'Attaquant', 9, 11);

-- === Benfica Lisbonne (team_id = 12) ===
INSERT INTO "players" ("first_name", "last_name", "position", "jersey_number", "team_id") VALUES
('Anatoliy', 'Trubin', 'Gardien', 1, 12),
('António', 'Silva', 'Défenseur', 4, 12),
('Nicolás', 'Otamendi', 'Défenseur', 30, 12),
('Álvaro', 'Carreras', 'Défenseur', 3, 12),
('João', 'Neves', 'Milieu', 87, 12),
('Florentino', 'Luís', 'Milieu', 61, 12),
('Fredrik', 'Aursnes', 'Milieu', 28, 12),
('Ángel', 'Di María', 'Attaquant', 11, 12),
('Vangelis', 'Pavlidis', 'Attaquant', 9, 12),
('Kerem', 'Aktürkoğlu', 'Attaquant', 7, 12);

-- === Liverpool (team_id = 13) ===
INSERT INTO "players" ("first_name", "last_name", "position", "jersey_number", "team_id") VALUES
('Alisson', 'Becker', 'Gardien', 1, 13),
('Trent', 'Alexander-Arnold', 'Défenseur', 66, 13),
('Virgil', 'van Dijk', 'Défenseur', 4, 13),
('Andrew', 'Robertson', 'Défenseur', 26, 13),
('Alexis', 'Mac Allister', 'Milieu', 10, 13),
('Dominik', 'Szoboszlai', 'Milieu', 8, 13),
('Ryan', 'Gravenberch', 'Milieu', 38, 13),
('Mohamed', 'Salah', 'Attaquant', 11, 13),
('Darwin', 'Núñez', 'Attaquant', 9, 13),
('Luis', 'Díaz', 'Attaquant', 7, 13);

-- === Juventus Turin (team_id = 14) ===
INSERT INTO "players" ("first_name", "last_name", "position", "jersey_number", "team_id") VALUES
('Wojciech', 'Szczęsny', 'Gardien', 1, 14),
('Danilo', 'Luiz', 'Défenseur', 6, 14),
('Gleison', 'Bremer', 'Défenseur', 3, 14),
('Andrea', 'Cambiaso', 'Défenseur', 27, 14),
('Manuel', 'Locatelli', 'Milieu', 5, 14),
('Adrien', 'Rabiot', 'Milieu', 25, 14),
('Niccolò', 'Fagioli', 'Milieu', 21, 14),
('Federico', 'Chiesa', 'Attaquant', 7, 14),
('Dušan', 'Vlahović', 'Attaquant', 9, 14),
('Kenan', 'Yıldız', 'Attaquant', 10, 14);

-- === Atlético Madrid (team_id = 15) ===
INSERT INTO "players" ("first_name", "last_name", "position", "jersey_number", "team_id") VALUES
('Jan', 'Oblak', 'Gardien', 13, 15),
('José', 'Giménez', 'Défenseur', 2, 15),
('Reinildo', 'Mandava', 'Défenseur', 23, 15),
('Nahuel', 'Molina', 'Défenseur', 16, 15),
('Rodrigo', 'De Paul', 'Milieu', 5, 15),
('Koke', 'Resurreccion', 'Milieu', 6, 15),
('Marcos', 'Llorente', 'Milieu', 14, 15),
('Antoine', 'Griezmann', 'Attaquant', 7, 15),
('Álvaro', 'Morata', 'Attaquant', 19, 15),
('Memphis', 'Depay', 'Attaquant', 9, 15);

-- === AC Milan (team_id = 16) ===
INSERT INTO "players" ("first_name", "last_name", "position", "jersey_number", "team_id") VALUES
('Mike', 'Maignan', 'Gardien', 16, 16),
('Davide', 'Calabria', 'Défenseur', 2, 16),
('Fikayo', 'Tomori', 'Défenseur', 23, 16),
('Theo', 'Hernandez', 'Défenseur', 19, 16),
('Tijjani', 'Reijnders', 'Milieu', 14, 16),
('Ismaël', 'Bennacer', 'Milieu', 4, 16),
('Christian', 'Pulisic', 'Milieu', 11, 16),
('Rafael', 'Leão', 'Attaquant', 10, 16),
('Olivier', 'Giroud', 'Attaquant', 9, 16),
('Noah', 'Okafor', 'Attaquant', 17, 16);

-- ============================================================
-- MATCHS (24 matchs : 6 par groupe, 3 journées)
-- Dates fictives en septembre-octobre 2024
-- ============================================================

-- GROUPE A — Journée 1 (17 sept 2024)
INSERT INTO "matches" ("matchday", "match_date", "home_team_id", "away_team_id", "home_score", "away_score") VALUES
(1, '2024-09-17', 1, 2, 2, 1),   -- M1: Real Madrid 2-1 PSG
(1, '2024-09-17', 3, 4, 1, 1);   -- M2: Ajax 1-1 Celtic

-- GROUPE A — Journée 2 (1 oct 2024)
INSERT INTO "matches" ("matchday", "match_date", "home_team_id", "away_team_id", "home_score", "away_score") VALUES
(2, '2024-10-01', 2, 4, 3, 0),   -- M3: PSG 3-0 Celtic
(2, '2024-10-01', 3, 1, 0, 2);   -- M4: Ajax 0-2 Real Madrid

-- GROUPE A — Journée 3 (22 oct 2024)
INSERT INTO "matches" ("matchday", "match_date", "home_team_id", "away_team_id", "home_score", "away_score") VALUES
(3, '2024-10-22', 4, 1, 0, 3),   -- M5: Celtic 0-3 Real Madrid
(3, '2024-10-22', 2, 3, 2, 0);   -- M6: PSG 2-0 Ajax

-- GROUPE B — Journée 1 (17 sept 2024)
INSERT INTO "matches" ("matchday", "match_date", "home_team_id", "away_team_id", "home_score", "away_score") VALUES
(1, '2024-09-17', 5, 6, 2, 2),   -- M7: Barcelone 2-2 Bayern
(1, '2024-09-17', 7, 8, 1, 0);   -- M8: Porto 1-0 Feyenoord

-- GROUPE B — Journée 2 (1 oct 2024)
INSERT INTO "matches" ("matchday", "match_date", "home_team_id", "away_team_id", "home_score", "away_score") VALUES
(2, '2024-10-01', 6, 8, 4, 1),   -- M9: Bayern 4-1 Feyenoord
(2, '2024-10-01', 7, 5, 0, 1);   -- M10: Porto 0-1 Barcelone

-- GROUPE B — Journée 3 (22 oct 2024)
INSERT INTO "matches" ("matchday", "match_date", "home_team_id", "away_team_id", "home_score", "away_score") VALUES
(3, '2024-10-22', 8, 5, 1, 3),   -- M11: Feyenoord 1-3 Barcelone
(3, '2024-10-22', 6, 7, 3, 1);   -- M12: Bayern 3-1 Porto

-- GROUPE C — Journée 1 (18 sept 2024)
INSERT INTO "matches" ("matchday", "match_date", "home_team_id", "away_team_id", "home_score", "away_score") VALUES
(1, '2024-09-18', 9, 10, 1, 0),  -- M13: Man City 1-0 Inter
(1, '2024-09-18', 11, 12, 2, 1); -- M14: Dortmund 2-1 Benfica

-- GROUPE C — Journée 2 (2 oct 2024)
INSERT INTO "matches" ("matchday", "match_date", "home_team_id", "away_team_id", "home_score", "away_score") VALUES
(2, '2024-10-02', 10, 12, 3, 1), -- M15: Inter 3-1 Benfica
(2, '2024-10-02', 11, 9, 1, 1);  -- M16: Dortmund 1-1 Man City

-- GROUPE C — Journée 3 (23 oct 2024)
INSERT INTO "matches" ("matchday", "match_date", "home_team_id", "away_team_id", "home_score", "away_score") VALUES
(3, '2024-10-23', 12, 9, 0, 2),  -- M17: Benfica 0-2 Man City
(3, '2024-10-23', 10, 11, 2, 0); -- M18: Inter 2-0 Dortmund

-- GROUPE D — Journée 1 (18 sept 2024)
INSERT INTO "matches" ("matchday", "match_date", "home_team_id", "away_team_id", "home_score", "away_score") VALUES
(1, '2024-09-18', 13, 14, 2, 0), -- M19: Liverpool 2-0 Juventus
(1, '2024-09-18', 15, 16, 1, 1); -- M20: Atlético 1-1 AC Milan

-- GROUPE D — Journée 2 (2 oct 2024)
INSERT INTO "matches" ("matchday", "match_date", "home_team_id", "away_team_id", "home_score", "away_score") VALUES
(2, '2024-10-02', 14, 16, 2, 1), -- M21: Juventus 2-1 AC Milan
(2, '2024-10-02', 15, 13, 0, 1); -- M22: Atlético 0-1 Liverpool

-- GROUPE D — Journée 3 (23 oct 2024)
INSERT INTO "matches" ("matchday", "match_date", "home_team_id", "away_team_id", "home_score", "away_score") VALUES
(3, '2024-10-23', 16, 13, 1, 3), -- M23: AC Milan 1-3 Liverpool
(3, '2024-10-23', 14, 15, 1, 1); -- M24: Juventus 1-1 Atlético

-- ============================================================
-- BUTS (cohérents avec les scores ci-dessus)
-- Chaque but correspond au score du match
-- ============================================================

-- M1: Real Madrid 2-1 PSG
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(1, 10, 23, 'normal'),   -- Mbappé (Real) 1-0
(1, 6, 55, 'normal'),    -- Bellingham (Real) 2-0
(1, 18, 78, 'penalty');   -- Barcola (PSG) 2-1

-- M2: Ajax 1-1 Celtic
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(2, 28, 34, 'normal'),   -- Brobbey (Ajax) 1-0
(2, 38, 67, 'normal');   -- Furuhashi (Celtic) 1-1

-- M3: PSG 3-0 Celtic
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(3, 17, 12, 'normal'),   -- Dembélé (PSG) 1-0
(3, 18, 41, 'normal'),   -- Barcola (PSG) 2-0
(3, 19, 73, 'normal');   -- Kolo Muani (PSG) 3-0

-- M4: Ajax 0-2 Real Madrid
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(4, 8, 29, 'normal'),    -- Vinícius (Real) 0-1
(4, 10, 62, 'normal');   -- Mbappé (Real) 0-2

-- M5: Celtic 0-3 Real Madrid
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(5, 10, 15, 'normal'),   -- Mbappé (Real) 0-1
(5, 6, 44, 'normal'),    -- Bellingham (Real) 0-2
(5, 9, 71, 'penalty');   -- Rodrygo (Real) 0-3

-- M6: PSG 2-0 Ajax
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(6, 18, 38, 'normal'),   -- Barcola (PSG) 1-0
(6, 17, 82, 'normal');   -- Dembélé (PSG) 2-0

-- M7: Barcelone 2-2 Bayern
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(7, 49, 8, 'normal'),    -- Lewandowski (Barça) 1-0
(7, 59, 33, 'normal'),   -- Kane (Bayern) 1-1
(7, 48, 56, 'normal'),   -- Yamal (Barça) 2-1
(7, 56, 88, 'normal');   -- Musiala (Bayern) 2-2

-- M8: Porto 1-0 Feyenoord
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(8, 68, 52, 'normal');   -- Taremi (Porto) 1-0

-- M9: Bayern 4-1 Feyenoord
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(9, 59, 11, 'penalty'),  -- Kane (Bayern) 1-0
(9, 56, 28, 'normal'),   -- Musiala (Bayern) 2-0
(9, 78, 45, 'normal'),   -- Giménez (Feyenoord) 2-1
(9, 59, 67, 'normal'),   -- Kane (Bayern) 3-1
(9, 58, 80, 'normal');   -- Sané (Bayern) 4-1

-- M10: Porto 0-1 Barcelone
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(10, 50, 63, 'normal');  -- Raphinha (Barça) 0-1

-- M11: Feyenoord 1-3 Barcelone
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(11, 49, 19, 'normal'),  -- Lewandowski (Barça) 0-1
(11, 78, 35, 'penalty'),  -- Giménez (Feyenoord) 1-1
(11, 48, 58, 'normal'),  -- Yamal (Barça) 1-2
(11, 49, 76, 'penalty'); -- Lewandowski (Barça) 1-3

-- M12: Bayern 3-1 Porto
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(12, 59, 22, 'normal'),  -- Kane (Bayern) 1-0
(12, 60, 41, 'normal'),  -- Gnabry (Bayern) 2-0
(12, 69, 55, 'normal'),  -- Evanilson (Porto) 2-1
(12, 56, 79, 'normal');  -- Musiala (Bayern) 3-1

-- M13: Man City 1-0 Inter
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(13, 89, 72, 'normal');  -- Haaland (City) 1-0

-- M14: Dortmund 2-1 Benfica
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(14, 108, 30, 'normal'), -- Adeyemi (Dortmund) 1-0
(14, 119, 54, 'normal'), -- Pavlidis (Benfica) 1-1
(14, 109, 81, 'normal'); -- Malen (Dortmund) 2-1

-- M15: Inter 3-1 Benfica
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(15, 98, 18, 'normal'),  -- Martínez (Inter) 1-0
(15, 99, 37, 'normal'),  -- Thuram (Inter) 2-0
(15, 118, 60, 'normal'), -- Di María (Benfica) 2-1
(15, 98, 85, 'penalty'); -- Martínez (Inter) 3-1

-- M16: Dortmund 1-1 Man City
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(16, 106, 42, 'normal'), -- Brandt (Dortmund) 1-0
(16, 86, 70, 'normal');  -- De Bruyne (City) 1-1

-- M17: Benfica 0-2 Man City
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(17, 89, 25, 'normal'),  -- Haaland (City) 0-1
(17, 88, 64, 'normal');  -- Foden (City) 0-2

-- M18: Inter 2-0 Dortmund
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(18, 96, 48, 'normal'),  -- Çalhanoğlu (Inter) 1-0
(18, 98, 77, 'normal');  -- Martínez (Inter) 2-0

-- M19: Liverpool 2-0 Juventus
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(19, 128, 31, 'normal'), -- Salah (Liverpool) 1-0
(19, 129, 68, 'normal'); -- Núñez (Liverpool) 2-0

-- M20: Atlético 1-1 AC Milan
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(20, 148, 40, 'normal'), -- Griezmann (Atlético) 1-0
(20, 158, 75, 'normal'); -- Leão (AC Milan) 1-1

-- M21: Juventus 2-1 AC Milan
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(21, 139, 27, 'normal'), -- Vlahović (Juventus) 1-0
(21, 159, 53, 'normal'), -- Giroud (AC Milan) 1-1
(21, 140, 89, 'normal'); -- Yıldız (Juventus) 2-1

-- M22: Atlético 0-1 Liverpool
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(22, 128, 57, 'penalty'); -- Salah (Liverpool) 0-1

-- M23: AC Milan 1-3 Liverpool
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(23, 157, 14, 'normal'), -- Pulisic (AC Milan) 1-0
(23, 130, 33, 'normal'), -- Díaz (Liverpool) 1-1
(23, 128, 61, 'normal'), -- Salah (Liverpool) 1-2
(23, 129, 84, 'normal'); -- Núñez (Liverpool) 1-3

-- M24: Juventus 1-1 Atlético
INSERT INTO "goals" ("match_id", "player_id", "minute", "goal_type") VALUES
(24, 139, 36, 'normal'), -- Vlahović (Juventus) 1-0
(24, 149, 72, 'penalty'); -- Morata (Atlético) 1-1

-- ============================================================
-- CARTONS (répartis sur les 24 matchs)
-- ============================================================

-- Groupe A
INSERT INTO "cards" ("match_id", "player_id", "card_type", "minute") VALUES
(1, 13, 'jaune', 34),    -- Marquinhos (PSG)
(1, 4, 'jaune', 61),     -- Mendy (Real)
(2, 26, 'jaune', 45),    -- Klaassen (Ajax)
(3, 35, 'jaune', 28),    -- Carter-Vickers (Celtic)
(3, 36, 'jaune', 80),    -- Taylor G. (Celtic)
(4, 23, 'jaune', 50),    -- Šutalo (Ajax)
(5, 31, 'rouge', 65),    -- McGregor (Celtic)
(6, 22, 'jaune', 71),    -- Rensch (Ajax)

-- Groupe B
(7, 55, 'jaune', 44),    -- Kimmich (Bayern)
(7, 46, 'jaune', 62),    -- Koundé (Barça)
(8, 73, 'jaune', 38),    -- Wieffer (Feyenoord)
(9, 72, 'jaune', 55),    -- Hancko (Feyenoord)
(10, 63, 'jaune', 47),   -- Varela (Porto)
(11, 71, 'jaune', 30),   -- Geertruida (Feyenoord)
(12, 62, 'jaune', 68),   -- Pepe (Porto)
(12, 62, 'rouge', 83),   -- Pepe (Porto) - 2e jaune = rouge

-- Groupe C
(13, 93, 'jaune', 40),   -- Bastoni (Inter)
(14, 117, 'jaune', 25),  -- Aursnes (Benfica)
(15, 113, 'jaune', 52),  -- Otamendi (Benfica)
(16, 107, 'jaune', 60),  -- Can (Dortmund)
(16, 82, 'jaune', 75),   -- Walker (City)
(17, 113, 'jaune', 35),  -- Otamendi (Benfica)
(18, 105, 'jaune', 44),  -- Sabitzer (Dortmund)

-- Groupe D
(19, 133, 'jaune', 55),  -- Bremer (Juventus)
(20, 146, 'jaune', 30),  -- Molina (Atlético)
(20, 153, 'jaune', 67),  -- Tomori (AC Milan)
(21, 156, 'jaune', 48),  -- Bennacer (AC Milan)
(22, 145, 'jaune', 38),  -- Reinildo (Atlético)
(22, 147, 'rouge', 82),  -- De Paul (Atlético)
(23, 152, 'jaune', 22),  -- Hernandez T. (AC Milan)
(24, 134, 'jaune', 57),  -- Cambiaso (Juventus)
(24, 148, 'jaune', 64),  -- Griezmann (Atlético)
(19, 124, 'jaune', 72),  -- Robertson (Liverpool)
(23, 127, 'jaune', 50);  -- Gravenberch (Liverpool)
