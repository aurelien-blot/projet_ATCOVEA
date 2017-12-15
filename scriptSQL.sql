#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

#------------------------------------------------------------
# DataBase : swat_db
#------------------------------------------------------------

DROP DATABASE IF EXISTS swat_db;
CREATE DATABASE swat_db CHARACTER SET 'utf8';
USE swat_db;

#------------------------------------------------------------
# Table: Demande
#------------------------------------------------------------

CREATE TABLE demande(
        id_demande                 Int (11) Auto_increment  NOT NULL ,
	intitule_demande           Varchar (30) ,
        code_affaire_demande       Varchar (9) ,
        libelle_demande            Varchar (50) ,
        date_debut_demande         Date ,
        date_fin_demande           Date ,
        contexte_demande           Varchar (150) ,
        details_prestation_demande Varchar (300) ,
        statut_demande             Varchar (25) ,
        zone_geographique          Varchar (25) ,
        id_interloc_technique      Int NOT NULL ,
        id_interet                 Int NOT NULL ,
        id_acheteur                Int NOT NULL ,
        id_statut	           Int NOT NULL ,
        PRIMARY KEY (id_demande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: statut
#------------------------------------------------------------

CREATE TABLE statut(
		id_statut		Int(11) Auto_increment NOT NULL ,
		libelle_statut          Varchar (25),
		PRIMARY KEY (id_statut)
)ENGINE=InnoDB;
#------------------------------------------------------------
# Table: Interlocuteur_technique
#------------------------------------------------------------

CREATE TABLE interlocuteur_technique(
        id_interloc_technique   Int (11) Auto_increment  NOT NULL  ,
        nom_interloc_technique  Varchar (25) ,
        prenom_interloc_technique Varchar (25) ,
        mail_interloc_technique Varchar (100) ,
        tel_interloc_technique  Varchar (25) ,
        PRIMARY KEY (id_interloc_technique )
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: Interlocuteur_technique
#------------------------------------------------------------

CREATE TABLE interlocuteur_technique_cgi(
        id_interloc_technique_cgi   Int (11) Auto_increment  NOT NULL  ,
        nom_interloc_technique_cgi  Varchar (25) ,
        prenom_interloc_technique_cgi Varchar (25) ,
        mail_interloc_technique_cgi Varchar (100) ,
        tel_interloc_technique_cgi  Varchar (25) ,
        PRIMARY KEY (id_interloc_technique_cgi )
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: reponse
#------------------------------------------------------------

CREATE TABLE reponse(
        id_reponse            Int (11) Auto_increment  NOT NULL ,
        sous_traitant_reponse Boolean ,
        nb_jours              Int (4) ,
        taux_journalier       Float (6,2),
        date_debut            Date ,
        date_fin              Date ,
        id_demande            Int NOT NULL ,
        id_interloc_technique_cgi int NOT NULL,
        PRIMARY KEY (id_reponse )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: developpeur
#------------------------------------------------------------

CREATE TABLE developpeur(
        id_developpeur          Int (11) Auto_increment  NOT NULL  ,
        nom_developpeur         Varchar (25) ,
        prenom_developpeur      Varchar (25) ,
        competences_developpeur Varchar (300) ,
        mail_developpeur        Varchar (100) ,
        cv                      Varchar (100) ,
        PRIMARY KEY (id_developpeur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: interet
#------------------------------------------------------------

CREATE TABLE interet(
        id_interet      Int (11) Auto_increment  NOT NULL ,
        libelle_interet Varchar (25) ,
        PRIMARY KEY (id_interet )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: user
#------------------------------------------------------------

CREATE TABLE user(
        id_user          Int (11) Auto_increment  NOT NULL ,
        identifiant_user Varchar (25) NOT NULL ,
        password_user    Varchar (60) ,
	token       	 Varchar (60) ,
        id_groupe_droit         Int NOT NULL ,
        PRIMARY KEY (id_user ) ,
        UNIQUE (identifiant_user )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: groupe_droit
#------------------------------------------------------------
CREATE TABLE groupe_droit(
        id_groupe_droit         int (11) Auto_increment  NOT NULL ,
        nom_groupe_droit Varchar (25) ,
        PRIMARY KEY (id_groupe_droit )
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: droit
#------------------------------------------------------------

CREATE TABLE droit(
        id_droit         int (11) Auto_increment  NOT NULL ,
        nom_droit Varchar (25) ,
        PRIMARY KEY (id_droit )
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: droit
#------------------------------------------------------------

CREATE TABLE attribution_droit(
        id_attribution   int (11) Auto_increment NOT NULL ,
        id_droit         int NOT NULL,
        id_groupe_droit  int NOT NULL,
        id_nom_table     int NOT NULL,
        PRIMARY KEY (id_attribution)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: droit
#------------------------------------------------------------

CREATE TABLE nom_table(
        id_nom_table     int (11) Auto_increment NOT NULL ,
        nom_table        Varchar (60),
        PRIMARY KEY (id_nom_table)
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: acheteur
#------------------------------------------------------------

CREATE TABLE acheteur(
        id_acheteur     int (11) Auto_increment  NOT NULL ,
        nom_acheteur    Varchar (25) ,
        prenom_acheteur Varchar (25) ,
	mail_acheteur	Varchar (100) ,
        PRIMARY KEY (id_acheteur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: retenir
#------------------------------------------------------------

CREATE TABLE retenir(
        id_reponse     Int NOT NULL ,
        id_developpeur Int NOT NULL ,
        PRIMARY KEY (id_reponse ,id_developpeur )
)ENGINE=InnoDB;

ALTER TABLE demande ADD CONSTRAINT FK_demande_id_interloc_technique FOREIGN KEY (id_interloc_technique) REFERENCES interlocuteur_technique(id_interloc_technique);
ALTER TABLE demande ADD CONSTRAINT FK_demande_id_interet FOREIGN KEY (id_interet) REFERENCES interet(id_interet);
ALTER TABLE demande ADD CONSTRAINT FK_demande_id_statut FOREIGN KEY (id_statut) REFERENCES statut(id_statut);
ALTER TABLE demande ADD CONSTRAINT FK_demande_id_acheteur FOREIGN KEY (id_acheteur) REFERENCES acheteur(id_acheteur);
ALTER TABLE reponse ADD CONSTRAINT FK_reponse_id_demande FOREIGN KEY (id_demande) REFERENCES demande(id_demande);
ALTER TABLE reponse ADD CONSTRAINT FK_reponse_id_interloc_technique_cgi FOREIGN KEY (id_interloc_technique_cgi) REFERENCES interlocuteur_technique_cgi(id_interloc_technique_cgi);
ALTER TABLE user ADD CONSTRAINT FK_user_id_groupe_droit FOREIGN KEY (id_groupe_droit) REFERENCES groupe_droit(id_groupe_droit);
ALTER TABLE retenir ADD CONSTRAINT FK_retenir_id_reponse FOREIGN KEY (id_reponse) REFERENCES reponse(id_reponse);
ALTER TABLE retenir ADD CONSTRAINT FK_retenir_id_developpeur FOREIGN KEY (id_developpeur) REFERENCES developpeur(id_developpeur);
ALTER TABLE attribution_droit ADD CONSTRAINT FK_attribution_id_droit FOREIGN KEY (id_droit) REFERENCES droit(id_droit);
ALTER TABLE attribution_droit ADD CONSTRAINT FK_attribution_id_groupe_droit FOREIGN KEY (id_groupe_droit) REFERENCES groupe_droit(id_groupe_droit);
ALTER TABLE attribution_droit ADD CONSTRAINT FK_attribution_id_nom_table FOREIGN KEY (id_nom_table) REFERENCES nom_table(id_nom_table);
