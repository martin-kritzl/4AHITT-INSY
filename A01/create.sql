CREATE TABLE firma (
 name VARCHAR(20) NOT NULL PRIMARY KEY,
 kontakadresse VARCHAR(50) NOT NULL,
 telefonnummer VARCHAR(20) NOT NULL
);


CREATE TABLE kunstschau (
 name VARCHAR(20) NOT NULL,
 datum DATE NOT NULL,
 land VARCHAR(30) NOT NULL,
 ort VARCHAR(40) NOT NULL,

 PRIMARY KEY (name,datum)
);


CREATE TABLE lager (
 bezeichnung VARCHAR(30) NOT NULL PRIMARY KEY,
 flaeche FLOAT(10) NOT NULL
);


CREATE TABLE maschine (
 id INT NOT NULL PRIMARY KEY,
 beschreibung VARCHAR(200) NOT NULL
);


CREATE TABLE person (
 id INT NOT NULL PRIMARY KEY,
 vorname VARCHAR(20) NOT NULL,
 nachname VARCHAR(20) NOT NULL
);


CREATE TABLE produkt (
 id INT NOT NULL PRIMARY KEY,
 bezeichnung VARCHAR(50) NOT NULL,
 gewicht INT NOT NULL
);


CREATE TABLE produziert (
 idMaschine INT NOT NULL,
 idProdukt INT NOT NULL,

 PRIMARY KEY (idMaschine,idProdukt),

 FOREIGN KEY (idMaschine) REFERENCES maschine (id),
 FOREIGN KEY (idProdukt) REFERENCES produkt (id)
);


CREATE TABLE standardsortiment (
 idProdukt INT NOT NULL PRIMARY KEY,
 verkaufspreis FLOAT(10) NOT NULL,
 verpackungsart VARCHAR(30) NOT NULL,

 FOREIGN KEY (idProdukt) REFERENCES produkt (id)
);


CREATE TABLE auftrag (
 id INT NOT NULL,
 nameFirma VARCHAR(20) NOT NULL,
 auftragsdatum DATE NOT NULL,
 akt_Status VARCHAR(20) NOT NULL,

 PRIMARY KEY (id,nameFirma),

 FOREIGN KEY (nameFirma) REFERENCES firma (name)
);


CREATE TABLE beinhaltet (
 idAuftrag INT NOT NULL,
 nameFirma VARCHAR(20) NOT NULL,
 idProdukt INT NOT NULL,
 stueckzahl CHAR(10),

 PRIMARY KEY (idAuftrag,nameFirma,idProdukt),

 FOREIGN KEY (idAuftrag,nameFirma) REFERENCES auftrag (id,nameFirma),
 FOREIGN KEY (idProdukt) REFERENCES produkt (id)
);


CREATE TABLE kuenstler (
 idPerson INT NOT NULL PRIMARY KEY,
 bekanntheitsgrad INT NOT NULL,

 FOREIGN KEY (idPerson) REFERENCES person (id)
);


CREATE TABLE kunstwerk (
 idProdukt INT NOT NULL PRIMARY KEY,
 schaetzwert FLOAT(10) NOT NULL,
 idKuenstler INT,

 FOREIGN KEY (idProdukt) REFERENCES produkt (id),
 FOREIGN KEY (idKuenstler) REFERENCES kuenstler (idPerson)
);


CREATE TABLE lagert (
 bezLager VARCHAR(30) NOT NULL,
 id INT NOT NULL,
 stueckzahl CHAR(10),

 PRIMARY KEY (bezLager,id),

 FOREIGN KEY (bezLager) REFERENCES lager (bezeichnung),
 FOREIGN KEY (id) REFERENCES produkt (id)
);


CREATE TABLE mitarbeiter (
 idPerson INT NOT NULL PRIMARY KEY,
 einstellungsdatum DATE NOT NULL,

 FOREIGN KEY (idPerson) REFERENCES person (id)
);


CREATE TABLE verwaltet (
 idPerson INT NOT NULL,
 bezLager VARCHAR(30) NOT NULL,

 PRIMARY KEY (idPerson,bezLager),

 FOREIGN KEY (idPerson) REFERENCES mitarbeiter (idPerson),
 FOREIGN KEY (bezLager) REFERENCES lager (bezeichnung)
);


CREATE TABLE arbeitet (
 idMitarbeiter INT NOT NULL,
 idMaschine INT NOT NULL,

 PRIMARY KEY (idMitarbeiter,idMaschine),

 FOREIGN KEY (idMitarbeiter) REFERENCES mitarbeiter (idPerson),
 FOREIGN KEY (idMaschine) REFERENCES maschine (id)
);


CREATE TABLE ausstellung (
 nameSchau VARCHAR(20) NOT NULL,
 datum DATE NOT NULL,
 idKunstwerk INT NOT NULL,
 rang INT,

 PRIMARY KEY (nameSchau,datum,idKunstwerk),

 FOREIGN KEY (nameSchau,datum) REFERENCES kunstschau (name,datum),
 FOREIGN KEY (idKunstwerk) REFERENCES kunstwerk (idProdukt)
);


CREATE TABLE kuendigung (
 idPerson INT NOT NULL PRIMARY KEY,
 kuendigungsdatum DATE NOT NULL,

 FOREIGN KEY (idPerson) REFERENCES mitarbeiter (idPerson)
);


