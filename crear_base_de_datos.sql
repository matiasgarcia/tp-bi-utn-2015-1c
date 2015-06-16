IF db_id('MIS_GRUPO_03') IS NULL
BEGIN
	USE [master]
	/****** Object:  Database [MIS_GRUPO_03]    Script Date: 06/09/2015 00:34:03 ******/
	CREATE DATABASE [MIS_GRUPO_03] ON  PRIMARY 
	( NAME = N'MIS_GRUPO_03', FILENAME = N'C:\Archivos de programa\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\MIS_GRUPO_03.mdf' , SIZE = 114688KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
	 LOG ON 
	( NAME = N'MIS_GRUPO_03_log', FILENAME = N'C:\Archivos de programa\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\MIS_GRUPO_03_log.ldf' , SIZE = 2560KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
	
	ALTER DATABASE [MIS_GRUPO_03] SET COMPATIBILITY_LEVEL = 100
	
	IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
	begin
	EXEC [MIS_GRUPO_03].[dbo].[sp_fulltext_database] @action = 'enable'
	end
	
	ALTER DATABASE [MIS_GRUPO_03] SET ANSI_NULL_DEFAULT OFF 
	
	ALTER DATABASE [MIS_GRUPO_03] SET ANSI_NULLS OFF 
	
	ALTER DATABASE [MIS_GRUPO_03] SET ANSI_PADDING OFF 
	
	ALTER DATABASE [MIS_GRUPO_03] SET ANSI_WARNINGS OFF 
	
	ALTER DATABASE [MIS_GRUPO_03] SET ARITHABORT OFF 
	
	ALTER DATABASE [MIS_GRUPO_03] SET AUTO_CLOSE OFF 
	
	ALTER DATABASE [MIS_GRUPO_03] SET AUTO_CREATE_STATISTICS ON 
	
	ALTER DATABASE [MIS_GRUPO_03] SET AUTO_SHRINK OFF 
	
	ALTER DATABASE [MIS_GRUPO_03] SET AUTO_UPDATE_STATISTICS ON 
	
	ALTER DATABASE [MIS_GRUPO_03] SET CURSOR_CLOSE_ON_COMMIT OFF 
	
	ALTER DATABASE [MIS_GRUPO_03] SET CURSOR_DEFAULT  GLOBAL 

	ALTER DATABASE [MIS_GRUPO_03] SET CONCAT_NULL_YIELDS_NULL OFF 
	
	ALTER DATABASE [MIS_GRUPO_03] SET NUMERIC_ROUNDABORT OFF 
	
	ALTER DATABASE [MIS_GRUPO_03] SET QUOTED_IDENTIFIER OFF 
	
	ALTER DATABASE [MIS_GRUPO_03] SET RECURSIVE_TRIGGERS OFF 
	
	ALTER DATABASE [MIS_GRUPO_03] SET  DISABLE_BROKER 
	
	ALTER DATABASE [MIS_GRUPO_03] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
	
	ALTER DATABASE [MIS_GRUPO_03] SET DATE_CORRELATION_OPTIMIZATION OFF 
	
	ALTER DATABASE [MIS_GRUPO_03] SET TRUSTWORTHY OFF 

	ALTER DATABASE [MIS_GRUPO_03] SET ALLOW_SNAPSHOT_ISOLATION OFF 

	ALTER DATABASE [MIS_GRUPO_03] SET PARAMETERIZATION SIMPLE 
	
	ALTER DATABASE [MIS_GRUPO_03] SET READ_COMMITTED_SNAPSHOT OFF 
	
	ALTER DATABASE [MIS_GRUPO_03] SET HONOR_BROKER_PRIORITY OFF 
	
	ALTER DATABASE [MIS_GRUPO_03] SET  READ_WRITE 
	
	ALTER DATABASE [MIS_GRUPO_03] SET RECOVERY FULL 
	
	ALTER DATABASE [MIS_GRUPO_03] SET  MULTI_USER 
	
	ALTER DATABASE [MIS_GRUPO_03] SET PAGE_VERIFY CHECKSUM  
	
	ALTER DATABASE [MIS_GRUPO_03] SET DB_CHAINING OFF 
END
ELSE
BEGIN
	PRINT 'DB Already Exists'
END