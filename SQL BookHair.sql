#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: T_utilisateur
#------------------------------------------------------------

CREATE TABLE T_utilisateur(
        ID_utilisateur     int (11) Auto_increment  NOT NULL ,
        nom_utilisateur    Varchar (25) ,
        prenom_utilisateur Varchar (25) ,
        mail_utilisateur   Varchar (25) ,
        mdp_utilisateur    Varchar (25) ,
        etat_utilisateur   Bool ,
        ID_role            Int ,
        PRIMARY KEY (ID_utilisateur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: T_salon
#------------------------------------------------------------

CREATE TABLE T_salon(
        ID_salon     int (11) Auto_increment  NOT NULL ,
        nom_salon    Varchar (25) ,
        rue_salon    Varchar (225) ,
        cp_salon     Int ,
        ville_salon  Varchar (25) ,
        nbrEmp_salon Int ,
        etat_salon   Bool ,
        PRIMARY KEY (ID_salon )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: T_type
#------------------------------------------------------------

CREATE TABLE T_type(
        ID_type      int (11) Auto_increment  NOT NULL ,
        libelle_type Varchar (25) ,
        PRIMARY KEY (ID_type )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: T_dispo
#------------------------------------------------------------

CREATE TABLE T_dispo(
        ID_dispo      int (11) Auto_increment  NOT NULL ,
        horaire_dispo Datetime ,
        PRIMARY KEY (ID_dispo )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: T_role
#------------------------------------------------------------

CREATE TABLE T_role(
        ID_role      int (11) Auto_increment  NOT NULL ,
        libelle_role Varchar (25) ,
        PRIMARY KEY (ID_role )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: T_droit
#------------------------------------------------------------

CREATE TABLE T_droit(
        ID_role       int (11) Auto_increment  NOT NULL ,
        libelle_droit Varchar (25) ,
        PRIMARY KEY (ID_role )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Travailler
#------------------------------------------------------------

CREATE TABLE Travailler(
        ID_utilisateur Int NOT NULL ,
        ID_salon       Int NOT NULL ,
        PRIMARY KEY (ID_utilisateur ,ID_salon )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Définir
#------------------------------------------------------------

CREATE TABLE Definir(
        ID_type  Int NOT NULL ,
        ID_salon Int NOT NULL ,
        PRIMARY KEY (ID_type ,ID_salon )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: être disponible
#------------------------------------------------------------

CREATE TABLE etre_disponible(
        ID_salon Int NOT NULL ,
        ID_dispo Int NOT NULL ,
        PRIMARY KEY (ID_salon ,ID_dispo )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: être pourvu
#------------------------------------------------------------

CREATE TABLE etre_pourvu(
        ID_role         Int NOT NULL ,
        ID_role_T_droit Int NOT NULL ,
        PRIMARY KEY (ID_role ,ID_role_T_droit )
)ENGINE=InnoDB;

ALTER TABLE T_utilisateur ADD CONSTRAINT FK_T_utilisateur_ID_role FOREIGN KEY (ID_role) REFERENCES T_role(ID_role);
ALTER TABLE Travailler ADD CONSTRAINT FK_Travailler_ID_utilisateur FOREIGN KEY (ID_utilisateur) REFERENCES T_utilisateur(ID_utilisateur);
ALTER TABLE Travailler ADD CONSTRAINT FK_Travailler_ID_salon FOREIGN KEY (ID_salon) REFERENCES T_salon(ID_salon);
ALTER TABLE Definir ADD CONSTRAINT FK_Definir_ID_type FOREIGN KEY (ID_type) REFERENCES T_type(ID_type);
ALTER TABLE Definir ADD CONSTRAINT FK_Definir_ID_salon FOREIGN KEY (ID_salon) REFERENCES T_salon(ID_salon);
ALTER TABLE etre_disponible ADD CONSTRAINT FK_etre_disponible_ID_salon FOREIGN KEY (ID_salon) REFERENCES T_salon(ID_salon);
ALTER TABLE etre_disponible ADD CONSTRAINT FK_etre_disponible_ID_dispo FOREIGN KEY (ID_dispo) REFERENCES T_dispo(ID_dispo);
ALTER TABLE etre_pourvu ADD CONSTRAINT FK_etre_pourvu_ID_role FOREIGN KEY (ID_role) REFERENCES T_role(ID_role);
ALTER TABLE etre_pourvu ADD CONSTRAINT FK_etre_pourvu_ID_role_T_droit FOREIGN KEY (ID_role_T_droit) REFERENCES T_droit(ID_role);
