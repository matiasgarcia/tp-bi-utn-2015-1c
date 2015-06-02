USE [MIS_GRUPO_03]
GO
-- Script de carga de dimensi�n tiempo
-- (Horas, Dias, Meses, A�os y Franjas Horarias)
SET NOCOUNT ON 

--         3 A�OS
--        36 MESES
-- +-  1.095 DIAS
-- +- 26.280 HORAS


DECLARE	
	  @a�oDesde INT = 2011
	, @a�oHasta INT = 2013
	, @curA�o INT

SET @curA�o = @a�oDesde

-- borro los datos existentes
TRUNCATE TABLE LK_Hora
TRUNCATE TABLE LK_Franja_Horaria
TRUNCATE TABLE LK_Dia
TRUNCATE TABLE LK_Mes
TRUNCATE TABLE LK_A�o

-- reseteo las identity columns
DBCC CHECKIDENT ('LK_Hora', RESEED, 1)
DBCC CHECKIDENT ('LK_Franja_Horaria', RESEED, 1)
DBCC CHECKIDENT ('LK_Dia', RESEED, 1)
DBCC CHECKIDENT ('LK_Mes', RESEED, 1)
DBCC CHECKIDENT ('LK_A�o', RESEED, 1)

-- cargo a�os
WHILE @curA�o <= @a�oHasta
BEGIN

  INSERT INTO LK_A�o (Descripcion)
  VALUES (@curA�o)
  
  SET @curA�o += 1

END

DECLARE @curMes INT = 1
DECLARE @meses TABLE (mes INT NOT NULL)

-- cargo meses
WHILE @curMes <= 12
BEGIN

  INSERT INTO @meses (mes) VALUES (@curMes)
  SET @curMes += 1
  
END

DECLARE @prevLang VARCHAR(255) = @@LANGUAGE

SET LANGUAGE  'SPANISH'


  
INSERT INTO LK_Mes (Descripcion, Numero, SK_A�o)
SELECT 
    DATENAME(month, CAST(CAST(a.Descripcion AS VARCHAR(4)) + '-' + LEFT('0' + CAST(m.mes AS VARCHAR(2)), 2) + '-01' 
      AS DATETIME))
  , m.mes
  , a.SK_A�o 
FROM LK_A�o a, @meses m
ORDER BY a.Descripcion, m.mes

DECLARE @dias TABLE (fecha DATETIME)
DECLARE 
    @diasA�o  INT
  , @curDia   DATETIME
  



-- cargo dias
SET @curA�o = @a�oDesde
WHILE @curA�o <= @a�oHasta
BEGIN

  SET @diasA�o = DATEDIFF(d
    , CAST(CAST(@curA�o AS VARCHAR(4)) + '-01-01' AS DATETIME)
    , CAST(CAST(@curA�o + 1 AS VARCHAR(4)) + '-01-01' AS DATETIME))

  SET @curDia = CAST(CAST(@curA�o AS VARCHAR(4)) + '-01-01' AS DATETIME)

  WHILE year(@curDia) = @curA�o
  BEGIN
  
    INSERT INTO LK_Dia (Descripcion, Numero, SK_Mes)
    SELECT 
        convert(varchar(255), @curDia, 106)
      , DAY(@curDia), m.SK_Mes 
    FROM LK_Mes m, LK_A�o a
    WHERE 
          m.SK_A�o = a.SK_A�o
      AND m.Numero = MONTH(@curDia)
      AND a.Descripcion = YEAR(@curDia)
    
    SET @curDia += 1
  
  END
  
  SET @curA�o += 1

END

-- cargo franja horaria
INSERT INTO LK_Franja_Horaria (Descripcion)
VALUES ('Madrugada')

INSERT INTO LK_Franja_Horaria (Descripcion)
VALUES ('Ma�ana')

INSERT INTO LK_Franja_Horaria (Descripcion)
VALUES ('Tarde')

INSERT INTO LK_Franja_Horaria (Descripcion)
VALUES ('Noche')

DECLARE @horaHasta DATETIME = CAST(CAST(@a�oHasta + 1 AS VARCHAR(4)) + '-01-01' AS DATETIME)

-- cargo hora (son 24 hs por cada dia de cada mes de cada a�o
SET @curDia = CAST(CAST(@a�oDesde AS VARCHAR(4)) + '-01-01' AS DATETIME)
WHILE @curDia < @horaHasta
BEGIN

  INSERT INTO LK_Hora (Descripcion, SK_Franja_Horaria, SK_Dia) 
  SELECT 
      CAST(DATEPART(HH, @curDia) AS VARCHAR(255))
    , f.SK_Franja_Horaria
    , d.SK_Dia
  FROM
      LK_Franja_Horaria f
    , LK_Dia d
    , LK_Mes m
    , LK_A�o a 
  WHERE 
        a.Descripcion = YEAR(@curDia)
    AND m.SK_A�o = a.SK_A�o
    AND m.Numero = MONTH(@curDia)
    AND d.SK_Mes = m.SK_Mes
    AND d.Numero = DAY(@curDia)
    AND f.Descripcion = CASE 
      WHEN CAST(DATEPART(HH, @curDia) AS INT) BETWEEN  0 AND  5 THEN 'Madrugada'
      WHEN CAST(DATEPART(HH, @curDia) AS INT) BETWEEN  6 AND 11 THEN 'Ma�ana'
      WHEN CAST(DATEPART(HH, @curDia) AS INT) BETWEEN 12 AND 19 THEN 'Tarde'
      WHEN CAST(DATEPART(HH, @curDia) AS INT) BETWEEN 20 AND 23 THEN 'Noche'
      ELSE CAST( (1/0) AS VARCHAR(1)) END
    
  SET @curDia = DATEADD(HH, 1, @curDia)
END



-- Restauro el lenguaje predeterminado
SET LANGUAGE @prevLang 

SELECT * FROM LK_A�o

SELECT * FROM LK_Mes

SELECT * FROM LK_Dia

SELECT * FROM LK_Franja_Horaria

SELECT * FROM LK_Hora



