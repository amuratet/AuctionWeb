---------------------------------------------------------------------
 ----------------- !!! À MODIFIER !!! -------------------------------
---------------------------------------------------------------------


-- On ajoute la colonne pour le path des photos upload
ALTER TABLE ARTICLES_VENDUS ADD photo VARCHAR(100) NULL;


-- On ajoute à CATEGORIES un nom 'alla francese' pour afficher dans les combos
ALTER TABLE CATEGORIES ADD nomFr VARCHAR(30) NULL;
UPDATE CATEGORIES SET nomFr = 'Informatique'	WHERE libelle = 'informatique';
UPDATE CATEGORIES SET nomFr = 'Électroménager'	WHERE libelle = 'electromenager';
UPDATE CATEGORIES SET nomFr = 'Petit Matériel'	WHERE libelle = 'petitMateriel';
UPDATE CATEGORIES SET nomFr = 'Gros Matériel'	WHERE libelle = 'grosMateriel';
UPDATE CATEGORIES SET nomFr = 'Outillage'		WHERE libelle = 'outillage';
UPDATE CATEGORIES SET nomFr = 'Jardinage'		WHERE libelle = 'jardinage';
UPDATE CATEGORIES SET nomFr = 'Livres'			WHERE libelle = 'livres';
UPDATE CATEGORIES SET nomFr = 'Automobile' 		WHERE libelle = 'automobile';
-- On ajoute la contrainte NOT NULL
ALTER TABLE CATEGORIES ALTER COLUMN nomFr VARCHAR(30) NOT NULL;