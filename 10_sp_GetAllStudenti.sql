USE ScuolaDb;
GO

-- =============================================
-- Author:		MOUSSA
-- Create date: 07/07/2026
-- Description:	Restituisce la lista degli stiudenti senza valori nulli
-- =============================================
CREATE PROCEDURE sp_GetAllStudenti
AS
BEGIN
    SELECT
        StudenteId as [Matricola],
        Nome + ' ' + Cognome as [Nome Completo dello studente],
        ISNULL(Email, 'Non definita') AS Email,
        CodiceFiscale,
        ISNULL(CONVERT(NVARCHAR, DataNascita, 109), 'N/D') as [Data di Nascita],
        ISNULL(Telefono, 0) as Telefono
    FROM Studenti;
END
GO

-- Execute the procedure
EXEC sp_GetAllStudenti;