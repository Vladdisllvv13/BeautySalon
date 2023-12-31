USE [master]
GO
/****** Object:  Database [20.101-02-BeautySalon]    Script Date: 27.09.2023 23:34:14 ******/
CREATE DATABASE [20.101-02-BeautySalon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'20.101-02-BeautySalon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\20.101-02-BeautySalon.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'20.101-02-BeautySalon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\20.101-02-BeautySalon_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [20.101-02-BeautySalon] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [20.101-02-BeautySalon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [20.101-02-BeautySalon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET ARITHABORT OFF 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET  DISABLE_BROKER 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET  MULTI_USER 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [20.101-02-BeautySalon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [20.101-02-BeautySalon] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [20.101-02-BeautySalon] SET QUERY_STORE = OFF
GO
USE [20.101-02-BeautySalon]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 27.09.2023 23:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 27.09.2023 23:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Birthday] [date] NULL,
	[Email] [nvarchar](255) NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 27.09.2023 23:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[ClientID] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 27.09.2023 23:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 27.09.2023 23:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 27.09.2023 23:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 27.09.2023 23:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 27.09.2023 23:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 27.09.2023 23:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 27.09.2023 23:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Cost] [money] NOT NULL,
	[Discount] [float] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 27.09.2023 23:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 27.09.2023 23:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 27.09.2023 23:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (1, N'Кузьмина', N'Дэнна', N'Витальевна', N'2', N'7(9940)977-45-73 ', CAST(N'1993-08-24' AS Date), N'nichoj@mac.com', CAST(N'2016-03-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (2, N'Мамонтова', N'Марфа', N'Мироновна', N'2', N'7(38)095-64-18 ', CAST(N'1984-10-19' AS Date), N'rfoley@verizon.net', CAST(N'2016-03-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (3, N'Степанова', N'Амелия', N'Робертовна', N'2', N'7(1217)441-28-42 ', CAST(N'1970-06-06' AS Date), N'rasca@hotmail.com', CAST(N'2016-03-29T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (4, N'Колесникова', N'Алина', N'Еремеевна', N'2', N'7(74)977-39-71 ', CAST(N'2001-04-19' AS Date), N'gfxguy@outlook.com', CAST(N'2016-03-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (5, N'Морозов', N'Наум', N'Валерьянович', N'1', N'7(636)050-96-13 ', CAST(N'1985-07-04' AS Date), N'salesgeek@mac.com', CAST(N'2016-03-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (6, N'Сысоева', N'Дарина', N'Ярославовна', N'2', N'7(0698)387-96-04 ', CAST(N'1982-02-03' AS Date), N'treit@verizon.net', CAST(N'2016-04-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (7, N'Горбачёва', N'Никки', N'Еремеевна', N'2', N'7(94)789-69-20 ', CAST(N'1987-04-21' AS Date), N'chinthaka@att.net', CAST(N'2016-04-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (8, N'Бирюкова', N'Инара', N'Улебовна', N'2', N'7(098)346-50-58 ', CAST(N'1978-07-21' AS Date), N'smpeters@hotmail.com', CAST(N'2016-04-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (9, N'Киселёв', N'Устин', N'Яковлевич', N'1', N'7(83)334-52-76 ', CAST(N'1985-01-08' AS Date), N'dalamb@verizon.net', CAST(N'2016-04-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (10, N'Крюкова', N'Авигея', N'Святославовна', N'2', N'7(499)318-88-53 ', CAST(N'2000-08-10' AS Date), N'simone@gmail.com', CAST(N'2016-04-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (11, N'Костина', N'Любава', N'Авксентьевна', N'2', N'7(6419)959-21-87 ', CAST(N'1972-07-13' AS Date), N'gordonjcp@hotmail.com', CAST(N'2016-04-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (12, N'Попова', N'Харита', N'Якуновна', N'2', N'7(335)386-81-06 ', CAST(N'1997-12-16' AS Date), N'firstpr@verizon.net', CAST(N'2016-04-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (13, N'Андреева', N'Патрисия', N'Валерьевна', N'2', N'7(9648)953-81-26 ', CAST(N'1993-11-18' AS Date), N'jigsaw@aol.com', CAST(N'2016-04-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (14, N'Гусева', N'Роза', N'Дмитриевна', N'2', N'7(23)064-51-84 ', CAST(N'1999-02-13' AS Date), N'martyloo@live.com', CAST(N'2016-04-09T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (15, N'Быков', N'Трофим', N'Константинович', N'1', N'7(3414)460-12-05 ', CAST(N'1994-12-20' AS Date), N'jguyer@aol.com', CAST(N'2016-04-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (16, N'Гусев', N'Яков', N'Авксентьевич', N'1', N'7(0972)781-11-37 ', CAST(N'1995-12-10' AS Date), N'jdhedden@icloud.com', CAST(N'2016-04-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (17, N'Турова', N'Георгина', N'Семёновна', N'2', N'7(555)321-42-99 ', CAST(N'1974-05-28' AS Date), N'yruan@optonline.net', CAST(N'2016-04-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (18, N'Трофимова', N'Альжбета', N'Якововна', N'2', N'7(1084)658-92-95 ', CAST(N'1988-10-22' AS Date), N'gbacon@mac.com', CAST(N'2016-04-13T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (19, N'Баранова', N'Эльмира', N'Дмитриевна', N'2', N'7(9240)643-15-50 ', CAST(N'1977-01-15' AS Date), N'jgmyers@comcast.net', CAST(N'2016-04-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (20, N'Федотов', N'Осип', N'Анатольевич', N'1', N'7(590)702-33-06 ', CAST(N'1971-04-13' AS Date), N'breegster@hotmail.com', CAST(N'2016-04-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (21, N'Борисов', N'Аввакум', N'Артемович', N'1', N'7(2296)930-08-88 ', CAST(N'1974-04-25' AS Date), N'chlim@live.com', CAST(N'2016-04-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (22, N'Артемьева', N'Лиза', N'Максимовна', N'2', N'7(696)972-70-21 ', CAST(N'1996-05-17' AS Date), N'snunez@yahoo.ca', CAST(N'2016-04-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (23, N'Воронова', N'Изабелла', N'Вячеславовна', N'2', N'7(17)433-44-98 ', CAST(N'1999-09-24' AS Date), N'kildjean@sbcglobal.net', CAST(N'2016-04-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (24, N'Федотова', N'Сандра', N'Владленовна', N'2', N'7(126)195-25-86 ', CAST(N'1985-03-29' AS Date), N'penna@verizon.net', CAST(N'2016-04-19T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (25, N'Ефремов', N'Витольд', N'Авксентьевич', N'1', N'7(93)922-14-03 ', CAST(N'1975-12-02' AS Date), N'kwilliams@yahoo.ca', CAST(N'2016-04-20T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (26, N'Ермакова', N'Алла', N'Мироновна', N'2', N'7(06)437-13-73 ', CAST(N'1976-01-22' AS Date), N'whimsy@aol.com', CAST(N'2016-04-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (27, N'Шашкова', N'Гелла', N'Эдуардовна', N'2', N'7(57)446-21-04 ', CAST(N'1979-02-24' AS Date), N'jadavis@mac.com', CAST(N'2016-04-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (28, N'Быкова', N'Тала', N'Георгьевна', N'2', N'7(13)915-53-53 ', CAST(N'2000-02-22' AS Date), N'ganter@optonline.net', CAST(N'2016-04-23T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (29, N'Орлова', N'Влада', N'Мартыновна', N'2', N'7(2506)433-38-35 ', CAST(N'1990-06-26' AS Date), N'rnelson@yahoo.ca', CAST(N'2016-04-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (30, N'Анисимова', N'Тамара', N'Витальевна', N'2', N'7(66)128-04-10 ', CAST(N'1988-06-16' AS Date), N'schwaang@mac.com', CAST(N'2016-04-25T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (31, N'Архипова', N'Прасковья', N'Валерьевна', N'2', N'7(86)540-10-21 ', CAST(N'1979-01-09' AS Date), N'cgcra@live.com', CAST(N'2016-04-26T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (32, N'Новиков', N'Адриан', N'Аркадьевич', N'1', N'7(70)572-33-62 ', CAST(N'1974-01-15' AS Date), N'multiplx@verizon.net', CAST(N'2016-04-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (33, N'Лазарева', N'Эльвина', N'Робертовна', N'2', N'7(5564)609-81-37 ', CAST(N'1996-02-16' AS Date), N'ahuillet@comcast.net', CAST(N'2016-04-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (34, N'Афанасьева', N'Розалия', N'Макаровна', N'2', N'7(0661)413-23-32 ', CAST(N'1977-05-01' AS Date), N'malattia@hotmail.com', CAST(N'2016-04-29T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (35, N'Устинова', N'Юнона', N'Валентиновна', N'2', N'7(33)367-13-07', CAST(N'1982-08-08' AS Date), N'kempsonc@live.com', CAST(N'2016-04-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (36, N'Алексеева', N'Элина', N'Матвеевна', N'2', N'7(8086)245-64-81 ', CAST(N'2002-05-07' AS Date), N'pthomsen@verizon.net', CAST(N'2016-05-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (37, N'Гущина', N'Янита', N'Федоровна', N'2', N'7(4544)716-68-96 ', CAST(N'1999-03-02' AS Date), N'lishoy@att.net', CAST(N'2016-05-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (38, N'Суворова', N'Божена', N'Анатольевна', N'2', N'7(347)895-86-57 ', CAST(N'1981-03-09' AS Date), N'attwood@aol.com', CAST(N'2016-05-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (39, N'Горшкова', N'Марта', N'Иосифовна', N'2', N'7(544)650-59-03', CAST(N'2001-02-13' AS Date), N'gbacon@mac.com', CAST(N'2016-05-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (40, N'Смирнов', N'Мартын', N'Арсеньевич', N'1', N'7(6251)589-02-43 ', CAST(N'1996-06-25' AS Date), N'haddawy@live.com', CAST(N'2016-05-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (41, N'Корнилова', N'Анэля', N'Михайловна', N'2', N'7(20)980-01-60 ', CAST(N'1973-04-02' AS Date), N'jonathan@aol.com', CAST(N'2016-05-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (42, N'Ефимова', N'Магда', N'Платоновна', N'2', N'7(9261)386-15-92 ', CAST(N'1995-08-16' AS Date), N'rbarreira@me.com', CAST(N'2016-05-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (43, N'Бурова', N'Светлана', N'Лукьевна', N'2', N'7(358)173-82-21 ', CAST(N'1979-01-04' AS Date), N'wsnyder@aol.com', CAST(N'2016-05-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (44, N'Сидорова', N'Татьяна', N'Михайловна', N'2', N'7(51)732-91-79 ', CAST(N'1974-04-24' AS Date), N'tbeck@mac.com', CAST(N'2016-05-09T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (45, N'Ершова', N'Номи', N'Андреевна', N'2', N'7(7757)315-90-99 ', CAST(N'2001-09-13' AS Date), N'miltchev@mac.com', CAST(N'2016-05-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (46, N'Овчинникова', N'Лаура', N'Еремеевна', N'2', N'7(85)829-33-79 ', CAST(N'1992-04-03' AS Date), N'carcus@yahoo.ca', CAST(N'2016-05-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (47, N'Мишина', N'Иветта', N'Андреевна', N'2', N'7(3926)244-81-96 ', CAST(N'2002-10-05' AS Date), N'aukjan@yahoo.com', CAST(N'2016-05-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (48, N'Колобова', N'Злата', N'Романовна', N'2', N'7(50)884-07-35 ', CAST(N'1994-08-25' AS Date), N'sinkou@aol.com', CAST(N'2016-05-13T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (49, N'Селиверстов', N'Глеб', N'Максимович', N'1', N'7(20)554-28-68 ', CAST(N'1999-06-20' AS Date), N'jigsaw@sbcglobal.net', CAST(N'2016-05-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (50, N'Дмитриева', N'Элина', N'Даниловна', N'2', N'7(787)140-48-84 ', CAST(N'1988-12-10' AS Date), N'vmalik@live.com', CAST(N'2016-05-15T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientService] ON 

INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (101, 176, CAST(N'2019-04-27T13:50:00.000' AS DateTime), 29, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (102, 164, CAST(N'2019-05-31T08:20:00.000' AS DateTime), 38, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (103, 138, CAST(N'2019-09-20T17:30:00.000' AS DateTime), 18, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (104, 177, CAST(N'2019-10-17T17:50:00.000' AS DateTime), 34, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (105, 154, CAST(N'2019-07-12T16:30:00.000' AS DateTime), 7, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (106, 192, CAST(N'2019-09-06T12:40:00.000' AS DateTime), 6, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (107, 194, CAST(N'2019-09-28T18:40:00.000' AS DateTime), 31, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (108, 139, CAST(N'2019-09-11T13:10:00.000' AS DateTime), 19, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (109, 161, CAST(N'2019-06-21T11:40:00.000' AS DateTime), 10, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (110, 197, CAST(N'2019-12-20T13:30:00.000' AS DateTime), 4, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (111, 104, CAST(N'2019-03-19T12:30:00.000' AS DateTime), 19, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (112, 120, CAST(N'2019-12-23T17:00:00.000' AS DateTime), 18, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (113, 106, CAST(N'2019-01-17T16:00:00.000' AS DateTime), 34, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (114, 107, CAST(N'2019-12-18T16:30:00.000' AS DateTime), 44, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (115, 177, CAST(N'2019-01-22T14:40:00.000' AS DateTime), 14, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (116, 199, CAST(N'2019-09-07T18:10:00.000' AS DateTime), 31, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (117, 195, CAST(N'2019-01-01T08:50:00.000' AS DateTime), 34, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (118, 192, CAST(N'2019-06-24T16:40:00.000' AS DateTime), 30, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (119, 194, CAST(N'2019-04-28T08:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (120, 106, CAST(N'2019-06-13T15:40:00.000' AS DateTime), 4, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (121, 139, CAST(N'2019-12-25T08:00:00.000' AS DateTime), 45, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (122, 174, CAST(N'2019-10-07T14:00:00.000' AS DateTime), 44, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (123, 161, CAST(N'2019-05-22T15:50:00.000' AS DateTime), 50, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (124, 104, CAST(N'2019-10-05T13:30:00.000' AS DateTime), 33, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (125, 190, CAST(N'2019-01-27T08:10:00.000' AS DateTime), 22, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (126, 101, CAST(N'2019-11-15T17:30:00.000' AS DateTime), 30, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (127, 135, CAST(N'2019-05-06T16:40:00.000' AS DateTime), 19, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (128, 108, CAST(N'2019-02-13T09:00:00.000' AS DateTime), 4, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (129, 127, CAST(N'2019-05-20T14:40:00.000' AS DateTime), 13, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (130, 145, CAST(N'2019-01-19T13:50:00.000' AS DateTime), 36, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (131, 146, CAST(N'2019-06-07T08:50:00.000' AS DateTime), 28, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (132, 138, CAST(N'2019-03-21T11:50:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (133, 130, CAST(N'2019-08-04T12:30:00.000' AS DateTime), 29, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (134, 143, CAST(N'2019-01-11T19:10:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (135, 146, CAST(N'2019-05-26T08:20:00.000' AS DateTime), 6, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (136, 197, CAST(N'2019-05-04T16:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (137, 105, CAST(N'2019-07-23T13:30:00.000' AS DateTime), 24, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (138, 118, CAST(N'2019-01-04T18:40:00.000' AS DateTime), 34, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (139, 192, CAST(N'2019-10-12T19:10:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (140, 101, CAST(N'2019-10-24T15:00:00.000' AS DateTime), 4, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (141, 170, CAST(N'2019-05-29T14:00:00.000' AS DateTime), 34, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (142, 119, CAST(N'2019-09-20T11:20:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (143, 179, CAST(N'2019-05-07T15:10:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (144, 133, CAST(N'2019-09-11T14:40:00.000' AS DateTime), 22, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (145, 134, CAST(N'2019-11-26T11:30:00.000' AS DateTime), 41, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (146, 174, CAST(N'2019-03-28T09:20:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (147, 197, CAST(N'2019-01-17T18:00:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (148, 154, CAST(N'2019-01-28T15:20:00.000' AS DateTime), 50, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (149, 161, CAST(N'2019-06-22T16:10:00.000' AS DateTime), 17, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (150, 123, CAST(N'2019-12-15T10:10:00.000' AS DateTime), 47, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (151, 164, CAST(N'2019-06-07T12:40:00.000' AS DateTime), 41, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (152, 134, CAST(N'2019-09-14T16:20:00.000' AS DateTime), 17, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (153, 178, CAST(N'2019-11-04T12:30:00.000' AS DateTime), 11, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (154, 141, CAST(N'2019-02-26T15:40:00.000' AS DateTime), 42, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (155, 173, CAST(N'2019-09-13T11:50:00.000' AS DateTime), 37, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (156, 174, CAST(N'2019-11-22T10:40:00.000' AS DateTime), 12, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (157, 119, CAST(N'2019-12-09T09:00:00.000' AS DateTime), 38, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (158, 145, CAST(N'2019-10-31T08:40:00.000' AS DateTime), 50, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (159, 178, CAST(N'2019-08-31T11:40:00.000' AS DateTime), 7, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (160, 108, CAST(N'2019-06-24T17:40:00.000' AS DateTime), 36, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (161, 135, CAST(N'2019-11-29T14:00:00.000' AS DateTime), 35, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (162, 178, CAST(N'2019-08-25T19:50:00.000' AS DateTime), 46, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (163, 146, CAST(N'2019-11-13T11:00:00.000' AS DateTime), 22, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (164, 154, CAST(N'2019-07-30T11:20:00.000' AS DateTime), 38, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (165, 154, CAST(N'2019-05-25T19:00:00.000' AS DateTime), 45, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (166, 106, CAST(N'2019-06-26T19:30:00.000' AS DateTime), 28, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (167, 178, CAST(N'2019-11-06T11:20:00.000' AS DateTime), 48, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (168, 108, CAST(N'2019-04-29T16:10:00.000' AS DateTime), 4, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (169, 176, CAST(N'2019-10-21T19:10:00.000' AS DateTime), 46, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (170, 175, CAST(N'2019-06-23T09:40:00.000' AS DateTime), 13, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (171, 122, CAST(N'2019-11-09T11:40:00.000' AS DateTime), 26, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (172, 142, CAST(N'2019-10-02T19:10:00.000' AS DateTime), 42, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (173, 146, CAST(N'2019-06-07T19:40:00.000' AS DateTime), 18, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (174, 173, CAST(N'2019-01-17T11:00:00.000' AS DateTime), 37, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (175, 130, CAST(N'2019-01-11T16:40:00.000' AS DateTime), 50, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (176, 104, CAST(N'2019-11-13T09:00:00.000' AS DateTime), 38, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (177, 119, CAST(N'2019-10-10T08:10:00.000' AS DateTime), 35, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (178, 161, CAST(N'2019-03-01T16:00:00.000' AS DateTime), 6, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (179, 112, CAST(N'2019-07-21T14:30:00.000' AS DateTime), 28, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (180, 101, CAST(N'2019-12-21T13:40:00.000' AS DateTime), 39, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (181, 146, CAST(N'2019-10-01T12:20:00.000' AS DateTime), 41, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (182, 139, CAST(N'2019-08-19T17:10:00.000' AS DateTime), 47, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (183, 194, CAST(N'2019-03-01T15:00:00.000' AS DateTime), 11, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (184, 135, CAST(N'2019-05-11T14:50:00.000' AS DateTime), 39, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (185, 195, CAST(N'2019-12-21T19:00:00.000' AS DateTime), 4, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (186, 127, CAST(N'2019-01-30T10:50:00.000' AS DateTime), 28, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (187, 125, CAST(N'2019-03-09T16:30:00.000' AS DateTime), 23, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (188, 108, CAST(N'2019-08-08T18:20:00.000' AS DateTime), 22, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (189, 146, CAST(N'2019-03-04T14:20:00.000' AS DateTime), 38, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (190, 120, CAST(N'2019-06-17T10:20:00.000' AS DateTime), 42, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (191, 166, CAST(N'2019-02-11T09:10:00.000' AS DateTime), 13, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (192, 120, CAST(N'2019-02-01T12:20:00.000' AS DateTime), 42, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (193, 179, CAST(N'2019-12-11T09:50:00.000' AS DateTime), 46, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (194, 179, CAST(N'2019-01-13T18:10:00.000' AS DateTime), 27, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (195, 173, CAST(N'2019-03-23T08:30:00.000' AS DateTime), 14, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (196, 175, CAST(N'2019-10-02T14:10:00.000' AS DateTime), 11, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (197, 195, CAST(N'2019-01-20T09:20:00.000' AS DateTime), 30, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (198, 173, CAST(N'2019-01-27T12:50:00.000' AS DateTime), 12, NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (199, 144, CAST(N'2019-05-19T08:00:00.000' AS DateTime), 46, NULL)
GO
INSERT [dbo].[ClientService] ([ID], [ServiceID], [StartTime], [ClientID], [Comment]) VALUES (200, 177, CAST(N'2019-11-30T19:10:00.000' AS DateTime), 8, NULL)
SET IDENTITY_INSERT [dbo].[ClientService] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'1', N'Мужской')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'2', N'Женский')
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (101, N'Фонофорез лица', N' Услуги салона красоты\face.png', 1200, 1120.0000, 5, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (102, N'Прокол ушей пистолетом', N' Услуги салона красоты\Прокол ушей пистолетом.png', 1500, 2040.0000, 5, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (103, N'Парафинотерапия', N' Услуги салона красоты\Парафинотерапия.jpg', 2100, 1180.0000, 5, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (104, N'Микротоковая терапия', N' Услуги салона красоты\face.png', 2700, 2410.0000, 5, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (105, N'Европейский маникюр', N' Услуги салона красоты\Европейский маникюр.jpg', 3600, 1990.0000, 5, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (106, N'Консультация врача-косметолога', N' Услуги салона красоты\122454.png', 3600, 2350.0000, 5, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (107, N'Наращивание ресниц', N' Услуги салона красоты\Ресницы.png', 2400, 1430.0000, 5, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (108, N'Коррекция нарощенных ресниц', N' Услуги салона красоты\Ресницы.png', 2700, 1310.0000, 5, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (109, N'Фракционное омоложение лазерной системой Palomar', N' Услуги салона красоты\face.png', 2700, 1140.0000, 5, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (110, N'Маски для лица', N' Услуги салона красоты\mask.jpeg', 1200, 2250.0000, 10, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (111, N'Коррекция ресниц', N' Услуги салона красоты\Ресницы.png', 1200, 2010.0000, 10, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (112, N'Стрижка с покраской', N' Услуги салона красоты\стрижка.png', 1500, 2300.0000, 10, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (113, N'Моделирование ресниц+тушь', N' Услуги салона красоты\Ресницы.png', 2100, 1390.0000, 10, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (114, N'Время вспять с коллагеном', N' Услуги салона красоты\96.png', 2400, 1850.0000, 10, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (115, N'Стрижка бороды машинкой', N' Услуги салона красоты\man.png', 2700, 1750.0000, 10, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (116, N'Солярий', N' Услуги салона красоты\soliarij.jpg', 3000, 1790.0000, 10, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (117, N'Гликолевый поверхностный базовый пилинг', N' Услуги салона красоты\piling.jpg', 2100, 2230.0000, 10, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (118, N'Стрижка челки', N' Услуги салона красоты\стрижка.png', 2100, 1930.0000, 10, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (119, N'Окрашивание бровей', N' Услуги салона красоты\Окрашивание бровей.jpg', 3600, 1120.0000, 10, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (120, N'Наращивание ногтей гелем', N' Услуги салона красоты\ногти.png', 2400, 1540.0000, 10, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (121, N'Демакияж', N' Услуги салона красоты\Демакияж.jpg', 1200, 1470.0000, 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (122, N'Химический пилинг', N' Услуги салона красоты\piling.jpg', 1500, 1880.0000, 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (123, N'Спортивный массаж', N' Услуги салона красоты\массаж.jpg', 1800, 1650.0000, 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (124, N'Омоложение зоны вокруг глаз', N' Услуги салона красоты\брови.png', 1800, 2540.0000, 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (125, N'Гавайский массаж Ломи-Ломи', N' Услуги салона красоты\массаж.jpg', 2100, 1040.0000, 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (126, N'Гречишный массаж', N' Услуги салона красоты\Гречишный массаж.jpg', 2400, 1520.0000, 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (127, N'Покрытие ногтей', N' Услуги салона красоты\ногти.png', 2400, 2410.0000, 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (128, N'Миндальный пилинг', N' Услуги салона красоты\piling.jpg', 2700, 2430.0000, 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (129, N'Классический массаж', N' Услуги салона красоты\массаж.jpg', 2700, 1120.0000, 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (130, N'Депиляция воском', N' Услуги салона красоты\Депиляция воском.jpg', 1800, 2330.0000, 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (131, N'Ботокс', N' Услуги салона красоты\96.png', 3000, 1820.0000, 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (132, N'Радиоволновой лифтинг', N' Услуги салона красоты\face.png', 3000, 1590.0000, 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (133, N'Декорирование ресниц стразами', N' Услуги салона красоты\Ресницы.png', 3000, 1920.0000, 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (134, N'Полировка ногтей', N' Услуги салона красоты\Полировка ногтей.jpg', 3000, 2310.0000, 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (135, N'Реконструкция и лечение волос и кожи головы', N' Услуги салона красоты\face.png', 3300, 2360.0000, 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (136, N'Уход для проблемной и комбинированной кожи', N' Услуги салона красоты\face.png', 3600, 2440.0000, 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (137, N'Экспресс-педикюр', N' Услуги салона красоты\Экспресс-педикюр.jpg', 1200, 2170.0000, 20, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (138, N'Детская стрижка', N' Услуги салона красоты\стрижка.png', 2100, 2330.0000, 20, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (139, N'Озонотерапия', N' Услуги салона красоты\face.png', 2100, 1740.0000, 20, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (140, N'Контурная пластика', N' Услуги салона красоты\Контурная пластика.jpg', 2100, 1550.0000, 20, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (141, N'Ультразвуковой пилинг', N' Услуги салона красоты\piling.jpg', 2700, 1440.0000, 20, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (142, N'Макияж', N' Услуги салона красоты\makeup.jpg', 1800, 2470.0000, 20, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (143, N'Классический маникюр', N' Услуги салона красоты\Классический маникюр.png', 3300, 1680.0000, 20, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (144, N'Татуаж', N' Услуги салона красоты\брови.png', 3600, 1330.0000, 20, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (145, N'Мезотерапия', N' Услуги салона красоты\Мезотерапия.jpg', 2400, 2040.0000, 20, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (146, N'ИК-сауна', N' Услуги салона красоты\ИК-сауна.jpg', 2700, 1160.0000, 20, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (147, N'Русский спа массаж', N' Услуги салона красоты\массаж.jpg', 3000, 2540.0000, 20, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (148, N'Химические завивки', N' Услуги салона красоты\стрижка.png', 3000, 1090.0000, 20, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (149, N'Плазмолифтинг', N' Услуги салона красоты\face.png', 900, 2450.0000, 20, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (150, N'Покрытие ногтей гель-лаком', N' Услуги салона красоты\Покрытие ногтей гель-лаком.jpg', 900, 2100.0000, 20, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (151, N'Вечерняя прическа', N' Услуги салона красоты\стрижка.png', 900, 2020.0000, 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (152, N'Лазерный пилинг', N' Услуги салона красоты\piling.jpg', 1200, 1650.0000, 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (153, N'Фракционный лазер Palomar Emerge', N' Услуги салона красоты\face.png', 1500, 1720.0000, 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (154, N'Наращивание ресниц лисьего эффекта', N' Услуги салона красоты\Ресницы.png', 1800, 1370.0000, 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (155, N'Ремонт одного ногтя', N' Услуги салона красоты\ногти.png', 1800, 2340.0000, 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (156, N'Классический педикюр', N' Услуги салона красоты\Экспресс-педикюр.jpg', 2100, 2040.0000, 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (157, N'Испанский массаж', N' Услуги салона красоты\массаж.jpg', 2400, 2190.0000, 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (158, N'Перманентный макияж (татуаж)', N' Услуги салона красоты\брови.png', 2400, 1270.0000, 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (159, N'Стоун-терапия', N' Услуги салона красоты\Стоун-терапия.jpg', 3000, 2100.0000, 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (160, N'Ламинирование ресниц', N' Услуги салона красоты\Ресницы.png', 3300, 1740.0000, 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (161, N'Эстетическая лазерная шлифовка кожи', N' Услуги салона красоты\piling.jpg', 2400, 1750.0000, 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (162, N'Снятие ресниц', N' Услуги салона красоты\Снятие ресниц.jpg', 2700, 1680.0000, 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (163, N'Общий массаж', N' Услуги салона красоты\массаж.jpg', 2700, 1970.0000, 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (164, N'Массаж ЖИВА', N' Услуги салона красоты\массаж.jpg', 3300, 2330.0000, 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (165, N'Экспресс SPA', N' Услуги салона красоты\Экспресс SPA.png', 900, 2420.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (166, N'Полировка с маслом', N' Услуги салона красоты\piling.jpg', 1200, 1280.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (167, N'Массаж оздоровительный', N' Услуги салона красоты\массаж.jpg', 1200, 1440.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (168, N'Мезонити (Тредлифтинг)', N' Услуги салона красоты\96.png', 1500, 2140.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (169, N'Полуперманентная тушь', N' Услуги салона красоты\Ресницы.png', 1800, 2340.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (170, N'Лечебное покрытие ногтей', N' Услуги салона красоты\ногти.png', 1800, 1220.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (171, N'Консультация врача', N' Услуги салона красоты\122454.png', 1800, 2120.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (172, N'Наращивание ресниц беличьего эффекта', N' Услуги салона красоты\Ресницы.png', 1800, 1010.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (173, N'Покраска ресниц', N' Услуги салона красоты\Ресницы.png', 1800, 2400.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (174, N'Шугаринг', N' Услуги салона красоты\Шугаринг.jpg', 1800, 1400.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (175, N'Наращивание ресниц кукольного эффекта', N' Услуги салона красоты\Ресницы.png', 2100, 2120.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (176, N'Оформление бровей', N' Услуги салона красоты\брови.png', 2100, 2280.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (177, N'Снятие лака', N' Услуги салона красоты\ногти.png', 2100, 1240.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (178, N'Прессотерапия', N' Услуги салона красоты\Прессотерапия.jpg', 2400, 2350.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (179, N'Инъекционные методики', N' Услуги салона красоты\96.png', 2400, 1660.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (180, N'Детокс спа', N' Услуги салона красоты\face.png', 1800, 1330.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (181, N'Массаж масляный', N' Услуги салона красоты\массаж.jpg', 3000, 1090.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (182, N'Мужская стрижка', N' Услуги салона красоты\man.png', 3000, 1690.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (183, N'Альгинатные маски', N' Услуги салона красоты\mask.jpeg', 3300, 2370.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (184, N'Аппаратная косметология', N' Услуги салона красоты\96.png', 3300, 1180.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (185, N'Окрашивание ресниц', N' Услуги салона красоты\Ресницы.png', 2100, 1100.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (186, N'Детский маникюр', N' Услуги салона красоты\ногти.png', 2100, 1900.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (187, N'Массаж лица', N' Услуги салона красоты\массаж.jpg', 3600, 2370.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (188, N'Свадебная прическа', N' Услуги салона красоты\стрижка.png', 2700, 2070.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (189, N'Моделирование ресниц', N' Услуги салона красоты\Моделирование ресниц.jpg', 2700, 2140.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (190, N'Укрепление ногтей гелем', N' Услуги салона красоты\Укрепление ногтей гелем.jpg', 2700, 1260.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (191, N'Декорирование нарощенных ресниц стразами', N' Услуги салона красоты\Декорирование нарощенных ресниц стразами.jpg', 2700, 1130.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (192, N'Художественное оформление ресниц', N' Услуги салона красоты\Ресницы.png', 3000, 2040.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (193, N'Визаж', N' Услуги салона красоты\makeup.jpg', 3000, 1260.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (194, N'Моментальный лифтинг', N' Услуги салона красоты\face.png', 3000, 2020.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (195, N'Пирсинг', N' Услуги салона красоты\Прокол ушей пистолетом.png', 3300, 1330.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (196, N'Увлажнение с коллагеном', N' Услуги салона красоты\96.png', 3300, 2490.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (197, N'Комбинированный маникюр', N' Услуги салона красоты\Комбинированный маникюр.jpg', 3600, 2390.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (198, N'Миостимуляция', N' Услуги салона красоты\face.png', 3600, 2380.0000, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (199, N'Удаление доброкачественных образований кожи', N' Услуги салона красоты\face.png', 900, 1910.0000, NULL, NULL)
GO
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (200, N'Криолифтинг', N' Услуги салона красоты\face.png', 900, 1090.0000, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [20.101-02-BeautySalon] SET  READ_WRITE 
GO
