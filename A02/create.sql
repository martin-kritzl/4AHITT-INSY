CREATE TABLE firma (
 nameFirma VARCHAR(20) NOT NULL PRIMARY KEY,
 kontaktadresse VARCHAR(50) NOT NULL,
 telefonnummer VARCHAR(20) NOT NULL
);


CREATE TABLE kunstschau (
 nameSchau VARCHAR(20) NOT NULL,
 datumSchau DATE NOT NULL,
 land VARCHAR(30) NOT NULL,
 ort VARCHAR(40) NOT NULL,

 PRIMARY KEY (nameSchau,datumSchau)
);


CREATE TABLE lager (
 bezLager VARCHAR(30) NOT NULL PRIMARY KEY,
 flaeche FLOAT(10) NOT NULL
);


CREATE TABLE maschine (
 idMaschine INT NOT NULL PRIMARY KEY,
 beschreibung VARCHAR(200) NOT NULL
);


CREATE TABLE person (
 idPerson INT NOT NULL PRIMARY KEY,
 vorname VARCHAR(20) NOT NULL,
 nachname VARCHAR(20) NOT NULL
);


CREATE TABLE produkt (
 idProdukt INT NOT NULL PRIMARY KEY,
 bezeichnung VARCHAR(50) NOT NULL,
 gewicht INT NOT NULL
);


CREATE TABLE produziert (
 idMaschine INT NOT NULL,
 idProdukt INT NOT NULL,

 PRIMARY KEY (idMaschine,idProdukt),

 FOREIGN KEY (idMaschine) REFERENCES maschine (idMaschine),
 FOREIGN KEY (idProdukt) REFERENCES produkt (idProdukt)
);


CREATE TABLE standardsortiment (
 idProdukt INT NOT NULL PRIMARY KEY,
 verkaufspreis FLOAT(10) NOT NULL,
 verpackungsart VARCHAR(30) NOT NULL,

 FOREIGN KEY (idProdukt) REFERENCES produkt (idProdukt)
);


CREATE TABLE auftrag (
 idAuftrag INT NOT NULL,
 nameFirma VARCHAR(20) NOT NULL,
 auftragsdatum DATE NOT NULL,
 akt_Status VARCHAR(20) NOT NULL,

 PRIMARY KEY (idAuftrag,nameFirma),

 FOREIGN KEY (nameFirma) REFERENCES firma (nameFirma)
);


CREATE TABLE beinhaltet (
 idAuftrag INT NOT NULL,
 nameFirma VARCHAR(20) NOT NULL,
 idProdukt INT NOT NULL,
 stueckzahl CHAR(10),

 PRIMARY KEY (idAuftrag,nameFirma,idProdukt),

 FOREIGN KEY (idAuftrag,nameFirma) REFERENCES auftrag (idAuftrag,nameFirma),
 FOREIGN KEY (idProdukt) REFERENCES produkt (idProdukt)
);


CREATE TABLE kuenstler (
 idPerson INT NOT NULL PRIMARY KEY,
 bekanntheitsgrad INT NOT NULL,

 FOREIGN KEY (idPerson) REFERENCES person (idPerson)
);


CREATE TABLE kunstwerk (
 idProdukt INT NOT NULL PRIMARY KEY,
 schaetzwert FLOAT(10) NOT NULL,
 idPerson INT,

 FOREIGN KEY (idProdukt) REFERENCES produkt (idProdukt),
 FOREIGN KEY (idPerson) REFERENCES kuenstler (idPerson)
);


CREATE TABLE lagert (
 bezLager VARCHAR(30) NOT NULL,
 idProdukt INT NOT NULL,
 stueckzahl CHAR(10),

 PRIMARY KEY (bezLager,idProdukt),

 FOREIGN KEY (bezLager) REFERENCES lager (bezLager),
 FOREIGN KEY (idProdukt) REFERENCES produkt (idProdukt)
);


CREATE TABLE mitarbeiter (
 idPerson INT NOT NULL PRIMARY KEY,
 einstellungsdatum DATE NOT NULL,

 FOREIGN KEY (idPerson) REFERENCES person (idPerson)
);


CREATE TABLE verwaltet (
 idPerson INT NOT NULL,
 bezLager VARCHAR(30) NOT NULL,

 PRIMARY KEY (idPerson,bezLager),

 FOREIGN KEY (idPerson) REFERENCES mitarbeiter (idPerson),
 FOREIGN KEY (bezLager) REFERENCES lager (bezLager)
);


CREATE TABLE arbeitet (
 idPerson INT NOT NULL,
 idMaschine INT NOT NULL,

 PRIMARY KEY (idPerson,idMaschine),

 FOREIGN KEY (idPerson) REFERENCES mitarbeiter (idPerson),
 FOREIGN KEY (idMaschine) REFERENCES maschine (idMaschine)
);


CREATE TABLE ausstellung (
 nameSchau VARCHAR(20) NOT NULL,
 datumSchau DATE NOT NULL,
 idProdukt INT NOT NULL,
 rang INT,

 PRIMARY KEY (nameSchau,datumSchau,idProdukt),

 FOREIGN KEY (nameSchau,datumSchau) REFERENCES kunstschau (nameSchau,datumSchau),
 FOREIGN KEY (idProdukt) REFERENCES kunstwerk (idProdukt)
);


CREATE TABLE kuendigung (
 idPerson INT NOT NULL PRIMARY KEY,
 kuendigungsdatum DATE NOT NULL,

 FOREIGN KEY (idPerson) REFERENCES mitarbeiter (idPerson)
);


