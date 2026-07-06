Use ScuolaDb;


Select * from Corsi; 
Select * from Studenti;
Select * from Iscrizioni;

Insert into Studenti
	(Nome, Cognome, Email, CodiceFiscale, DataNascita, Telefono)
values
	('Nathaly', 'Ornella', 'n.ornella@gmail.com', 'NTOL136569OPE0P', '1988/05/05', '+39325698741')

	--Iscrizione di uno studente ad un corso (1 SQL Base, 2 SQL Avanzato)
	Insert Into Iscrizioni 
	(StudenteId, CorsoId, DataIscrizione)
	Values
	(42, 1, GETDATE()),(42, 2, GETDATE());

	Select 
	s.StudenteId,
	s.Nome,
	s.Cognome,
	s.CodiceFiscale,
	c.NomeCorso,
	c.Descrizione
	From Studenti AS s
	INNER JOIN  Iscrizioni AS i
	ON s.StudenteId = i.StudenteId
	INNER JOIN Corsi AS c
	ON i.CorsoId = c.CorsoId
	Where s.StudenteId = 42;


	Select 
	s.StudenteId,
	s.Nome,
	s.Cognome,
	s.CodiceFiscale,
	ISNULL (CONVERT(NVARCHAR, s.DataNascita, 105), 'N/D' ) AS DataNascita, 
    ISNULL (c.NomeCorso, 'N/S' ) AS NomeCorso,
	ISNULL (c.Descrizione, 'N/S') AS Descrizione
	From Studenti AS s
	LEFT JOIN  Iscrizioni AS i
	ON s.StudenteId = i.StudenteId
	LEFT JOIN Corsi AS c
	ON i.CorsoId = c.CorsoId
	Where c.NomeCorso is null;
	
	Select 
	s.StudenteId,
	s.Nome,
	s.Cognome,
	s.CodiceFiscale,
	ISNULL (CONVERT(NVARCHAR, s.DataNascita, 105), 'N/D' ) AS DataNascita, 
	ISNULL (CONVERT(NVARCHAR,YEAR(s.DataNascita), 100), 'N/D' ) AS Anno,
	ISNULL (CONVERT(NVARCHAR, MONTH (s.DataNascita), 100), 'N/D' ) AS Mese,
	ISNULL (CONVERT(NVARCHAR, DAY (s.DataNascita), 100), 'N/D' ) AS Giorno,
	ISNULL (c.NomeCorso, 'N/S' ) AS NomeCorso,
	ISNULL (c.Descrizione, 'N/S') AS Descrizione
	From Studenti AS s
	LEFT JOIN  Iscrizioni AS i
	ON s.StudenteId = i.StudenteId
	LEFT JOIN Corsi AS c
	ON i.CorsoId = c.CorsoId
	Where c.NomeCorso is null;


	Select 
	s.StudenteId,
	s.Nome,
	s.Cognome,
	s.CodiceFiscale,
	ISNULL (CONVERT(NVARCHAR, s.DataNascita, 105), 'N/D' ) AS DataNascita, 
	ISNULL (CONVERT(NVARCHAR,YEAR(s.DataNascita), 100), 'N/D' ) AS Anno,
	ISNULL (CONVERT(NVARCHAR, MONTH (s.DataNascita), 100), 'N/D' ) AS Mese,
	ISNULL (CONVERT(NVARCHAR, DAY (s.DataNascita), 100), 'N/D' ) AS Giorno,
	ISNULL (c.NomeCorso, 'N/S' ) AS NomeCorso,
	ISNULL (c.Descrizione, 'N/S') AS Descrizione
	From Studenti AS s
	LEFT JOIN  Iscrizioni AS i
	ON s.StudenteId = i.StudenteId
	LEFT JOIN Corsi AS c
	ON i.CorsoId = c.CorsoId
	ORDER BY s.Nome ASC;

	-- DISTINCT serve per rimuovere duplicati (durante la  distinct non usare Id esempio CorsoId)

	Select  Distinct * from Studenti;

	SELECT DISTINCT -- CorsoId,
	NomeCorso,
	Descrizione,
	Crediti,
	Durata
FROM Corsi;

INSERT INTO Corsi
	(NomeCorso, Descrizione, Crediti, Durata)
VALUES
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120);

	-- UPDATE per modificare 
	/*

	  update tabella
	  set colonna = nuovo valore
	  where condizione 

	*/

	 update Corsi 
	  set NomeCorso = 'Corso Base R',
	      Descrizione = 'Corso programmazione in ML'
	  where CorsoId = 32;

	   update Corsi 
	  set NomeCorso = 'Corso Base R',
	      Descrizione = 'Corso programmazione in ML'
	  where CorsoId IN (60, 61);

	  
	   update Corsi 
	  set NomeCorso = 'Corso Base R',
	      Descrizione = 'Installazione e configurazione del sistema operativo'
	  where CorsoId >= 34;


	  Select * From Corsi Where CorsoId = 32;
	  Select * From Corsi Where CorsoId IN(32, 60, 61);

	  -- Esercizio 1:
	  -- Modificare la durata del corso "Corso informatico base" dove l'id = 47

	  Update Corsi 
	  set NomeCorso = 'Corso informatico base'
	  where CorsoId = 47;

	  select * from Corsi Where CorsoId = 47;

	  -- Esercizio 2:
	  -- Modificare un corso in base all'id es : 50

	  Update Corsi
	  set NomeCorso = 'Corso Sistema Operativo'
	  where CorsoId = 50;

	  /*

	  Delete per eliminare un record in base ad una condizione 
	  
      Esempio:
	  Delete from  tabella 
	  where condizioni di ricerca 

	   */

	   -- Da non fare:
	   Delete from Corsi 
	   --ma:
	   Delete from Corsi
	   where CorsoId = 61;

	   -- Store procedure 


