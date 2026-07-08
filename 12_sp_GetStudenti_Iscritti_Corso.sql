USE ScuolaDb;
GO

CREATE PROCEDURE sp_GetStudenti_Iscritti_Corso
AS
BEGIN
    SELECT
        S.StudenteId,
        s.Nome + ' ' + s.Cognome AS [Nome completo dello studente],
        ISNULL(s.Email, 'Non definita') AS Email,
        s.CodiceFiscale AS [Codice Fiscale],
        ISNULL(CONVERT(NVARCHAR, s.DataNascita, 109), 'N/D') as [Data di Nascita],
        ISNULL(s.Telefono, 0) as Telefono,

        -- CORSI
        c.NomeCorso AS [Nome del Corso],
        c.Descrizione AS [descrizione del corso]
    FROM Studenti AS s
        INNER JOIN Iscrizioni AS i
        ON s.StudenteId = i.StudenteId
        INNER JOIN Corsi AS c
        ON c.CorsoId = i.CorsoId;
END
GO



-- ESECUZIONE DELLA PROCEDURE
EXECUTE sp_GetStudenti_Iscritti_Corso;