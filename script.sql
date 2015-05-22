USE [MIS_GRUPO_03]
GO
/****** Object:  Table [dbo].[LK_Provincia]    Script Date: 05/21/2015 23:05:40 ******/
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
/****** Object:  Table [dbo].[LK_Localidad]    Script Date: 05/21/2015 23:05:40 ******/
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
/****** Object:  Table [dbo].[LK_Usuario]    Script Date: 05/21/2015 23:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LK_Usuario](
	[SK_Usuario] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [numeric](18, 0) NOT NULL,
	[Edad] [numeric](3, 0) NOT NULL,
	[Estado_Civil] [nvarchar](50) NOT NULL,
	[Sexo] [nvarchar](50) NOT NULL,
	[SK_Localidad] [numeric](18, 0) NULL,
 CONSTRAINT [PK_LK_Usuario] PRIMARY KEY CLUSTERED 
(
	[SK_Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_LK_Localidad_LK_Provincia]    Script Date: 05/21/2015 23:05:40 ******/
ALTER TABLE [dbo].[LK_Localidad]  WITH CHECK ADD  CONSTRAINT [FK_LK_Localidad_LK_Provincia] FOREIGN KEY([SK_Provincia])
REFERENCES [dbo].[LK_Provincia] ([SK_Provincia])
GO
ALTER TABLE [dbo].[LK_Localidad] CHECK CONSTRAINT [FK_LK_Localidad_LK_Provincia]
GO
/****** Object:  ForeignKey [FK_LK_Usuario_LK_Localidad]    Script Date: 05/21/2015 23:05:40 ******/
ALTER TABLE [dbo].[LK_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_LK_Usuario_LK_Localidad] FOREIGN KEY([SK_Localidad])
REFERENCES [dbo].[LK_Localidad] ([SK_Localidad])
GO
ALTER TABLE [dbo].[LK_Usuario] CHECK CONSTRAINT [FK_LK_Usuario_LK_Localidad]
GO
