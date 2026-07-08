USE ScuolaDb
GO

CREATE PROCEDURE sp_GetStudenti_Senza_Corsi
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
        ISNULL(c.NomeCorso, 'NON DEFINITO') AS [Nome del Corso],
        ISNULL(c.Descrizione, 'NON DEFINITO') AS [descrizione del corso]
    FROM Studenti AS s
        LEFT JOIN Iscrizioni AS i
        ON s.StudenteId = i.StudenteId
        LEFT JOIN Corsi AS c
        ON c.CorsoId = i.CorsoId
    WHERE c.NomeCorso is null;
END
GO


-- ESECUZIONE DELLA PROCEDURE
EXEC sp_GetStudenti_Senza_Corsi;