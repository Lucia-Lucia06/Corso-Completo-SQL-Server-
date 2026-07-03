--JOIN / INNER JOIN
/*
SELECT
	colonne
FROM tabella1
JOIN tabella2
	ON tabella1.colonna_tabella1_Id  = tabella2.colonna_tabella2_Id


	Studenti
		studenteId = 1;

	Iscrizioni
		studenteId = 1;
*/

-- Esempio1:
SELECT 
	*
FROM Studenti AS s
JOIN Iscrizioni AS i
	ON s.StudenteId = i.StudenteId;
	

-- Restituire la lista degli studenti scritti senza data di  nascita 

SELECT 
	*
FROM Studenti AS s
JOIN Iscrizioni AS i
	ON s.StudenteId = i.StudenteId
	WHERE s.DataNascita IS NULL;


-- Es: Restituire la lista degli studenti scritti con la data di nascita

SELECT 
	*
FROM Studenti AS s
JOIN Iscrizioni AS i
	ON s.StudenteId = i.StudenteId
	WHERE s.DataNascita IS NOT NULL;

-- Restituire la lista degli studenti scritti almeno a un corso 
-- campi da visualizzare: (nome completo dello studente, codice fiscale, data di nascita, nome del corso e la descrizione del corso)

SELECT
    s.Nome + ' ' + s.Cognome AS [Nome completo dello studente],
    s.CodiceFiscale AS [Codice Fiscale], 
    s.DataNascita AS [Data di Nascita], 
    c.NomeCorso AS [Nome del Corso], 
    c.Descrizione AS [descrizione del corso]
FROM Studenti AS s
INNER JOIN Iscrizioni AS i
    ON s.StudenteId = i.StudenteId
INNER JOIN Corsi AS c
    ON c.CorsoId = i.CorsoId;

	-- Restituire la lista dei docenti con i corsi e l'aula
SELECT
    d.Nome + ' ' + d.Cognome AS [Nome completo del docente],
    d.Specializzazione AS [Materia],
    c.NomeCorso AS [Nome del corso],
    c.Descrizione,
    a.NomeAula,
    c.Durata
FROM Docenti AS d 
INNER JOIN DocentiCorso AS dc
    ON d.DocenteId = dc.DocenteId
INNER JOIN Corsi AS c
    ON c.CorsoId = dc.CorsoId
INNER JOIN Lezioni AS l
    ON l.CorsoId = c.CorsoId
INNER JOIN Aule a
    ON l.AulaId = a.AulaId
ORDER BY [Nome completo del docente] ASC;
