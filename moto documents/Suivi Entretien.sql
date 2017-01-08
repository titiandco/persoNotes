#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Client
#------------------------------------------------------------
CREATE SCHEMA `suivi entretien` ;

CREATE TABLE Client(
        cli_id          int (11) Auto_increment  NOT NULL ,
        cli_nom         Varchar (25) NOT NULL ,
        cli_penom       Varchar (25) NOT NULL ,
        cli_adresse     Varchar (200) NOT NULL ,
        cli_code_postal Numeric NOT NULL ,
        cli_ville       Varchar (50) NOT NULL ,
        cli_telephone   Numeric NOT NULL ,
        cli_mail        Varchar (50) NOT NULL ,
        PRIMARY KEY (cli_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: moto
#------------------------------------------------------------

CREATE TABLE moto(
        mto_id        int (11) Auto_increment  NOT NULL ,
        mto_annee     Numeric NOT NULL ,
        cli_id        Int NOT NULL ,
        typ_id        Int NOT NULL ,
        ope_id        Int NOT NULL ,
        eff_date      Date NOT NULL ,
        eff_kilometre Int NOT NULL ,
        int_id        Int NOT NULL ,
        PRIMARY KEY (mto_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: operation_type
#------------------------------------------------------------

CREATE TABLE operation_type(
        ope_id          int (11) Auto_increment  NOT NULL ,
        ope_designation Varchar (50) NOT NULL ,
        ope_intervalle  Numeric NOT NULL ,
        typ_id          Int NOT NULL ,
        int_id          Int NOT NULL ,
        PRIMARY KEY (ope_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: type
#------------------------------------------------------------

CREATE TABLE type(
        typ_id     int (11) Auto_increment  NOT NULL ,
        typ_modele Varchar (25) NOT NULL ,
        typ_marque Varchar (25) NOT NULL ,
        PRIMARY KEY (typ_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: intervention
#------------------------------------------------------------

CREATE TABLE intervention(
        int_id          int (11) Auto_increment  NOT NULL ,
        int_commentaire Varchar (50) NOT NULL ,
        PRIMARY KEY (int_id )
)ENGINE=InnoDB;

ALTER TABLE moto ADD CONSTRAINT FK_moto_cli_id FOREIGN KEY (cli_id) REFERENCES Client(cli_id);
ALTER TABLE moto ADD CONSTRAINT FK_moto_typ_id FOREIGN KEY (typ_id) REFERENCES type(typ_id);
ALTER TABLE moto ADD CONSTRAINT FK_moto_ope_id FOREIGN KEY (ope_id) REFERENCES operation_type(ope_id);
ALTER TABLE moto ADD CONSTRAINT FK_moto_int_id FOREIGN KEY (int_id) REFERENCES intervention(int_id);
ALTER TABLE operation_type ADD CONSTRAINT FK_operation_type_typ_id FOREIGN KEY (typ_id) REFERENCES type(typ_id);
ALTER TABLE operation_type ADD CONSTRAINT FK_operation_type_int_id FOREIGN KEY (int_id) REFERENCES intervention(int_id);
