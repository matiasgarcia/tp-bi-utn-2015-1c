USE [MIS_GRUPO_03]
GO
INSERT INTO [dbo].[LK_Provincia](Nombre)
VALUES ('Provincia NA')
GO
INSERT INTO [dbo].[LK_Localidad](Nombre, SK_Provincia)
VALUES ('Localidad NA', 1)
GO
INSERT INTO [dbo].[LK_Usuario](ID_Usuario, Edad, Estado_Civil, Sexo, SK_Localidad)
VALUES (-1, 0, 'No Contesta', 'No Especificado', 1)
GO
INSERT INTO [dbo].[LK_Barrio](Nombre)
VALUES ('Barrio NA')
GO
INSERT INTO [dbo].[LK_Estacion](Nombre, Latitud, Longitud, SK_Barrio, ID_Estacion)
VALUES ('Estacion NA', 0, 0, 1, -1)
GO
INSERT INTO [dbo].[AUX_TMI_Geolocalizadas]
           ([ID_Estacion]
           ,[Latitud]
           ,[Longitud])
     VALUES
           (1282,-34.6598512,-58.4819119),
           (1283,-34.639466,-58.5212123),
           (1284,-34.6282492,-58.4895115),
           (1286,-34.6445735,-58.417351),
           (1289,-34.562114,-58.457026),
           (1291,-34.6357128,-58.397782),
           (1292,-34.8685441,-58.7120687),
           (1296,-34.6036768,-58.5082866),
           (1295,-34.5656578,-58.4824158),
           (1305,-34.6114069,-58.4208386),
           (1304,-34.6043863,-58.4070812),
           (1313,-34.5884245,-58.4110323),
           (1314,-34.5957487,-58.3926404),
           (1315,-34.6195681,-58.4358213),
           (1316,-34.6315655,-58.4692706),
           (1318,-34.600072,-58.378335)
GO