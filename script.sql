USE [MIS_GRUPO_03]
GO
/****** Object:  Table [dbo].[LK_Estacion]    Script Date: 05/29/2015 18:59:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[LK_Barrio]    Script Date: 05/29/2015 18:59:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LK_Barrio](
	[SK_Barrio] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_LK_Barrio] PRIMARY KEY CLUSTERED 
(
	[SK_Barrio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LK_Provincia]    Script Date: 05/29/2015 18:59:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LK_Provincia](
	[SK_Provincia] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_LK_Provincia] PRIMARY KEY CLUSTERED 
(
	[SK_Provincia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LK_Localidad]    Script Date: 05/29/2015 18:59:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LK_Localidad](
	[SK_Localidad] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[SK_Provincia] [numeric](18, 0) NULL,
	[Nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_LK_Localidad] PRIMARY KEY CLUSTERED 
(
	[SK_Localidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AUX_TMI]    Script Date: 05/29/2015 18:59:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUX_TMI](
	[SK_TMI] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ID_TMI] [numeric](18, 0) NOT NULL,
	[SK_Barrio] [numeric](18, 0) NOT NULL,
	[Latitud] [decimal](18, 10) NOT NULL,
	[Longitud] [decimal](18, 10) NOT NULL,
	[Direccion] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_AUX_TMI] PRIMARY KEY CLUSTERED 
(
	[SK_TMI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LK_Usuario]    Script Date: 05/29/2015 18:59:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  ForeignKey [FK_AUX_TMI_LK_Barrio]    Script Date: 05/29/2015 18:59:57 ******/
ALTER TABLE [dbo].[AUX_TMI]  WITH CHECK ADD  CONSTRAINT [FK_AUX_TMI_LK_Barrio] FOREIGN KEY([SK_Barrio])
REFERENCES [dbo].[LK_Barrio] ([SK_Barrio])
GO
ALTER TABLE [dbo].[AUX_TMI] CHECK CONSTRAINT [FK_AUX_TMI_LK_Barrio]
GO
/****** Object:  ForeignKey [FK_LK_Localidad_LK_Provincia]    Script Date: 05/29/2015 18:59:57 ******/
ALTER TABLE [dbo].[LK_Localidad]  WITH NOCHECK ADD  CONSTRAINT [FK_LK_Localidad_LK_Provincia] FOREIGN KEY([SK_Provincia])
REFERENCES [dbo].[LK_Provincia] ([SK_Provincia])
GO
ALTER TABLE [dbo].[LK_Localidad] CHECK CONSTRAINT [FK_LK_Localidad_LK_Provincia]
GO
/****** Object:  ForeignKey [FK_LK_Usuario_LK_Localidad]    Script Date: 05/29/2015 18:59:57 ******/
ALTER TABLE [dbo].[LK_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_LK_Usuario_LK_Localidad] FOREIGN KEY([SK_Localidad])
REFERENCES [dbo].[LK_Localidad] ([SK_Localidad])
GO
ALTER TABLE [dbo].[LK_Usuario] CHECK CONSTRAINT [FK_LK_Usuario_LK_Localidad]
GO
