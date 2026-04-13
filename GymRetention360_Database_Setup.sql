/*
=============================================================================
PROJET : GymRetention 360
OBJECTIF : Création d'un système de gestion et d'analyse de la rétention client.
AUTEUR : Ali Mansour Salia
OUTIL : SQL Server (T-SQL)
DATE : Avril 2026
=============================================================================
*/

-- 1. CRÉATION DE LA BASE DE DONNÉES
CREATE DATABASE GymRetention360;
GO
USE GymRetention360;
GO

-- 2. CRÉATION DES TABLES (Data Engineering)
-- Table des membres : Stockage des informations de profil
CREATE TABLE Membres (
    id_membre INT PRIMARY KEY IDENTITY(1,1),
    nom NVARCHAR(100) NOT NULL,
    age INT,
    sexe CHAR(1) CHECK (sexe IN ('M', 'F')),
    date_inscription DATE NOT NULL,
    type_abonnement NVARCHAR(20) CHECK (type_abonnement IN ('Mensuel', 'Trimestriel', 'Annuel')),
    statut NVARCHAR(10) DEFAULT 'Actif' CHECK (statut IN ('Actif', 'Resilie'))
);

-- Table des visites : Suivi de l'assiduité (Indicateur clé pour le Churn)
CREATE TABLE Visites (
    id_visite INT PRIMARY KEY IDENTITY(1,1),
    id_membre INT,
    date_visite DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Visites_Membres FOREIGN KEY (id_membre) 
        REFERENCES Membres(id_membre) ON DELETE CASCADE
);

-- Table des paiements : Suivi de la valeur client (CLV)
CREATE TABLE Paiements (
    id_paimement INT PRIMARY KEY IDENTITY(1,1),
    id_membre INT,
    montant DECIMAL(10,2),
    date_paiement DATE,
    CONSTRAINT FK_Paiements_Membres FOREIGN KEY (id_membre) 
        REFERENCES Membres(id_membre)
);
GO

-- 3. INSERTION DES DONNÉES (Simulation de 50 Membres)
-- Note : Utilisation du format ISO 'YYYYMMDD' pour la compatibilité universelle
SET DATEFORMAT ymd;
GO

INSERT INTO Membres (nom, age, sexe, date_inscription, type_abonnement, statut) VALUES 
('Jean Dupont', 25, 'M', '20250510', 'Annuel', 'Actif'),
('Marie Curie', 30, 'F', '20250615', 'Mensuel', 'Actif'),
('Ali Mansour', 23, 'M', '20251001', 'Annuel', 'Actif'),
('Sophie Martin', 28, 'F', '20260105', 'Mensuel', 'Actif'),
('Omar Sy', 35, 'M', '20250820', 'Trimestriel', 'Actif'),
('Lucie Aubrac', 22, 'F', '20260310', 'Mensuel', 'Actif'),
('Marc Veyrat', 45, 'M', '20251201', 'Annuel', 'Actif'),
('Zinedine Z.', 50, 'M', '20250412', 'Annuel', 'Actif'),
('Ines Reg', 29, 'F', '20260214', 'Mensuel', 'Actif'),
('Thomas Pesquet', 40, 'M', '20251120', 'Trimestriel', 'Actif'),
('Karim B.', 27, 'M', '20250601', 'Annuel', 'Actif'),
('Leila K.', 31, 'F', '20260112', 'Mensuel', 'Actif'),
('Yanis M.', 21, 'M', '20250905', 'Trimestriel', 'Actif'),
('Amel B.', 24, 'F', '20260320', 'Mensuel', 'Actif'),
('Sofiane R.', 33, 'M', '20250715', 'Annuel', 'Actif'),
('Sarah J.', 26, 'F', '20260228', 'Mensuel', 'Actif'),
('David G.', 38, 'M', '20251010', 'Trimestriel', 'Actif'),
('Julie P.', 29, 'F', '20260120', 'Mensuel', 'Actif'),
('Mourad T.', 42, 'M', '20250525', 'Annuel', 'Actif'),
('Celine D.', 35, 'F', '20250814', 'Annuel', 'Actif'),
('Lucas H.', 19, 'M', '20260301', 'Mensuel', 'Actif'),
('Emma W.', 24, 'F', '20251212', 'Trimestriel', 'Actif'),
('Hugo L.', 30, 'M', '20251101', 'Annuel', 'Actif'),
('Manon F.', 27, 'F', '20260210', 'Mensuel', 'Actif'),
('Arthur R.', 22, 'M', '20250930', 'Trimestriel', 'Actif'),
('Chloe B.', 23, 'F', '20260315', 'Mensuel', 'Actif'),
('Nicolas S.', 48, 'M', '20250420', 'Annuel', 'Actif'),
('Lea S.', 21, 'F', '20260130', 'Mensuel', 'Actif'),
('Paul M.', 36, 'M', '20250701', 'Annuel', 'Actif'),
('Nina K.', 25, 'F', '20260305', 'Mensuel', 'Actif'),
('Adrien V.', 28, 'M', '20251015', 'Trimestriel', 'Actif'),
('Alice L.', 32, 'F', '20250625', 'Annuel', 'Actif'),
('Samir A.', 26, 'M', '20260205', 'Mensuel', 'Actif'),
('Clara T.', 20, 'F', '20260325', 'Mensuel', 'Actif'),
('Benoit P.', 41, 'M', '20250805', 'Annuel', 'Actif'),
('Ines B.', 24, 'F', '20260115', 'Mensuel', 'Actif'),
('Maxime R.', 29, 'M', '20251110', 'Trimestriel', 'Actif'),
('Eva G.', 27, 'F', '20260220', 'Mensuel', 'Actif'),
('Rayan D.', 23, 'M', '20251205', 'Annuel', 'Actif'),
('Fanny M.', 30, 'F', '20260310', 'Mensuel', 'Actif'),
('Kevin L.', 25, 'M', '20250912', 'Trimestriel', 'Actif'),
('Jade S.', 22, 'F', '20260102', 'Mensuel', 'Actif'),
('Alexandre K.', 34, 'M', '20250720', 'Annuel', 'Actif'),
('Louna F.', 26, 'F', '20260212', 'Mensuel', 'Actif'),
('Theo B.', 21, 'M', '20251025', 'Trimestriel', 'Actif'),
('Rose P.', 28, 'F', '20260318', 'Mensuel', 'Actif'),
('Mathieu J.', 37, 'M', '20250530', 'Annuel', 'Actif'),
('Sonia W.', 31, 'F', '20251115', 'Annuel', 'Actif'),
('Gabriel M.', 24, 'M', '20260125', 'Mensuel', 'Actif'),
('Ismael B.', 29, 'M', '20250828', 'Trimestriel', 'Actif');

-- Simulation des comportements de visite (Fidèles vs Risques)
DECLARE @i INT = 1;
WHILE @i <= 5 BEGIN
    INSERT INTO Visites (id_membre, date_visite) 
    VALUES (@i, DATEADD(day, -1, GETDATE())), (@i, DATEADD(day, -3, GETDATE())), (@i, DATEADD(day, -5, GETDATE()));
    SET @i = @i + 1;
END

INSERT INTO Visites (id_membre, date_visite) VALUES 
(6, '20260210'), (7, '20260115'), (15, '20260220'), (20, '20260105'),
(11, '20260320'), (12, '20260322'), (33, '20260315');

-- Simulation des paiements (Clients vs Prospects)
INSERT INTO Paiements (id_membre, montant, date_paiement) VALUES 
(1, 300.00, '20251001'), 
(2, 40.00, '20260315'), 
(4, 40.00, '20260405'),
(7, 300.00, '20251201'), 
(20, 300.00, '20250814'), 
(11, 100.00, '20250601'), 
(15, 300.00, '20250715');
GO

-- 4. CRÉATION DU SYSTÈME D'ANALYSE (Data Analysis)
-- Création d'une VUE pour automatiser le calcul du Churn Risk
CREATE VIEW Vue_Alerte_Retention AS
SELECT 
    m.nom AS [Membre],
    m.type_abonnement AS [Abonnement],
    ISNULL(MAX(v.date_visite), '20000101') AS [Derniere_Visite],
    DATEDIFF(DAY, ISNULL(MAX(v.date_visite), m.date_inscription), GETDATE()) AS [Jours_Inactivite],
    ISNULL(SUM(p.montant), 0) AS [Total_Investi]
FROM 
    Membres m
LEFT JOIN 
    Visites v ON m.id_membre = v.id_membre
LEFT JOIN 
    Paiements p ON m.id_membre = p.id_membre
GROUP BY 
    m.nom, m.type_abonnement, m.date_inscription;
GO

-- 5. REQUÊTE FINALE : Identification des clients prioritaires
-- (Ont investi de l'argent mais ne sont pas venus depuis +14 jours)
SELECT * FROM Vue_Alerte_Retention 
WHERE Total_Investi > 0 AND Jours_Inactivite > 14
ORDER BY Jours_Inactivite DESC;

-- 1. Ajout des nouveaux membres (Profils variés)
INSERT INTO Membres (nom, age, sexe, date_inscription, type_abonnement, statut) VALUES 
('Yasmine B.', 24, 'F', '20250910', 'Annuel', 'Actif'),
('Ahmed T.', 31, 'M', '20251115', 'Mensuel', 'Actif'),
('Sarah L.', 27, 'F', '20251220', 'Trimestriel', 'Actif'),
('Mourad K.', 42, 'M', '20250805', 'Annuel', 'Actif'),
('Lina M.', 22, 'F', '20260110', 'Annuel', 'Actif'),
('Omar D.', 35, 'M', '20251025', 'Mensuel', 'Actif'),
('Rania S.', 29, 'F', '20260214', 'Trimestriel', 'Actif'),
('Idris F.', 40, 'M', '20250701', 'Annuel', 'Actif'),
('Amel V.', 25, 'F', '20260305', 'Mensuel', 'Actif'),
('Sami R.', 33, 'M', '20251130', 'Annuel', 'Actif'),
('Ines B.', 21, 'F', '20260120', 'Trimestriel', 'Actif'),
('Walid H.', 28, 'M', '20250915', 'Annuel', 'Actif'),
('Myriam G.', 30, 'F', '20260228', 'Mensuel', 'Actif'),
('Farid J.', 45, 'M', '20250512', 'Annuel', 'Actif'),
('Nadia E.', 26, 'F', '20251205', 'Trimestriel', 'Actif'),
('Hassan P.', 38, 'M', '20251010', 'Annuel', 'Actif'),
('Zohra W.', 23, 'F', '20260318', 'Mensuel', 'Actif'),
('Rayane Q.', 29, 'M', '20250820', 'Annuel', 'Actif'),
('Anis T.', 27, 'M', '20260105', 'Trimestriel', 'Actif');

-- 2. Simulation de paiements réalistes (pour qu'ils apparaissent dans ton KPI "Revenu en Risque")
-- On récupère les ID des 19 derniers membres insérés
INSERT INTO Paiements (id_membre, montant, date_paiement)
SELECT id_membre, 
       CASE 
         WHEN type_abonnement = 'Annuel' THEN 299.90 + (id_membre % 10)
         WHEN type_abonnement = 'Trimestriel' THEN 115.50 + (id_membre % 5)
         ELSE 45.00 + (id_membre % 3)
       END,
       date_inscription
FROM Membres 
WHERE nom IN ('Yasmine B.', 'Ahmed T.', 'Sarah L.', 'Mourad K.', 'Lina M.', 'Omar D.', 'Rania S.', 'Idris F.', 'Amel V.', 'Sami R.', 'Ines B.', 'Walid H.', 'Myriam G.', 'Farid J.', 'Nadia E.', 'Hassan P.', 'Zohra W.', 'Rayane Q.', 'Anis T.');

-- 3. Simulation de dernières visites lointaines (> 14 jours)
-- On leur met une seule visite juste après leur inscription pour simuler l'abandon
INSERT INTO Visites (id_membre, date_visite)
SELECT id_membre, DATEADD(day, 2, date_inscription)
FROM Membres 
WHERE nom IN ('Yasmine B.', 'Ahmed T.', 'Sarah L.', 'Mourad K.', 'Lina M.', 'Omar D.', 'Rania S.', 'Idris F.', 'Amel V.', 'Sami R.', 'Ines B.', 'Walid H.', 'Myriam G.', 'Farid J.', 'Nadia E.', 'Hassan P.', 'Zohra W.', 'Rayane Q.', 'Anis T.');
GO

ALTER VIEW Vue_Alerte_Retention AS
SELECT 
    m.id_membre, -- On ajoute l'ID ici
    m.nom AS [Membre],
    m.type_abonnement AS [Abonnement],
    ISNULL(MAX(v.date_visite), '20000101') AS [Derniere_Visite],
    DATEDIFF(DAY, ISNULL(MAX(v.date_visite), m.date_inscription), GETDATE()) AS [Jours_Inactivite],
    ISNULL(SUM(p.montant), 0) AS [Total_Investi]
FROM 
    Membres m
LEFT JOIN 
    Visites v ON m.id_membre = v.id_membre
LEFT JOIN 
    Paiements p ON m.id_membre = p.id_membre
GROUP BY 
    m.id_membre, m.nom, m.type_abonnement, m.date_inscription;
GO
