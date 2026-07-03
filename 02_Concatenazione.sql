USE ScuolaDB;

select * from Studenti;

--Restituisce uno studente con l'id passata nel parametro
SELECT * FROM Studenti 
WHERE StudenteId = 3;

--L'istruzione WHERE filtra i dati basandosi sulle condizioni date

/*
Es:
	SELECT 
		colonne
	FROM tabella
	WHERE condizione 
*/


/*
	Gli operatori di confronto in SQL
	Servono per confrontare valori:
	| Operatore		| Significato   |
	|---------------|---------------|
	|		=		| Uguale	    |
	|		!=		| Diverso       |
	|		<>		| Diverso       |
	|		<		| Minore	    |
	|		>		| Maggiore	    |
	|		<=		| Minore uguale |
	|		>=		|Maggiore uguale|
	---------------------------------------------------------------------

	Operatori logici (booleano)
	| Operatore     | Significato   		|
	|---------------|-----------------------|
	|		AND		| tutte vere    		|
	|		OR		| almeno un vera        |
	|		NOT		| nega la condizione    |
	|   IS NULL		| Valore nullo  		|
*/

SELECT 
 Nome,
 Cognome,
 Telefono
 FROM Studenti
 WHERE StudenteId = 3;

 --La concatenazione (+) 
SELECT 
  Nome + ' - ' + Cognome,
  Telefono
FROM Studenti
WHERE StudenteId = 3;

 -- Aliass con la concatenazione ( AS )
SELECT 
  Nome + ' - ' + Cognome AS 'Nome Completo dello Studente',
  Telefono
 FROM Studenti;

 SELECT
   Nome + ' - ' + Cognome AS Nome_Completo_dello_Studente,
   Telefono
 FROM Studenti;

 SELECT
    Nome + ' - ' + Cognome AS [Nome Completo dello Studente],
	Telefono
 FROM Studenti;


  SELECT * FROM Studenti;

--Restituisce la lista degli studenti che hanno inserito la data di nascita durante l'iscrizione
 SELECT
    Nome + ' - ' + Cognome AS [Nome Completo dello Studente],
    CodiceFiscale
 FROM Studenti
 WHERE DataNascita IS NOT NULL;

 SELECT
	Nome + ' - ' + Cognome AS [Nome Completo dello Studente],
	CodiceFiscale,
	DataNascita AS [Data Nascita]
 FROM Studenti
 WHERE DataNascita IS NOT NULL AND DataNascita >= '2000';

  SELECT 
  TOP 10
	Nome + ' - ' + Cognome AS [Nome Completo dello Studente],
	CodiceFiscale,
	DataNascita AS [Data Nascita]
 FROM Studenti
 WHERE DataNascita IS NOT NULL AND DataNascita >= '2000';


 --ORDER BY (Per ordinare le colonne) (ASC/DESC)
  SELECT
   TOP 10
		Nome + ' - ' + Cognome AS [Nome Completo dello Studente],
		CodiceFiscale,
		DataNascita AS [Data Nascita]
 FROM Studenti
 WHERE DataNascita IS NOT NULL AND DataNascita >= '2000'
 ORDER BY  [Nome Completo dello Studente] ASC;


 SELECT
 TOP 10
	Nome, Cognome, Email, CodiceFiscale, DataNascita, Telefono
FROM Studenti
ORDER BY Nome ASC;


	



