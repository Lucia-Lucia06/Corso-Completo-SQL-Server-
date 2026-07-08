USE ScuolaDb;
GO


CREATE PROCEDURE sp_ReportScolastico
AS
BEGIN
    SELECT
        COUNT(i.StudenteId) AS [Totale studenti scritti],
        COUNT(c.CorsoId) AS [Totale dei corsi],
        SUM(c.Crediti) as [Somma dei Crediti dei Corsi],
        AVG(c.Crediti) as [Media dei Crediti dei Corsi],
        MIN(c.Crediti) as [Credito Minimo dei Corsi],
        MAX(c.Crediti) as [Credito Massimo dei Corsi],
        SUM(c.Durata) as [Totale delle ore]
    FROM Studenti s
        LEFT JOIN Iscrizioni i
        ON i.StudenteId = s.StudenteId
        LEFT JOIN Corsi c
        ON c.CorsoId = i.CorsoId
        LEFT JOIN DocentiCorso dc
        ON c.CorsoId = dc.CorsoId
        LEFT JOIN Docenti d
        ON dc.DocenteId = d.DocenteId
        LEFT JOIN Lezioni l
        ON l.CorsoId = c.CorsoId
        LEFT JOIN Aule a
        ON a.AulaId = l.AulaId
END
GO


EXEC sp_ReportScolastico;