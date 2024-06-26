USE [master]
GO
/****** Object:  Database [BDBoca]    Script Date: 5/4/2024 12:12:59 ******/
CREATE DATABASE [BDBoca]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDBoca', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BDBoca.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDBoca_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BDBoca_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BDBoca] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDBoca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDBoca] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDBoca] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDBoca] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDBoca] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDBoca] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDBoca] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDBoca] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDBoca] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDBoca] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDBoca] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDBoca] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDBoca] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDBoca] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDBoca] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDBoca] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDBoca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDBoca] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDBoca] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDBoca] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDBoca] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDBoca] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDBoca] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDBoca] SET RECOVERY FULL 
GO
ALTER DATABASE [BDBoca] SET  MULTI_USER 
GO
ALTER DATABASE [BDBoca] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDBoca] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDBoca] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDBoca] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDBoca] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BDBoca', N'ON'
GO
ALTER DATABASE [BDBoca] SET QUERY_STORE = OFF
GO
USE [BDBoca]
GO
/****** Object:  User [alumno]    Script Date: 5/4/2024 12:12:59 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 5/4/2024 12:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrador](
	[Mail] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entradas]    Script Date: 5/4/2024 12:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entradas](
	[EntradaID] [int] IDENTITY(1,1) NOT NULL,
	[Precio] [int] NOT NULL,
	[Asiento] [varchar](50) NOT NULL,
	[PartidoID] [int] NOT NULL,
	[Disponible] [bit] NOT NULL,
 CONSTRAINT [PK_Entradas] PRIMARY KEY CLUSTERED 
(
	[EntradaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Noticia]    Script Date: 5/4/2024 12:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Noticia](
	[NoticiaID] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[FechaPublicacion] [date] NOT NULL,
	[Contenido] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Noticia] PRIMARY KEY CLUSTERED 
(
	[NoticiaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partidos]    Script Date: 5/4/2024 12:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partidos](
	[PartidoID] [int] IDENTITY(1,1) NOT NULL,
	[Fechapartido] [date] NOT NULL,
	[Rival] [varchar](50) NOT NULL,
	[Fotorival] [varchar](50) NULL,
 CONSTRAINT [PK_Partidos] PRIMARY KEY CLUSTERED 
(
	[PartidoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Socios]    Script Date: 5/4/2024 12:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Socios](
	[DNI] [int] NULL,
	[Mail] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[EntradaID] [int] NULL,
 CONSTRAINT [PK_Registrarse] PRIMARY KEY CLUSTERED 
(
	[Mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Administrador] ([Mail], [Contraseña]) VALUES (N'cvbbvc', N'vcxbbvc')
INSERT [dbo].[Administrador] ([Mail], [Contraseña]) VALUES (N'saddsf', N'sdffsda')
INSERT [dbo].[Administrador] ([Mail], [Contraseña]) VALUES (N'dssd', N'dfsdf')
GO
SET IDENTITY_INSERT [dbo].[Entradas] ON 

INSERT [dbo].[Entradas] ([EntradaID], [Precio], [Asiento], [PartidoID], [Disponible]) VALUES (1, 2000, N'f4', 1, 0)
INSERT [dbo].[Entradas] ([EntradaID], [Precio], [Asiento], [PartidoID], [Disponible]) VALUES (2, 2000, N'e8', 1, 1)
INSERT [dbo].[Entradas] ([EntradaID], [Precio], [Asiento], [PartidoID], [Disponible]) VALUES (3, 2000, N'a7', 1, 1)
INSERT [dbo].[Entradas] ([EntradaID], [Precio], [Asiento], [PartidoID], [Disponible]) VALUES (4, 6000, N'f7', 1, 1)
INSERT [dbo].[Entradas] ([EntradaID], [Precio], [Asiento], [PartidoID], [Disponible]) VALUES (5, 6000, N'b6', 1, 1)
INSERT [dbo].[Entradas] ([EntradaID], [Precio], [Asiento], [PartidoID], [Disponible]) VALUES (6, 6000, N'f5', 1, 1)
INSERT [dbo].[Entradas] ([EntradaID], [Precio], [Asiento], [PartidoID], [Disponible]) VALUES (7, 6000, N'k7', 1, 1)
INSERT [dbo].[Entradas] ([EntradaID], [Precio], [Asiento], [PartidoID], [Disponible]) VALUES (8, 20000, N'b3', 1, 1)
INSERT [dbo].[Entradas] ([EntradaID], [Precio], [Asiento], [PartidoID], [Disponible]) VALUES (9, 20000, N'a1', 1, 0)
INSERT [dbo].[Entradas] ([EntradaID], [Precio], [Asiento], [PartidoID], [Disponible]) VALUES (10, 20000, N'g6', 1, 1)
SET IDENTITY_INSERT [dbo].[Entradas] OFF
GO
SET IDENTITY_INSERT [dbo].[Partidos] ON 

INSERT [dbo].[Partidos] ([PartidoID], [Fechapartido], [Rival], [Fotorival]) VALUES (1, CAST(N'2023-12-12' AS Date), N'Riber', N'/img/riber.jpg')
INSERT [dbo].[Partidos] ([PartidoID], [Fechapartido], [Rival], [Fotorival]) VALUES (2, CAST(N'2023-12-14' AS Date), N'Independiente', N'/img/independiente.jpg')
SET IDENTITY_INSERT [dbo].[Partidos] OFF
GO
INSERT [dbo].[Socios] ([DNI], [Mail], [Contraseña], [EntradaID]) VALUES (47456324, N'pedrito12@gmail.com', N'Bokita23', NULL)
INSERT [dbo].[Socios] ([DNI], [Mail], [Contraseña], [EntradaID]) VALUES (NULL, N'yolo', N'11234', NULL)
GO
ALTER TABLE [dbo].[Entradas]  WITH CHECK ADD  CONSTRAINT [FK_Entradas_Partidos] FOREIGN KEY([PartidoID])
REFERENCES [dbo].[Partidos] ([PartidoID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Entradas] CHECK CONSTRAINT [FK_Entradas_Partidos]
GO
ALTER TABLE [dbo].[Socios]  WITH CHECK ADD  CONSTRAINT [FK_Socios_Entradas] FOREIGN KEY([EntradaID])
REFERENCES [dbo].[Entradas] ([EntradaID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Socios] CHECK CONSTRAINT [FK_Socios_Entradas]
GO
USE [master]
GO
ALTER DATABASE [BDBoca] SET  READ_WRITE 
GO
