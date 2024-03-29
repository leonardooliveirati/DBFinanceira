USE [master]
GO
/****** Object:  Database [FinanceiraClientes]    Script Date: 21/02/2024 17:58:50 ******/
CREATE DATABASE [FinanceiraClientes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FinanceiraClientes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FinanceiraClientes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FinanceiraClientes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FinanceiraClientes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FinanceiraClientes] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FinanceiraClientes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FinanceiraClientes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FinanceiraClientes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FinanceiraClientes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FinanceiraClientes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FinanceiraClientes] SET ARITHABORT OFF 
GO
ALTER DATABASE [FinanceiraClientes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FinanceiraClientes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FinanceiraClientes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FinanceiraClientes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FinanceiraClientes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FinanceiraClientes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FinanceiraClientes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FinanceiraClientes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FinanceiraClientes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FinanceiraClientes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FinanceiraClientes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FinanceiraClientes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FinanceiraClientes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FinanceiraClientes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FinanceiraClientes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FinanceiraClientes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FinanceiraClientes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FinanceiraClientes] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FinanceiraClientes] SET  MULTI_USER 
GO
ALTER DATABASE [FinanceiraClientes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FinanceiraClientes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FinanceiraClientes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FinanceiraClientes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FinanceiraClientes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FinanceiraClientes] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FinanceiraClientes] SET QUERY_STORE = ON
GO
ALTER DATABASE [FinanceiraClientes] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FinanceiraClientes]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 21/02/2024 17:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteID] [int] NOT NULL,
	[Nome] [nvarchar](100) NULL,
	[CPF] [char](11) NULL,
	[UF] [char](2) NULL,
	[Celular] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Financiamentos]    Script Date: 21/02/2024 17:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Financiamentos](
	[FinanciamentoID] [int] NOT NULL,
	[ClienteID] [int] NULL,
	[TipoFinanciamento] [nvarchar](100) NULL,
	[ValorTotal] [decimal](18, 2) NULL,
	[DataUltimoVencimento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[FinanciamentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parcelas]    Script Date: 21/02/2024 17:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parcelas](
	[ParcelaID] [int] NOT NULL,
	[FinanciamentoID] [int] NULL,
	[NumeroParcela] [int] NULL,
	[ValorParcela] [decimal](18, 2) NULL,
	[DataVencimento] [date] NULL,
	[DataPagamento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ParcelaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Clientes] ([ClienteID], [Nome], [CPF], [UF], [Celular]) VALUES (1, N'João Silva', N'12345678901', N'SP', N'11987654321')
INSERT [dbo].[Clientes] ([ClienteID], [Nome], [CPF], [UF], [Celular]) VALUES (2, N'Maria Souza', N'98765432109', N'RJ', N'21987654321')
INSERT [dbo].[Clientes] ([ClienteID], [Nome], [CPF], [UF], [Celular]) VALUES (3, N'Carlos Santos', N'45678901234', N'SP', N'11976543210')
GO
INSERT [dbo].[Financiamentos] ([FinanciamentoID], [ClienteID], [TipoFinanciamento], [ValorTotal], [DataUltimoVencimento]) VALUES (1, 1, N'Empréstimo', CAST(5000.00 AS Decimal(18, 2)), CAST(N'2024-03-15' AS Date))
INSERT [dbo].[Financiamentos] ([FinanciamentoID], [ClienteID], [TipoFinanciamento], [ValorTotal], [DataUltimoVencimento]) VALUES (2, 1, N'Financiamento Imobiliário', CAST(100000.00 AS Decimal(18, 2)), CAST(N'2025-06-20' AS Date))
INSERT [dbo].[Financiamentos] ([FinanciamentoID], [ClienteID], [TipoFinanciamento], [ValorTotal], [DataUltimoVencimento]) VALUES (3, 2, N'Financiamento de Carro', CAST(30000.00 AS Decimal(18, 2)), CAST(N'2024-08-10' AS Date))
GO
INSERT [dbo].[Parcelas] ([ParcelaID], [FinanciamentoID], [NumeroParcela], [ValorParcela], [DataVencimento], [DataPagamento]) VALUES (1, 1, 1, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2024-01-15' AS Date), CAST(N'2024-01-10' AS Date))
INSERT [dbo].[Parcelas] ([ParcelaID], [FinanciamentoID], [NumeroParcela], [ValorParcela], [DataVencimento], [DataPagamento]) VALUES (2, 1, 2, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2024-02-15' AS Date), CAST(N'2024-02-10' AS Date))
INSERT [dbo].[Parcelas] ([ParcelaID], [FinanciamentoID], [NumeroParcela], [ValorParcela], [DataVencimento], [DataPagamento]) VALUES (3, 1, 3, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2024-03-15' AS Date), NULL)
INSERT [dbo].[Parcelas] ([ParcelaID], [FinanciamentoID], [NumeroParcela], [ValorParcela], [DataVencimento], [DataPagamento]) VALUES (4, 2, 1, CAST(2000.00 AS Decimal(18, 2)), CAST(N'2024-01-20' AS Date), CAST(N'2024-01-20' AS Date))
INSERT [dbo].[Parcelas] ([ParcelaID], [FinanciamentoID], [NumeroParcela], [ValorParcela], [DataVencimento], [DataPagamento]) VALUES (5, 2, 2, CAST(2000.00 AS Decimal(18, 2)), CAST(N'2024-02-20' AS Date), CAST(N'2024-02-20' AS Date))
INSERT [dbo].[Parcelas] ([ParcelaID], [FinanciamentoID], [NumeroParcela], [ValorParcela], [DataVencimento], [DataPagamento]) VALUES (6, 2, 3, CAST(2000.00 AS Decimal(18, 2)), CAST(N'2024-03-20' AS Date), NULL)
INSERT [dbo].[Parcelas] ([ParcelaID], [FinanciamentoID], [NumeroParcela], [ValorParcela], [DataVencimento], [DataPagamento]) VALUES (7, 3, 1, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2024-01-10' AS Date), CAST(N'2024-01-10' AS Date))
INSERT [dbo].[Parcelas] ([ParcelaID], [FinanciamentoID], [NumeroParcela], [ValorParcela], [DataVencimento], [DataPagamento]) VALUES (8, 3, 2, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2024-02-10' AS Date), CAST(N'2024-02-10' AS Date))
GO
ALTER TABLE [dbo].[Financiamentos]  WITH CHECK ADD FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Clientes] ([ClienteID])
GO
ALTER TABLE [dbo].[Parcelas]  WITH CHECK ADD FOREIGN KEY([FinanciamentoID])
REFERENCES [dbo].[Financiamentos] ([FinanciamentoID])
GO
USE [master]
GO
ALTER DATABASE [FinanceiraClientes] SET  READ_WRITE 
GO
