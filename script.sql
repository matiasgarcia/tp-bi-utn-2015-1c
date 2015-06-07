USE [MIS_GRUPO_03]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AUX_TMI_LK_Barrio]') AND parent_object_id = OBJECT_ID(N'[dbo].[AUX_TMI]'))
ALTER TABLE [dbo].[AUX_TMI] DROP CONSTRAINT [FK_AUX_TMI_LK_Barrio]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LK_Localidad_LK_Provincia]') AND parent_object_id = OBJECT_ID(N'[dbo].[LK_Localidad]'))
ALTER TABLE [dbo].[LK_Localidad] DROP CONSTRAINT [FK_LK_Localidad_LK_Provincia]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LK_Usuario_LK_Localidad]') AND parent_object_id = OBJECT_ID(N'[dbo].[LK_Usuario]'))
ALTER TABLE [dbo].[LK_Usuario] DROP CONSTRAINT [FK_LK_Usuario_LK_Localidad]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LK_Usuario_LK_Localidad]') AND parent_object_id = OBJECT_ID(N'[dbo].[LK_Usuario]'))
ALTER TABLE [dbo].[LK_Usuario] DROP CONSTRAINT [FK_LK_Usuario_LK_Localidad]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Usuario]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Usuario]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AUX_TMI_LK_Barrio]') AND parent_object_id = OBJECT_ID(N'[dbo].[AUX_TMI]'))
ALTER TABLE [dbo].[AUX_TMI] DROP CONSTRAINT [FK_AUX_TMI_LK_Barrio]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AUX_TMI]') AND type in (N'U'))
DROP TABLE [dbo].[AUX_TMI]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LK_Localidad_LK_Provincia]') AND parent_object_id = OBJECT_ID(N'[dbo].[LK_Localidad]'))
ALTER TABLE [dbo].[LK_Localidad] DROP CONSTRAINT [FK_LK_Localidad_LK_Provincia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Localidad]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Localidad]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Mes]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Mes]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Motivo_Viaje]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Motivo_Viaje]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Precipitacion]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Precipitacion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Provincia]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Provincia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Temperatura]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Temperatura]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Año]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Año]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Barrio]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Barrio]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Dia]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Dia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Estacion]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Estacion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Franja_Horaria]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Franja_Horaria]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Hora]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Hora]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Hora]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LK_Hora](
	[SK_Hora] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](255) NOT NULL,
	[SK_Franja_Horaria] [numeric](18, 0) NOT NULL,
	[SK_Dia] [numeric](18, 0) NULL,
 CONSTRAINT [PK_LK_Hora] PRIMARY KEY CLUSTERED 
(
	[SK_Hora] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Franja_Horaria]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LK_Franja_Horaria](
	[SK_Franja_Horaria] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](255) NOT NULL,
	[Hora_Desde] [int] NOT NULL,
	[Hora_Hasta] [int] NOT NULL,
 CONSTRAINT [PK_LK_Franja_Horaria] PRIMARY KEY CLUSTERED 
(
	[SK_Franja_Horaria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Estacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LK_Estacion](
	[SK_Estacion] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ID_Estacion] [numeric](18, 0) NOT NULL,
	[SK_Barrio] [numeric](18, 0) NOT NULL,
	[Nombre] [nvarchar](255) NOT NULL,
	[Latitud] [decimal](18, 10) NOT NULL,
	[Longitud] [decimal](18, 10) NOT NULL,
 CONSTRAINT [PK_LK_Estacion] PRIMARY KEY CLUSTERED 
(
	[SK_Estacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Dia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LK_Dia](
	[SK_Dia] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](255) NOT NULL,
	[SK_Mes] [numeric](18, 0) NOT NULL,
	[Numero] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_LK_Dia] PRIMARY KEY CLUSTERED 
(
	[SK_Dia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Barrio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LK_Barrio](
	[SK_Barrio] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_LK_Barrio] PRIMARY KEY CLUSTERED 
(
	[SK_Barrio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Año]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LK_Año](
	[SK_Año] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](155) NOT NULL,
 CONSTRAINT [PK_LK_Año] PRIMARY KEY CLUSTERED 
(
	[SK_Año] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Temperatura]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LK_Temperatura](
	[SK_Temperatura] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Descripcion_Temperatura] [nvarchar](255) NOT NULL,
	[Limite_Inferior] [numeric](2, 0) NOT NULL,
	[Limite_Superior] [numeric](2, 0) NOT NULL
 CONSTRAINT [PK_LK_Temperatura] PRIMARY KEY CLUSTERED 
(
	[SK_Temperatura] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Provincia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LK_Provincia](
	[SK_Provincia] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_LK_Provincia] PRIMARY KEY CLUSTERED 
(
	[SK_Provincia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Precipitacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LK_Precipitacion](
	[SK_Precipitacion] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Descripcion_Precipitacion] [nvarchar](255) NOT NULL,
	[Limite_Inferior] [numeric](2, 0) NOT NULL,
	[Limite_Superior] [numeric](2, 0) NOT NULL
 CONSTRAINT [PK_LK_Precipitacion] PRIMARY KEY CLUSTERED 
(
	[SK_Precipitacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Motivo_Viaje]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LK_Motivo_Viaje](
	[SK_Motivo_Viaje] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_LK_Motivo_Viaje] PRIMARY KEY CLUSTERED 
(
	[SK_Motivo_Viaje] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Mes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LK_Mes](
	[SK_Mes] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](255) NOT NULL,
	[SK_Año] [numeric](18, 0) NOT NULL,
	[Numero] [int] NOT NULL,
 CONSTRAINT [PK_LK_Mes] PRIMARY KEY CLUSTERED 
(
	[SK_Mes] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Localidad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LK_Localidad](
	[SK_Localidad] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[SK_Provincia] [numeric](18, 0) NULL,
	[Nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_LK_Localidad] PRIMARY KEY CLUSTERED 
(
	[SK_Localidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AUX_TMI]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AUX_TMI](
	[SK_TMI] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ID_TMI] [numeric](18, 0) NOT NULL,
	[SK_Barrio] [numeric](18, 0) NOT NULL,
	[Latitud] [decimal](18, 10) NOT NULL,
	[Longitud] [decimal](18, 10) NOT NULL,
	[Direccion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AUX_TMI] PRIMARY KEY CLUSTERED 
(
	[SK_TMI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Usuario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LK_Usuario](
	[SK_Usuario] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [numeric](18, 0) NOT NULL,
	[Edad] [numeric](3, 0) NULL,
	[Estado_Civil] [nvarchar](255) NOT NULL,
	[Sexo] [nvarchar](255) NOT NULL,
	[SK_Localidad] [numeric](18, 0) NULL,
 CONSTRAINT [PK_LK_Usuario] PRIMARY KEY CLUSTERED 
(
	[SK_Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Usuario]') AND type in (N'U'))
DROP TABLE [dbo].[AUX_TMI_Geolocalizadas]
GO
CREATE TABLE [dbo].[AUX_TMI_Geolocalizadas](
	[ID_Estacion] [numeric](18, 0) NOT NULL,
	[Latitud] [decimal](18, 10) NOT NULL,
	[Longitud] [decimal](18, 10) NOT NULL
) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AUX_TMI_LK_Barrio]') AND parent_object_id = OBJECT_ID(N'[dbo].[AUX_TMI]'))
ALTER TABLE [dbo].[AUX_TMI]  WITH CHECK ADD  CONSTRAINT [FK_AUX_TMI_LK_Barrio] FOREIGN KEY([SK_Barrio])
REFERENCES [dbo].[LK_Barrio] ([SK_Barrio])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AUX_TMI_LK_Barrio]') AND parent_object_id = OBJECT_ID(N'[dbo].[AUX_TMI]'))
ALTER TABLE [dbo].[AUX_TMI] CHECK CONSTRAINT [FK_AUX_TMI_LK_Barrio]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LK_Localidad_LK_Provincia]') AND parent_object_id = OBJECT_ID(N'[dbo].[LK_Localidad]'))
ALTER TABLE [dbo].[LK_Localidad]  WITH NOCHECK ADD  CONSTRAINT [FK_LK_Localidad_LK_Provincia] FOREIGN KEY([SK_Provincia])
REFERENCES [dbo].[LK_Provincia] ([SK_Provincia])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LK_Localidad_LK_Provincia]') AND parent_object_id = OBJECT_ID(N'[dbo].[LK_Localidad]'))
ALTER TABLE [dbo].[LK_Localidad] CHECK CONSTRAINT [FK_LK_Localidad_LK_Provincia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LK_Usuario_LK_Localidad]') AND parent_object_id = OBJECT_ID(N'[dbo].[LK_Usuario]'))
ALTER TABLE [dbo].[LK_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_LK_Usuario_LK_Localidad] FOREIGN KEY([SK_Localidad])
REFERENCES [dbo].[LK_Localidad] ([SK_Localidad])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LK_Usuario_LK_Localidad]') AND parent_object_id = OBJECT_ID(N'[dbo].[LK_Usuario]'))
ALTER TABLE [dbo].[LK_Usuario] CHECK CONSTRAINT [FK_LK_Usuario_LK_Localidad]
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