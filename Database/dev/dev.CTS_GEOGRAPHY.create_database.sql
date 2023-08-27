USE [master]
GO

/****** Object:  Database [CTS_GEOGRAPHY]    Script Date: 13.08.2023 14:43:38 ******/
CREATE DATABASE [CTS_GEOGRAPHY]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CTS_GEOGRAPHY', FILENAME = N'F:\Databases\CTS_GEOGRAPHY.mdf' , SIZE = 65536KB , MAXSIZE = 6553600KB , FILEGROWTH = 65536KB ), 
 FILEGROUP [INDEXES] 
( NAME = N'CTS_GEOGRAPHY_IDX', FILENAME = N'F:\Databases\CTS_GEOGRAPHY_IDX.mdf' , SIZE = 65536KB , MAXSIZE = 6553600KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CTS_GEOGRAPHY_log', FILENAME = N'F:\Databases\CTS_GEOGRAPHY_log.ldf' , SIZE = 65536KB , MAXSIZE = 6553600KB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CTS_GEOGRAPHY].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET ARITHABORT OFF 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET  DISABLE_BROKER 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET  MULTI_USER 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET DB_CHAINING OFF 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET QUERY_STORE = OFF
GO

ALTER DATABASE [CTS_GEOGRAPHY] SET  READ_WRITE 
GO


