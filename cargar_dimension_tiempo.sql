USE [MIS_GRUPO_03]
GO
-- Script de carga de dimensión tiempo
-- (Horas, Dias, Meses, Años y Franjas Horarias)
SET NOCOUNT ON 

DECLARE	
	  @añoDesde INT = 2010
	, @añoHasta INT = 2015
	, @curAño   INT

SET @curAño = @añoDesde

-- borro los datos existentes
TRUNCATE TABLE LK_Hora
TRUNCATE TABLE LK_Franja_Horaria
TRUNCATE TABLE LK_Dia
TRUNCATE TABLE LK_Mes
TRUNCATE TABLE LK_Año

-- reseteo las identity columns
DBCC CHECKIDENT ('LK_Hora', RESEED, 1)
DBCC CHECKIDENT ('LK_Franja_Horaria', RESEED, 1)
DBCC CHECKIDENT ('LK_Dia', RESEED, 1)
DBCC CHECKIDENT ('LK_Mes', RESEED, 1)
DBCC CHECKIDENT ('LK_Año', RESEED, 1)

-- cargo años
WHILE @curAño <= @añoHasta
BEGIN

  INSERT INTO LK_Año (Descripcion)
  VALUES (@curAño)
  
  SET @curAño += 1

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

  
INSERT INTO LK_Mes (Descripcion, Numero, SK_Año)
SELECT 
    DATENAME(month, CAST(CAST(a.Descripcion AS VARCHAR(4)) + '-01-' + RIGHT('0' + CAST(m.mes AS VARCHAR(2)), 2)  
      AS DATETIME))
  , m.mes
  , a.SK_Año 
FROM LK_Año a, @meses m
ORDER BY a.Descripcion, m.mes

DECLARE @dias TABLE (fecha DATETIME)
DECLARE 
    @diasAño  INT
  , @curDia   DATETIME
  



-- cargo dias
SET @curAño = @añoDesde
WHILE @curAño <= @añoHasta
BEGIN

  SET @diasAño = DATEDIFF(d
    , CAST(CAST(@curAño AS VARCHAR(4)) + '-01-01' AS DATETIME)
    , CAST(CAST(@curAño + 1 AS VARCHAR(4)) + '-01-01' AS DATETIME))

  SET @curDia = CAST(CAST(@curAño AS VARCHAR(4)) + '-01-01' AS DATETIME)

  WHILE YEAR(@curDia) = @curAño
  BEGIN
  
    INSERT INTO LK_Dia (Descripcion, Numero, SK_Mes, Fecha)
    SELECT 
        CONVERT(varchar(255), @curDia, 106)
      , DAY(@curDia), m.SK_Mes 
      , @curDia
    FROM LK_Mes m, LK_Año a
    WHERE 
          m.SK_Año = a.SK_Año
      AND m.Numero = MONTH(@curDia)
      AND a.Descripcion = YEAR(@curDia)
    
    SET @curDia += 1
  
  END
  
  SET @curAño += 1

END

-- cargo franja horaria
INSERT INTO LK_Franja_Horaria (Descripcion, Hora_Desde, Hora_Hasta)
VALUES ('Madrugada', 0, 5)

INSERT INTO LK_Franja_Horaria (Descripcion, Hora_Desde, Hora_Hasta)
VALUES ('Mañana', 6, 11)

INSERT INTO LK_Franja_Horaria (Descripcion, Hora_Desde, Hora_Hasta)
VALUES ('Tarde', 12, 19)

INSERT INTO LK_Franja_Horaria (Descripcion, Hora_Desde, Hora_Hasta)
VALUES ('Noche', 20 , 23)

DECLARE @horaHasta DATETIME = CAST(CAST(@añoHasta + 1 AS VARCHAR(4)) + '-01-01' AS DATETIME)

-- cargo hora (son 24 hs por cada dia de cada mes de cada año
SET @curDia = CAST(CAST(@añoDesde AS VARCHAR(4)) + '-01-01' AS DATETIME)
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
    , LK_Año a 
  WHERE 
        a.Descripcion = YEAR(@curDia)
    AND m.SK_Año = a.SK_Año
    AND m.Numero = MONTH(@curDia)
    AND d.SK_Mes = m.SK_Mes
    AND d.Numero = DAY(@curDia)
    AND DATEPART(HH, @curDia) BETWEEN f.Hora_Desde AND f.Hora_Hasta
    
  SET @curDia = DATEADD(HH, 1, @curDia)
END



-- Restauro el lenguaje predeterminado
SET LANGUAGE @prevLang 


