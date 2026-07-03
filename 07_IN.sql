USE ScuolaDb;

/*
	IN(LISTA)

	IN(PANE, POMODORO, UOVA, SALAME, CAVOLO...)

*/
SELECT
    *
FROM Corsi 
WHERE Crediti IN(5, 10, 7, 8, 30); 

SELECT
    *
FROM Corsi 
WHERE NomeCorso IN('SQL Avanzato', 'Angular', 'MySQL', 'Web HTML CSS', 'Git e Versioning'); 