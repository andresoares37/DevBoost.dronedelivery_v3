USE [master]
GO
/****** Object:  Database [DroneDelivery]    Script Date: 30/08/2020 00:04:43 ******/
CREATE DATABASE [DroneDelivery]
GO

USE [DroneDelivery]
GO

/****** Object:  Table [dbo].[Cliente]    Script Date: 30/08/2020 00:04:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [uniqueidentifier] NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Longitude] [decimal](12, 9) NULL,
	[Latitude] [decimal](12, 9) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drone]    Script Date: 30/08/2020 00:04:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drone](
	[Id] [int] identity(1,1) NOT NULL,
	[Capacidade] [int] NOT NULL,
	[Velocidade] [int] NOT NULL,
	[Autonomia] [int] NOT NULL,
	[Carga] [int] NOT NULL,
	[AutonomiaRestante] [int] NULL,
 CONSTRAINT [PK_Drone] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DroneItinerario]    Script Date: 30/08/2020 00:04:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DroneItinerario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DataHora] [datetime] NULL,
	[DroneId] [int] NOT NULL,
	[StatusDrone] [int] NOT NULL,
 CONSTRAINT [PK_DroneItinerario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 30/08/2020 00:04:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[Id] [uniqueidentifier] NOT NULL,
	[Peso] [int] NOT NULL,
	[DataHora] [datetime] NOT NULL,
	[DroneId] [int] NULL,
	[Status] [int] NULL,
	[ClienteId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 30/08/2020 00:04:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](250) NOT NULL,
	[Role] [varchar](50) NULL,
	[ClienteId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DroneItinerario]  WITH CHECK ADD  CONSTRAINT [FK_DroneItinerario_Drone] FOREIGN KEY([DroneId])
REFERENCES [dbo].[Drone] ([Id])
GO
ALTER TABLE [dbo].[DroneItinerario] CHECK CONSTRAINT [FK_DroneItinerario_Drone]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Client] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Client]
GO
USE [master]
GO
ALTER DATABASE [DroneDelivery] SET  READ_WRITE 
GO


USE [DroneDelivery]
GO
INSERT INTO [User] (Id, UserName, Password, Role) VALUES (NEWID(), 'admin', '53b93c75f78b57ce27701f24d4d5f321441383b384d101ef80d11c13eea46494', 'ADMIN')
GO
