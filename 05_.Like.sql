USE ScuolaDb;

/*
	=======================
	=	OPERATORE LIKE	  =
	=======================

	Serve per cercare valori simili

	simboli principali: 
        a%  (restituisce tutti i nome che mininciano con la lettera "a")
        %i  (restituisce i nomi che finiscono con la lettera "i")
        %o% (restituisce i nomi che hanno una le "o" in mezzo)
        %o% (restituisce i nomi che hanno una le "o" in mezzo)


    SINTASSI DI BASE:
        SELECT 
            colonna
        FROM tabella  
        WHERE colonna like 'lettera%';
*/

SELECT
    *
FROM Studenti
WHERE Nome like 'L%';

SELECT
    *
FROM Studenti
WHERE Cognome like '%i' AND DataNascita IS NOT NULL;

SELECT
    *
FROM Corsi
WHERE NomeCorso like '%z%';