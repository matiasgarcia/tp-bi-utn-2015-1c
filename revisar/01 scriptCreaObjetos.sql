USE [MIS_GRUPO_03]
GO
/****** Object:  ForeignKey [FK_AUX_TMI_LK_Barrio]    Script Date: 06/09/2015 23:31:11 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AUX_TMI_LK_Barrio]') AND parent_object_id = OBJECT_ID(N'[dbo].[AUX_TMI]'))
ALTER TABLE [dbo].[AUX_TMI] DROP CONSTRAINT [FK_AUX_TMI_LK_Barrio]
GO
/****** Object:  ForeignKey [FK_LK_Localidad_LK_Provincia]    Script Date: 06/09/2015 23:31:12 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LK_Localidad_LK_Provincia]') AND parent_object_id = OBJECT_ID(N'[dbo].[LK_Localidad]'))
ALTER TABLE [dbo].[LK_Localidad] DROP CONSTRAINT [FK_LK_Localidad_LK_Provincia]
GO
/****** Object:  ForeignKey [FK_LK_Usuario_LK_Localidad]    Script Date: 06/09/2015 23:31:12 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LK_Usuario_LK_Localidad]') AND parent_object_id = OBJECT_ID(N'[dbo].[LK_Usuario]'))
ALTER TABLE [dbo].[LK_Usuario] DROP CONSTRAINT [FK_LK_Usuario_LK_Localidad]
GO
/****** Object:  Table [dbo].[LK_Usuario]    Script Date: 06/09/2015 23:31:12 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LK_Usuario_LK_Localidad]') AND parent_object_id = OBJECT_ID(N'[dbo].[LK_Usuario]'))
ALTER TABLE [dbo].[LK_Usuario] DROP CONSTRAINT [FK_LK_Usuario_LK_Localidad]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Usuario]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Usuario]
GO
/****** Object:  View [dbo].[VW_CLIMA_ESTACION_BICICLETA]    Script Date: 06/09/2015 23:31:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VW_CLIMA_ESTACION_BICICLETA]'))
DROP VIEW [dbo].[VW_CLIMA_ESTACION_BICICLETA]
GO
/****** Object:  View [dbo].[VW_AUX_ESTACION_BICICLETAS_TMI]    Script Date: 06/09/2015 23:31:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VW_AUX_ESTACION_BICICLETAS_TMI]'))
DROP VIEW [dbo].[VW_AUX_ESTACION_BICICLETAS_TMI]
GO
/****** Object:  Table [dbo].[AUX_TMI]    Script Date: 06/09/2015 23:31:11 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AUX_TMI_LK_Barrio]') AND parent_object_id = OBJECT_ID(N'[dbo].[AUX_TMI]'))
ALTER TABLE [dbo].[AUX_TMI] DROP CONSTRAINT [FK_AUX_TMI_LK_Barrio]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AUX_TMI]') AND type in (N'U'))
DROP TABLE [dbo].[AUX_TMI]
GO
/****** Object:  Table [dbo].[LK_Localidad]    Script Date: 06/09/2015 23:31:12 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LK_Localidad_LK_Provincia]') AND parent_object_id = OBJECT_ID(N'[dbo].[LK_Localidad]'))
ALTER TABLE [dbo].[LK_Localidad] DROP CONSTRAINT [FK_LK_Localidad_LK_Provincia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Localidad]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Localidad]
GO
/****** Object:  Table [dbo].[LK_Mes]    Script Date: 06/09/2015 23:31:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Mes]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Mes]
GO
/****** Object:  Table [dbo].[LK_Motivo_Viaje]    Script Date: 06/09/2015 23:31:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Motivo_Viaje]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Motivo_Viaje]
GO
/****** Object:  Table [dbo].[LK_Precipitacion]    Script Date: 06/09/2015 23:31:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Precipitacion]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Precipitacion]
GO
/****** Object:  Table [dbo].[LK_Provincia]    Script Date: 06/09/2015 23:31:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Provincia]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Provincia]
GO
/****** Object:  Table [dbo].[LK_Temperatura]    Script Date: 06/09/2015 23:31:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Temperatura]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Temperatura]
GO
/****** Object:  Table [dbo].[AUX_TMI_Geolocalizadas]    Script Date: 06/09/2015 23:31:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AUX_TMI_Geolocalizadas]') AND type in (N'U'))
DROP TABLE [dbo].[AUX_TMI_Geolocalizadas]
GO
/****** Object:  Table [dbo].[BT_Recorridos]    Script Date: 06/09/2015 23:31:11 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_BT_Recorridos_Numero_De_Viajes]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BT_Recorridos] DROP CONSTRAINT [DF_BT_Recorridos_Numero_De_Viajes]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BT_Recorridos]') AND type in (N'U'))
DROP TABLE [dbo].[BT_Recorridos]
GO
/****** Object:  UserDefinedFunction [dbo].[DistanciaEnKM]    Script Date: 06/09/2015 23:31:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DistanciaEnKM]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[DistanciaEnKM]
GO
/****** Object:  Table [dbo].[LK_Año]    Script Date: 06/09/2015 23:31:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Año]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Año]
GO
/****** Object:  Table [dbo].[LK_Barrio]    Script Date: 06/09/2015 23:31:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Barrio]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Barrio]
GO
/****** Object:  Table [dbo].[LK_Dia]    Script Date: 06/09/2015 23:31:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Dia]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Dia]
GO
/****** Object:  Table [dbo].[LK_Estacion]    Script Date: 06/09/2015 23:31:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Estacion]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Estacion]
GO
/****** Object:  Table [dbo].[LK_Franja_Horaria]    Script Date: 06/09/2015 23:31:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Franja_Horaria]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Franja_Horaria]
GO
/****** Object:  Table [dbo].[LK_Hora]    Script Date: 06/09/2015 23:31:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Hora]') AND type in (N'U'))
DROP TABLE [dbo].[LK_Hora]
GO
/****** Object:  Table [dbo].[AUX_CLIMA]    Script Date: 06/09/2015 23:31:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AUX_CLIMA]') AND type in (N'U'))
DROP TABLE [dbo].[AUX_CLIMA]
GO
/****** Object:  Table [dbo].[AUX_CLIMA]    Script Date: 06/09/2015 23:31:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AUX_CLIMA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AUX_CLIMA](
	[ID_TMI] [numeric](18, 0) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [int] NOT NULL,
	[Precipitaciones] [numeric](18, 2) NOT NULL,
	[Temperatura] [numeric](18, 2) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LK_Hora]    Script Date: 06/09/2015 23:31:12 ******/
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
/****** Object:  Table [dbo].[LK_Franja_Horaria]    Script Date: 06/09/2015 23:31:11 ******/
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
/****** Object:  Table [dbo].[LK_Estacion]    Script Date: 06/09/2015 23:31:11 ******/
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
	[Latitud] [numeric](18, 10) NOT NULL,
	[Longitud] [numeric](18, 10) NOT NULL,
 CONSTRAINT [PK_LK_Estacion] PRIMARY KEY CLUSTERED 
(
	[SK_Estacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LK_Dia]    Script Date: 06/09/2015 23:31:11 ******/
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
/****** Object:  Table [dbo].[LK_Barrio]    Script Date: 06/09/2015 23:31:11 ******/
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
/****** Object:  Table [dbo].[LK_Año]    Script Date: 06/09/2015 23:31:11 ******/
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
/****** Object:  UserDefinedFunction [dbo].[DistanciaEnKM]    Script Date: 06/09/2015 23:31:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DistanciaEnKM]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[DistanciaEnKM](@lat1 FLOAT, @lat2 FLOAT, @lon1 FLOAT, @lon2 FLOAT)
RETURNS FLOAT 
AS
BEGIN

    RETURN ACOS(SIN(PI()*@lat1/180.0)*SIN(PI()*@lat2/180.0)+COS(PI()*@lat1/180.0)*COS(PI()*@lat2/180.0)*COS(PI()*@lon2/180.0-PI()*@lon1/180.0))*6371
END
' 
END
GO
/****** Object:  Table [dbo].[BT_Recorridos]    Script Date: 06/09/2015 23:31:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BT_Recorridos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BT_Recorridos](
	[SK_Usuario] [numeric](18, 0) NOT NULL,
	[SK_Motivo_Viaje] [numeric](18, 0) NOT NULL,
	[SK_Estacion_Origen] [numeric](18, 0) NOT NULL,
	[SK_Precipitacion_Estacion_Origen] [numeric](18, 0) NULL,
	[SK_Temperatura_Estacion_Origen] [numeric](18, 0) NULL,
	[SK_Hora_Estacion_Origen] [numeric](18, 0) NOT NULL,
	[SK_Estacion_Destino] [numeric](18, 0) NOT NULL,
	[SK_Precipitacion_Estacion_Destino] [numeric](18, 0) NULL,
	[SK_Temperatura_Estacion_Destino] [numeric](18, 0) NULL,
	[SK_Hora_Estacion_Destino] [numeric](18, 0) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Tiempo_De_Uso] [int] NOT NULL,
	[Distancia_Recorrida] [numeric](18, 3) NOT NULL,
	[Numero_De_Viajes] [int] NOT NULL CONSTRAINT [DF_BT_Recorridos_Numero_De_Viajes]  DEFAULT ((1))
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AUX_TMI_Geolocalizadas]    Script Date: 06/09/2015 23:31:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AUX_TMI_Geolocalizadas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AUX_TMI_Geolocalizadas](
	[ID_Estacion] [numeric](18, 0) NOT NULL,
	[Latitud] [decimal](18, 10) NOT NULL,
	[Longitud] [decimal](18, 10) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LK_Temperatura]    Script Date: 06/09/2015 23:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Temperatura]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LK_Temperatura](
	[SK_Temperatura] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Descripcion_Temperatura] [nvarchar](255) NOT NULL,
	[Temperatura_Desde] [numeric](18, 2) NOT NULL,
	[Temperatura_Hasta] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_LK_Temperatura] PRIMARY KEY CLUSTERED 
(
	[SK_Temperatura] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LK_Provincia]    Script Date: 06/09/2015 23:31:12 ******/
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
/****** Object:  Table [dbo].[LK_Precipitacion]    Script Date: 06/09/2015 23:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LK_Precipitacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LK_Precipitacion](
	[SK_Precipitacion] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Descripcion_Precipitacion] [nvarchar](255) NOT NULL,
	[Precipitacion_Desde] [numeric](18, 2) NOT NULL,
	[Precipitacion_Hasta] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_LK_Precipitacion] PRIMARY KEY CLUSTERED 
(
	[SK_Precipitacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LK_Motivo_Viaje]    Script Date: 06/09/2015 23:31:12 ******/
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
/****** Object:  Table [dbo].[LK_Mes]    Script Date: 06/09/2015 23:31:12 ******/
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
/****** Object:  Table [dbo].[LK_Localidad]    Script Date: 06/09/2015 23:31:12 ******/
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
/****** Object:  Table [dbo].[AUX_TMI]    Script Date: 06/09/2015 23:31:11 ******/
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
/****** Object:  View [dbo].[VW_AUX_ESTACION_BICICLETAS_TMI]    Script Date: 06/09/2015 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VW_AUX_ESTACION_BICICLETAS_TMI]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[VW_AUX_ESTACION_BICICLETAS_TMI]
AS
-- busco sacar la tmi que le brinda infoclima
-- a cada estacion 
-- una tmi puede corresponderle a varias estaciones
-- una estación tiene una sola tmi
with estacionesYTmis
AS
(
  SELECT e.SK_Estacion, t.ID_Estacion as ID_TMI
    , CAST(dbo.DistanciaEnKM(e.Latitud, t.Latitud, e.Longitud, t.Longitud) AS NUMERIC(18,3)) Distancia
  FROM 
      AUX_TMI_Geolocalizadas t
    , LK_Estacion e
)
, minimas AS
(
  SELECT t.SK_Estacion, MIN(t.Distancia) DistanciaMinima
  FROM estacionesYTmis t
  GROUP BY t.SK_Estacion
)
SELECT t.* 
FROM estacionesYTmis t, minimas m
WHERE 
      t.SK_Estacion = m.SK_Estacion
  AND t.Distancia = m.DistanciaMinima

'
GO
/****** Object:  View [dbo].[VW_CLIMA_ESTACION_BICICLETA]    Script Date: 06/09/2015 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VW_CLIMA_ESTACION_BICICLETA]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[VW_CLIMA_ESTACION_BICICLETA]
AS
SELECT 
    et.SK_Estacion
  --, c.ID_TMI
  , c.Fecha
  , CAST(c.Hora AS NVARCHAR(255)) AS HORA_NVARCHAR255
  , AVG(c.Precipitaciones) Precipitaciones, AVG(c.Temperatura) Temperatura
FROM 
    aux_clima c
  , VW_AUX_ESTACION_BICICLETAS_TMI et
WHERE c.ID_TMI = et.ID_TMI
GROUP BY 
    et.SK_Estacion
  --, c.ID_TMI
  , c.Fecha
  , CAST(c.Hora AS NVARCHAR(255)) 


'
GO
/****** Object:  Table [dbo].[LK_Usuario]    Script Date: 06/09/2015 23:31:12 ******/
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
/****** Object:  ForeignKey [FK_AUX_TMI_LK_Barrio]    Script Date: 06/09/2015 23:31:11 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AUX_TMI_LK_Barrio]') AND parent_object_id = OBJECT_ID(N'[dbo].[AUX_TMI]'))
ALTER TABLE [dbo].[AUX_TMI]  WITH CHECK ADD  CONSTRAINT [FK_AUX_TMI_LK_Barrio] FOREIGN KEY([SK_Barrio])
REFERENCES [dbo].[LK_Barrio] ([SK_Barrio])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AUX_TMI_LK_Barrio]') AND parent_object_id = OBJECT_ID(N'[dbo].[AUX_TMI]'))
ALTER TABLE [dbo].[AUX_TMI] CHECK CONSTRAINT [FK_AUX_TMI_LK_Barrio]
GO
/****** Object:  ForeignKey [FK_LK_Localidad_LK_Provincia]    Script Date: 06/09/2015 23:31:12 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LK_Localidad_LK_Provincia]') AND parent_object_id = OBJECT_ID(N'[dbo].[LK_Localidad]'))
ALTER TABLE [dbo].[LK_Localidad]  WITH NOCHECK ADD  CONSTRAINT [FK_LK_Localidad_LK_Provincia] FOREIGN KEY([SK_Provincia])
REFERENCES [dbo].[LK_Provincia] ([SK_Provincia])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LK_Localidad_LK_Provincia]') AND parent_object_id = OBJECT_ID(N'[dbo].[LK_Localidad]'))
ALTER TABLE [dbo].[LK_Localidad] CHECK CONSTRAINT [FK_LK_Localidad_LK_Provincia]
GO
/****** Object:  ForeignKey [FK_LK_Usuario_LK_Localidad]    Script Date: 06/09/2015 23:31:12 ******/
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