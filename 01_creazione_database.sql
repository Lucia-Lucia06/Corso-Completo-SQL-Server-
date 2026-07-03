CREATE DATABASE scuolaDb;
Go

-- chiamata(uso) del database -> ScuolaDb
USE ScuolaDb;


/*
	Tipi di dati comuni SQL

	|tipo	  |	valore   |
	|---------|----------|
	| INT	  | INTERO   |
	|VARCHAR  | TESTO	 |
	|NVARCHAR | TESTO    |
	|DATE     | DATA     |
	|FLOAT    | DECIMALE |

	/*
	Tipi di dati comuni SQL

	|tipo	  |	valore   |
	|---------|----------|
	| INT	  | INTERO   | -> 9.000.000
	|VARCHAR  | TESTO	 |
	|NVARCHAR | TESTO    |
	|DATE     | DATA     |
	|FLOAT    | DECIMALE |
    |Char     | Carattere|

	sono tipi di dati utilizzati frequentemente in SQL Server.
*/


-- CREAZIONE DELLA TABELLA 
CREATE TABLE Studenti
(
    StudenteId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(50) NOT NULL,
    Cognome NVARCHAR(50) NOT NULL,
    Email NVARCHAR(150) UNIQUE NULL,
    CodiceFiscale CHAR(16) UNIQUE NOT NULL,
    DataNascita DATE NULL,
    Telefono NVARCHAR(20) UNIQUE NULL
);

-- select per visualizzare il record di una tabella

--SELEZIONARE TUTTE LE COLONNE DELLA TABELLA STUDENTI 
SELECT * FROM Studenti;
/*
 CREATE LA TABELLA Corsi(
	CorsoId ........ univoco
	NomeCorso testo(100) non nullabile
	Descicrizione testo(256) nullabile
	Crediti Intero nullabile
	Durata Intero nullabile
 );
	
*/
 
 CREATE TABLE Corsi (
	 CorsoID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	 NomeCorso NVARCHAR(100) NOT NULL,
	 DescrizioneTesto NVARCHAR(256) NULL,
	 Crediti INT NULL,
	 Durata INT NULL
 );
 SELECT * FROM Corsi;

 -- Creazione della tabella dei Docenti
 CREATE TABLE Docenti(
	DocentiId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Nome NVARCHAR(50) NOT NULL,
	Cognome NVARCHAR(50) NOT NULL,
	Email NVARCHAR(50) UNIQUE NULL,
	Specializzazione NVARCHAR(50) NOT NULL
 );

 SELECT * FROM Docenti;

 --Modifica il nome della colonna della tabella Docenti
 EXEC sp_rename 'Docenti.DocentiId','DocenteId';


 -- Creazione della tabella Aule
 CREATE TABLE Aule(
	AulaId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	NomeAula NVARCHAR(150) NOT NULL,
	Capacita INT NOT NULL 
 );

 SELECT * FROM Aule;


 -- Inserimento dei dati 
-- INSERISCO NELLA TABLE STUDENTI

SELECT *
FROM Studenti;
INSERT INTO Studenti
    (Nome, Cognome, Email, CodiceFiscale, DataNascita, Telefono)
-- Rapresentano i valori da inserire
VALUES
    ('Marialourdes', 'Messa', 'm.messa@gmail.com', 'MSSML964125PAI5P', '1978/03/29', '+393475397216');
	INSERT INTO Studenti
    (Nome, Cognome, Email, CodiceFiscale, DataNascita, Telefono)

	INSERT INTO Studenti
    (Nome, Cognome, Email, CodiceFiscale, DataNascita, Telefono)
-- Rapresentano i valori da inserire
VALUES
    ('Antonella', 'Risi', 'risi.antonella@gmail.com', 'ANTONELLA012365', '1982/11/09', '+391234569873'),
    ('Lucia', 'Cicala', 'cicala.l@gmail.com', 'LUCIACICALA01225', '2000/02/06', '+390321455697');

-- Foregin key
-- Creazione della tabella iscrizione -> Corsi e Studenti

CREATE TABLE Iscrizioni(
    IscrizioneId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    StudenteId INT NOT NULL,
    CorsoId INT NOT NULL,
    
    DataIscrizione Date NOT NULL,

    -- Vincoli di relazione (Foregin Key)
    FOREIGN KEY(StudenteId) REFERENCES Studenti(StudenteId),
    FOREIGN KEY(CorsoId) REFERENCES Corsi(CorsoId)
);

SELECT * from Iscrizioni;

-- Creazione della tabella Lezioni -> Corsi e Aule
CREATE TABLE Lezioni(
LezioneId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
CorsoId INT NOT NULL,
AulaId INT NOT NULL,

DataLezione Date NOT NULL,
OraInizio TIME,
OraFine TIME,
 FOREIGN KEY (CorsoId) REFERENCES Corsi(CorsoId),
 FOREIGN KEY (AulaId) REFERENCES Aule(AulaId)
);

SELECT * FROM Lezioni;
 
 -- Creazione della tabella DocentiCorso -> Docenti

CREATE TABLE docentiCorso
(
    DocenteCorsoId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    DocenteId INT NOT NULL,
    CorsoId INT NOT NULL,

    FOREIGN KEY (DocenteId) REFERENCES Docenti(DocenteId),
    FOREIGN KEY (CorsoId) REFERENCES Corsi(CorsoId)
);
 
 SELECT * FROM DocentiCorso;

-- Modifica del nome della tabella 
EXEC sp_rename 'docentiCorso', 'DocentiCorso';