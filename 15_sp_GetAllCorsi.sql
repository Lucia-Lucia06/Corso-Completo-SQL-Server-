USE ScuolaDb;
GO

CREATE PROCEDURE sp_GetAllCorsi
AS
BEGIN
    SELECT *
    from Corsi
END 
GO

EXECUTE sp_GetAllCorsi;