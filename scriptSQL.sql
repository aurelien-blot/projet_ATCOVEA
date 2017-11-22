#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

DROP DATABASE IF EXISTS swat_db;
CREATE DATABASE swat_db CHARACTER SET 'utf8';
USE swat_db;

#------------------------------------------------------------
# Table: Demande
#------------------------------------------------------------

CREATE TABLE Demande(
        id_demande                 Int NOT NULL ,
        code_affaire_demande       Varchar (9) ,
        libelle_demande            Varchar (50) ,
        date_debut_demande         Date ,
        date_fin_demande           Date ,
        contexte_demande           Varchar (150) ,
        details_prestation_demande Varchar (300) ,
        statut_demande             Varchar (25) ,
        zone_geograpique           Varchar (25) ,
        id_interloc_technique      Int NOT NULL ,
        id_interet                 Int NOT NULL ,
        id_acheteur                Int ,
        PRIMARY KEY (id_demande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Interlocuteur_technique
#------------------------------------------------------------

CREATE TABLE Interlocuteur_technique(
        id_interloc_technique   Int NOT NULL ,
        nom_interloc_technique  Varchar (25) ,
        mail_interloc_technique Varchar (100) ,
        tel_interloc_technique  Int ,
        PRIMARY KEY (id_interloc_technique )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: reponse
#------------------------------------------------------------

CREATE TABLE reponse(
        id_reponse            Int NOT NULL ,
        sous_traitant_reponse Bool ,
        nb_jours              Int ,
        taux_journalier       Double ,
        date_debut            Date ,
        date_fin              Date ,
        id_demande            Int NOT NULL ,
        PRIMARY KEY (id_reponse )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: developpeur
#------------------------------------------------------------

CREATE TABLE developpeur(
        id_developpeur          Int NOT NULL ,
        nom_developpeur         Varchar (25) ,
        prenom_developpeur      Varchar (25) ,
        competences_developpeur Varchar (300) ,
        cv                      Varchar (100) ,
        PRIMARY KEY (id_developpeur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: interet
#------------------------------------------------------------

CREATE TABLE interet(
        id_interet      int (11) Auto_increment  NOT NULL ,
        libelle_interet Varchar (25) ,
        PRIMARY KEY (id_interet )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: user
#------------------------------------------------------------

CREATE TABLE user(
        id_user          int (11) Auto_increment  NOT NULL ,
        identifiant_user Varchar (25) NOT NULL ,
        password_user    Varchar (25) ,
        PRIMARY KEY (id_user ) ,
        UNIQUE (identifiant_user )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: droit
#------------------------------------------------------------

CREATE TABLE droit(
        id_droit      int (11) Auto_increment  NOT NULL ,
        creer         Bool ,
        editer        Bool ,
        supprimer     Bool ,
        repondre      Bool ,
        consulter     Bool ,
        id_type_droit Int NOT NULL ,
        PRIMARY KEY (id_droit )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: type_droit
#------------------------------------------------------------

CREATE TABLE type_droit(
        id_type_droit      int (11) Auto_increment  NOT NULL ,
        libelle_type_droit Varchar (25) ,
        PRIMARY KEY (id_type_droit )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: acheteur
#------------------------------------------------------------

CREATE TABLE acheteur(
        id_acheteur     int (11) Auto_increment  NOT NULL ,
        nom_acheteur    Varchar (25) ,
        prenom_acheteur Varchar (25) ,
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


#------------------------------------------------------------
# Table: avoir
#------------------------------------------------------------

CREATE TABLE avoir(
        id_droit Int NOT NULL ,
        id_user  Int NOT NULL ,
        PRIMARY KEY (id_droit ,id_user )
)ENGINE=InnoDB;

ALTER TABLE Demande ADD CONSTRAINT FK_Demande_id_interloc_technique FOREIGN KEY (id_interloc_technique) REFERENCES Interlocuteur_technique(id_interloc_technique);
ALTER TABLE Demande ADD CONSTRAINT FK_Demande_id_interet FOREIGN KEY (id_interet) REFERENCES interet(id_interet);
ALTER TABLE Demande ADD CONSTRAINT FK_Demande_id_acheteur FOREIGN KEY (id_acheteur) REFERENCES acheteur(id_acheteur);
ALTER TABLE reponse ADD CONSTRAINT FK_reponse_id_demande FOREIGN KEY (id_demande) REFERENCES Demande(id_demande);
ALTER TABLE droit ADD CONSTRAINT FK_droit_id_type_droit FOREIGN KEY (id_type_droit) REFERENCES type_droit(id_type_droit);
ALTER TABLE retenir ADD CONSTRAINT FK_retenir_id_reponse FOREIGN KEY (id_reponse) REFERENCES reponse(id_reponse);
ALTER TABLE retenir ADD CONSTRAINT FK_retenir_id_developpeur FOREIGN KEY (id_developpeur) REFERENCES developpeur(id_developpeur);
ALTER TABLE avoir ADD CONSTRAINT FK_avoir_id_droit FOREIGN KEY (id_droit) REFERENCES droit(id_droit);
ALTER TABLE avoir ADD CONSTRAINT FK_avoir_id_user FOREIGN KEY (id_user) REFERENCES user(id_user);
