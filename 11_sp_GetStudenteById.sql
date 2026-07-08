USE ScuolaDb;
GO

-- =============================================
-- Author:		Moussa
-- Create date: 07/07/2026
-- Description:	Restituisce uno studente in base all'id passata nel parametro
-- =============================================
CREATE PROCEDURE sp_GetStudenteById
    -- Add the parameters for the stored procedure here
    @studenteId INT
AS
BEGIN
    SELECT
        StudenteId as [Matricola],
        Nome + ' ' + Cognome as [Nome Completo dello studente],
        ISNULL(Email, 'Non definita') AS Email,
        CodiceFiscale,
        ISNULL(CONVERT(NVARCHAR, DataNascita, 109), 'N/D') as [Data di Nascita],
        ISNULL(Telefono, 0) as Telefono
    FROM Studenti
    WHERE StudenteId = @studenteId
END
GO

-- Esecuzione della procedure 
EXEC sp_GetStudenteById 1;

EXEC sp_GetStudenteById @studenteId = 5;