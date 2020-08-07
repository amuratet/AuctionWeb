---------------------------------------------------------------------
 ----------------- !!! À MODIFIER !!! -------------------------------
---------------------------------------------------------------------


-- On ajoute la colonne pour le path des photos upload
ALTER TABLE ARTICLES_VENDUS ADD photo VARCHAR(100) NULL;


INSERT INTO CATEGORIES VALUES ('informatique');
INSERT INTO CATEGORIES VALUES ('electromenager');
INSERT INTO CATEGORIES VALUES ('petitMateriel');
INSERT INTO CATEGORIES VALUES ('grosMateriel');
INSERT INTO CATEGORIES VALUES ('outillage');
INSERT INTO CATEGORIES VALUES ('jardinage');
INSERT INTO CATEGORIES VALUES ('livres');
INSERT INTO CATEGORIES VALUES ('automobile');

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



---------------------------------------------------------------------
 -----------------       À INSÉRER    -------------------------------
---------------------------------------------------------------------

INSERT INTO UTILISATEURS (pseudo,nom,prenom,email,telephone,rue,code_postal,ville,mot_de_passe,credit,administrateur)
    VALUES('Toto', 'Doe', 'John', 'hello@hello.com', '0606060606', '18, rue Léon Blum', '85000', 'La Roche', 'password', 250, 0);
INSERT INTO UTILISATEURS (pseudo,nom,prenom,email,telephone,rue,code_postal,ville,mot_de_passe,credit,administrateur)
    VALUES('Titi', 'Dalton', 'Avrell', 'adalton@gmail.com', '0605050505', '10, rue De Gaulle', '75018', 'Paris', 'password', 150, 0);
INSERT INTO UTILISATEURS (pseudo,nom,prenom,email,telephone,rue,code_postal,ville,mot_de_passe,credit,administrateur)
    VALUES('Gnome35', 'Durant', 'Jamy', 'jdurant@gmaillo.com', '0601010101', '1, rue du moulin', '69002', 'Lyon', 'password', 50, 0);
INSERT INTO UTILISATEURS (pseudo,nom,prenom,email,telephone,rue,code_postal,ville,mot_de_passe,credit,administrateur)
    VALUES('Cluster', 'Marnetto', 'Victor', 'vmarnetto@gmail.com', '0602020202', '8, rue du chemin', '85000', 'La Roche', 'password', 2050, 0);
INSERT INTO UTILISATEURS (pseudo,nom,prenom,email,telephone,rue,code_postal,ville,mot_de_passe,credit,administrateur)
    VALUES('GuyzmoGwaï', 'Blaud', 'Lewis', 'lblaud@gmail.com', '0603030303', '5, allée des fleurs bleues', '85150', 'Ste Florence', 'password', 2500, 0);
INSERT INTO UTILISATEURS (pseudo,nom,prenom,email,telephone,rue,code_postal,ville,mot_de_passe,credit,administrateur)
    VALUES('Alk', 'Muratet', 'Amilcar', 'amuratet@gmail.com', '0604040404', '7, chemin des grands champs', '85145', 'Boulogne', 'password', 750, 0);
INSERT INTO UTILISATEURS (pseudo,nom,prenom,email,telephone,rue,code_postal,ville,mot_de_passe,credit,administrateur)
    VALUES('TheBoss', 'Bonaparte', 'Napoléon', 'nbonaparte@gmail.com', '0608080808', '80, rue des Dieux', '75001', 'Paris', 'password', 10000, 0);



INSERT INTO ARTICLES_VENDUS (nom_article, description ,date_debut_encheres ,date_fin_encheres ,prix_initial ,prix_vente ,no_utilisateur ,no_categorie)
    VALUES ('ASUS G11CD',
            'Un ordinateur tour, livré sans écran, USB 3.1, Suite logicielle Fruity Loops et Wavelab (!logiciels euh... non enregistrables). Souris & clavier lumineux. Très bon état',
            '2020-08-02', '2020-08-09', 55, 79, 1, (SELECT no_categorie FROM CATEGORIES WHERE libelle = 'informatique'));

INSERT INTO ARTICLES_VENDUS (nom_article, description ,date_debut_encheres ,date_fin_encheres ,prix_initial ,prix_vente ,no_utilisateur ,no_categorie)
    VALUES ('DELL XPS 300', 'Un ordinateur portable pour les gamers, livré avec Call of Duty et bien d''autres jeux',
            '2015-12-17', '2015-12-17', 55, 79, 1, (SELECT no_categorie FROM CATEGORIES WHERE libelle = 'informatique'));

INSERT INTO ARTICLES_VENDUS (nom_article, description ,date_debut_encheres ,date_fin_encheres ,prix_initial ,prix_vente ,no_utilisateur ,no_categorie)
    VALUES ('Lenovo Ideapad', 'Viré de mon travail, j''ai décidé de vendre mon ordinateur de bureau, environnement Java installé etc. 15,6''FHD - Intel Core i5-9300HF - RAM 8Go - Stockage 256Go SSD - GTX 1650 4Go',
        '2020-08-04', '2020-08-11', 55, 79, 2, (SELECT no_categorie FROM CATEGORIES WHERE libelle = 'informatique'));
        
INSERT INTO ARTICLES_VENDUS (nom_article, description ,date_debut_encheres ,date_fin_encheres ,prix_initial ,prix_vente ,no_utilisateur ,no_categorie)
    VALUES ('PARKSIDE® Agrafeuse PET 25 C3', 'Neuf: Objet neuf et intact, n''ayant jamais servi, non ouvert, vendu dans son emballage d''origine (lorsqu''il y en a un).',
        '2020-08-05', '2020-08-12', 55, 79, 4, (SELECT no_categorie FROM CATEGORIES WHERE libelle = 'outillage'));
        
INSERT INTO ARTICLES_VENDUS (nom_article, description ,date_debut_encheres ,date_fin_encheres ,prix_initial ,prix_vente ,no_utilisateur ,no_categorie)
    VALUES ('Dyson V6 Car', 'Produit neuf, garantie et vendu par le fabricant donc il n''existe pas mieux. Accessoires très efficaces hormis la brosse qui n''abîme pas les textiles mais frotte pas assez fort les poils d''animaux d''après mon avis.',
        '2020-08-02', '2020-08-09', 90, 179, 4, (SELECT no_categorie FROM CATEGORIES WHERE libelle = 'electromenager'));
        
INSERT INTO ARTICLES_VENDUS (nom_article, description ,date_debut_encheres ,date_fin_encheres ,prix_initial ,prix_vente ,no_utilisateur ,no_categorie)
    VALUES ('Land Rover Discovery', 'Sport L550 20 x 8J style 511 Noir Roue Alliage FK7M-1007-MB. Occasion: Objet ayant été utilisé. objet présentant quelques marques',
        '2020-08-01', '2020-08-08', 200, 355, 5, (SELECT no_categorie FROM CATEGORIES WHERE libelle = 'automobile'));
        
INSERT INTO ARTICLES_VENDUS (nom_article, description ,date_debut_encheres ,date_fin_encheres ,prix_initial ,prix_vente ,no_utilisateur ,no_categorie)
    VALUES ('Varan EU2 3CV 52CC', 'Tarière Thermique Essence avec 3 Sabots de Forage (TT-GD520-EU2). Recevez cet objet avant le lun., lun. 10 août - jeu., jeu. 13 août de Weiswampach, Luxembourg',
        '2020-08-02', '2020-08-09', 110, 150, 6, (SELECT no_categorie FROM CATEGORIES WHERE libelle = 'jardinage'));
        
INSERT INTO ARTICLES_VENDUS (nom_article, description ,date_debut_encheres ,date_fin_encheres ,prix_initial ,prix_vente ,no_utilisateur ,no_categorie)
    VALUES ('AMERICAIN WW2', 'Petit lot de matériel US boite impregnite shoes, cirage, dentifrice en poudre crème à raser Burma Shave ,bougie de campagne, pansement , boite de préservatifs  et boite de punaises état correct',
        '2020-08-04', '2020-08-11', 30, 82, 7, (SELECT no_categorie FROM CATEGORIES WHERE libelle = 'petitMateriel'));
        
INSERT INTO ARTICLES_VENDUS (nom_article, description ,date_debut_encheres ,date_fin_encheres ,prix_initial ,prix_vente ,no_utilisateur ,no_categorie)
    VALUES ('Yu gi oh', 'petit lot de 53 cartes fusion et matériel',
        '2020-08-01', '2020-08-18', 35, 77, 7, (SELECT no_categorie FROM CATEGORIES WHERE libelle = 'petitMateriel'));
        
INSERT INTO ARTICLES_VENDUS (nom_article, description ,date_debut_encheres ,date_fin_encheres ,prix_initial ,prix_vente ,no_utilisateur ,no_categorie)
    VALUES ('Livres anciens', 'Un très joli lot de 19 livres de prix anciens datant du XIXème et XXème siècle. À travers les Alpes autrichiennes Maurice Grandjean 1896',
        '2020-08-05', '2020-08-12', 40, 80, 9, (SELECT no_categorie FROM CATEGORIES WHERE libelle = 'livres'));
        
INSERT INTO ARTICLES_VENDUS (nom_article, description ,date_debut_encheres ,date_fin_encheres ,prix_initial ,prix_vente ,no_utilisateur ,no_categorie)
    VALUES ('Clé a choc pneumatique', 'gros matériel 1 in 25.4 mm Poid lourd. Très bon état',
        '2020-08-03', '2020-08-10', 55, 79, 6, (SELECT no_categorie FROM CATEGORIES WHERE libelle = 'grosMateriel'));
        
        
        



