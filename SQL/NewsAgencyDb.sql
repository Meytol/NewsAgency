USE [master]
GO
/****** Object:  Database [NewsAgencyDB]    Script Date: 28/10/98 10:47:26 ق.ظ ******/
CREATE DATABASE [NewsAgencyDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NewsAgencyDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\NewsAgencyDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NewsAgencyDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\NewsAgencyDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NewsAgencyDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NewsAgencyDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NewsAgencyDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NewsAgencyDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NewsAgencyDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NewsAgencyDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NewsAgencyDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [NewsAgencyDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NewsAgencyDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NewsAgencyDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NewsAgencyDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NewsAgencyDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NewsAgencyDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NewsAgencyDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NewsAgencyDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NewsAgencyDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NewsAgencyDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NewsAgencyDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NewsAgencyDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NewsAgencyDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NewsAgencyDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NewsAgencyDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NewsAgencyDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NewsAgencyDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NewsAgencyDB] SET RECOVERY FULL 
GO
ALTER DATABASE [NewsAgencyDB] SET  MULTI_USER 
GO
ALTER DATABASE [NewsAgencyDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NewsAgencyDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NewsAgencyDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NewsAgencyDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NewsAgencyDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NewsAgencyDB', N'ON'
GO
ALTER DATABASE [NewsAgencyDB] SET QUERY_STORE = OFF
GO
USE [NewsAgencyDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [NewsAgencyDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 28/10/98 10:47:27 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 28/10/98 10:47:28 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[Type] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
	[ViewState] [int] NOT NULL,
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Advertises]    Script Date: 28/10/98 10:47:29 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertises](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[Href] [nvarchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
	[ViewState] [int] NOT NULL,
 CONSTRAINT [PK_Advertises] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 28/10/98 10:47:29 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
	[ViewState] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 28/10/98 10:47:29 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AuthorId] [int] NOT NULL,
	[ParentId] [int] NULL,
	[State] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
	[ViewState] [int] NOT NULL,
	[UserId] [int] NULL,
	[NewsId] [int] NOT NULL,
	[Text] [nvarchar](max) NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotNewses]    Script Date: 28/10/98 10:47:29 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotNewses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NewsId] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
	[ViewState] [int] NOT NULL,
 CONSTRAINT [PK_HotNewses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Links]    Script Date: 28/10/98 10:47:29 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Links](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActionId] [int] NULL,
	[ParentId] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[Icon] [nvarchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
	[ViewState] [int] NOT NULL,
 CONSTRAINT [PK_Links] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsCategories]    Script Date: 28/10/98 10:47:29 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[NewsId] [int] NOT NULL,
	[IsMain] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
	[ViewState] [int] NOT NULL,
 CONSTRAINT [PK_NewsCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Newses]    Script Date: 28/10/98 10:47:29 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Newses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Headline] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Text] [nvarchar](max) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[AuthorId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
	[ViewState] [int] NOT NULL,
	[SeenCount] [int] NOT NULL,
 CONSTRAINT [PK_Newses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsSeens]    Script Date: 28/10/98 10:47:29 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsSeens](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[NewsId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
	[ViewState] [int] NOT NULL,
 CONSTRAINT [PK_NewsSeens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleActions]    Script Date: 28/10/98 10:47:29 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleActions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ActionId] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
	[ViewState] [int] NOT NULL,
 CONSTRAINT [PK_RoleActions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 28/10/98 10:47:29 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
	[ViewState] [int] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 28/10/98 10:47:29 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Key] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscribers]    Script Date: 28/10/98 10:47:29 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscribers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EMail] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
	[ViewState] [int] NOT NULL,
 CONSTRAINT [PK_Subscribers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 28/10/98 10:47:29 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
	[ViewState] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28/10/98 10:47:29 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](24) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[ProfilePictureUrl] [nvarchar](max) NULL,
	[Biography] [nvarchar](1000) NULL,
	[TelegramUrl] [nvarchar](250) NULL,
	[FacebookUrl] [nvarchar](250) NULL,
	[TwitterUrl] [nvarchar](250) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
	[ViewState] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191203194131_Initialize', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191203194557_Add_NewsSeenUser_ForeignKey', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191209212046_Add_SeenCount_Column_to_News', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191210001122_Add_News_and_Comment_relation', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191210005046_Add_Text_Column_into_Comment', N'3.0.0')
SET IDENTITY_INSERT [dbo].[Advertises] ON 

INSERT [dbo].[Advertises] ([Id], [ImageUrl], [Href], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (1, N'https://cdn.cinematicket.org/images/a-d/side/1066-90.jpg', N'www.cinematicket.og', 1, CAST(N'2019-12-10T03:29:57.8533333' AS DateTime2), 1, CAST(N'2019-12-10T03:29:57.8533333' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Advertises] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [ParentId], [Title], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (1, NULL, N'تکنولوژی', 1, CAST(N'2019-12-04T01:00:36.4466667' AS DateTime2), 1, CAST(N'2019-12-04T01:00:36.4466667' AS DateTime2), 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Title], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (2, 1, N'شبکه', 1, CAST(N'2019-12-04T01:00:47.9033333' AS DateTime2), 1, CAST(N'2019-12-10T11:07:04.5033275' AS DateTime2), 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Title], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (4, 1, N'موبایل', 1, CAST(N'2019-12-10T08:12:21.4881420' AS DateTime2), 1, CAST(N'2019-12-10T08:12:21.4881420' AS DateTime2), 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Title], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (5, 1, N'خدمات کامپیوتری', 1, CAST(N'2019-12-10T08:25:21.8177188' AS DateTime2), 1, CAST(N'2019-12-10T08:25:21.8177188' AS DateTime2), 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Title], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (6, NULL, N'سیاسی', 1, CAST(N'2019-12-10T08:25:34.1122199' AS DateTime2), 1, CAST(N'2019-12-10T08:25:34.1122199' AS DateTime2), 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Title], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (7, 6, N'سیاست خارجی', 1, CAST(N'2019-12-10T08:25:45.0631431' AS DateTime2), 1, CAST(N'2019-12-10T08:25:45.0631431' AS DateTime2), 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Title], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (9, NULL, N'اقتصادی', 1, CAST(N'2019-12-10T08:26:05.4454074' AS DateTime2), 1, CAST(N'2019-12-10T08:26:05.4454074' AS DateTime2), 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Title], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (10, NULL, N'فرهنگی', 1, CAST(N'2019-12-10T08:26:23.5611042' AS DateTime2), 1, CAST(N'2019-12-10T08:26:23.5611042' AS DateTime2), 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Title], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (12, 9, N'دلار و ارز', 1, CAST(N'2019-12-10T08:28:14.6345211' AS DateTime2), 1, CAST(N'2019-12-10T11:07:22.6619067' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [AuthorId], [ParentId], [State], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState], [UserId], [NewsId], [Text]) VALUES (1, 1, NULL, 0, 1, CAST(N'2019-12-10T14:42:13.6704875' AS DateTime2), 1, CAST(N'2019-12-10T14:42:13.6704875' AS DateTime2), 1, NULL, 6, N'vgnvnnvbn
')
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[HotNewses] ON 

INSERT [dbo].[HotNewses] ([Id], [NewsId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (1, 3, 1, CAST(N'2019-12-04T01:09:09.9733333' AS DateTime2), 1, CAST(N'2019-12-04T01:09:09.9733333' AS DateTime2), 1)
INSERT [dbo].[HotNewses] ([Id], [NewsId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (2, 5, 1, CAST(N'2019-12-04T01:09:12.6600000' AS DateTime2), 1, CAST(N'2019-12-04T01:09:12.6600000' AS DateTime2), 1)
INSERT [dbo].[HotNewses] ([Id], [NewsId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (3, 6, 1, CAST(N'2019-12-04T01:09:15.8966667' AS DateTime2), 1, CAST(N'2019-12-04T01:09:15.8966667' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[HotNewses] OFF
SET IDENTITY_INSERT [dbo].[NewsCategories] ON 

INSERT [dbo].[NewsCategories] ([Id], [CategoryId], [NewsId], [IsMain], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (1, 1, 1, 1, 1, CAST(N'2019-12-04T01:05:24.5800000' AS DateTime2), 1, CAST(N'2019-12-04T01:05:24.5800000' AS DateTime2), 1)
INSERT [dbo].[NewsCategories] ([Id], [CategoryId], [NewsId], [IsMain], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (2, 1, 2, 1, 1, CAST(N'2019-12-04T01:05:28.8933333' AS DateTime2), 1, CAST(N'2019-12-04T01:05:28.8933333' AS DateTime2), 1)
INSERT [dbo].[NewsCategories] ([Id], [CategoryId], [NewsId], [IsMain], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (3, 1, 3, 1, 1, CAST(N'2019-12-04T01:05:32.7766667' AS DateTime2), 1, CAST(N'2019-12-04T01:05:32.7766667' AS DateTime2), 1)
INSERT [dbo].[NewsCategories] ([Id], [CategoryId], [NewsId], [IsMain], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (4, 1, 4, 1, 1, CAST(N'2019-12-04T01:05:34.3433333' AS DateTime2), 1, CAST(N'2019-12-04T01:05:34.3433333' AS DateTime2), 1)
INSERT [dbo].[NewsCategories] ([Id], [CategoryId], [NewsId], [IsMain], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (5, 1, 6, 1, 1, CAST(N'2019-12-04T01:05:36.3100000' AS DateTime2), 1, CAST(N'2019-12-04T01:05:36.3100000' AS DateTime2), 1)
INSERT [dbo].[NewsCategories] ([Id], [CategoryId], [NewsId], [IsMain], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (6, 2, 5, 1, 1, CAST(N'2019-12-04T01:05:42.2033333' AS DateTime2), 1, CAST(N'2019-12-04T01:05:42.2033333' AS DateTime2), 1)
INSERT [dbo].[NewsCategories] ([Id], [CategoryId], [NewsId], [IsMain], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (7, 6, 7, 1, 1, CAST(N'2019-12-10T13:42:16.9833333' AS DateTime2), 1, CAST(N'2019-12-10T13:42:16.9833333' AS DateTime2), 1)
INSERT [dbo].[NewsCategories] ([Id], [CategoryId], [NewsId], [IsMain], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (8, 6, 8, 1, 1, CAST(N'2019-12-10T13:42:19.2466667' AS DateTime2), 1, CAST(N'2019-12-10T13:42:19.2466667' AS DateTime2), 1)
INSERT [dbo].[NewsCategories] ([Id], [CategoryId], [NewsId], [IsMain], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (10, 6, 9, 1, 1, CAST(N'2019-12-10T13:42:22.5333333' AS DateTime2), 1, CAST(N'2019-12-10T13:42:22.5333333' AS DateTime2), 1)
INSERT [dbo].[NewsCategories] ([Id], [CategoryId], [NewsId], [IsMain], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (11, 6, 9, 1, 1, CAST(N'2019-12-10T13:42:23.9066667' AS DateTime2), 1, CAST(N'2019-12-10T13:42:23.9066667' AS DateTime2), 1)
INSERT [dbo].[NewsCategories] ([Id], [CategoryId], [NewsId], [IsMain], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (12, 6, 10, 1, 1, CAST(N'2019-12-10T13:42:25.7666667' AS DateTime2), 1, CAST(N'2019-12-10T13:42:25.7666667' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[NewsCategories] OFF
SET IDENTITY_INSERT [dbo].[Newses] ON 

INSERT [dbo].[Newses] ([Id], [Headline], [Title], [Text], [ImageUrl], [AuthorId], [Status], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState], [SeenCount]) VALUES (1, N'شرکت فیسبوک اخیرا هدست واقعیت مجازی مستقل Oculus Go را به عنوان رقیب هدست اچ تی سی و دیگر برندهای حاضر معرفی و عرضه کرد. این هدست که از کیفیت ساخت بالایی برخوردار است و با ارگونومی قابل توجهی همراست، تجربه کاربری فوق العاده‌ای را رقم می‌زند.', N'کاهش قیمت هدست مستقل Oculus Go', N'برخلاف هدست‌های قبل Oculus که نیاز به دستگاه ثانویه‌ای بوده، با Oculus Go دیگر نیاز به هیچ دستگاه ثانویه نیست و حتی برای استفاده از آن نیازی به تلفن هوشمند ندارید. این بدان معناست که محدودیت‌ها برداشته شده و شاهد هدست سبک‌تر، کارآمدتر و بسیار راحت‌تر هستید.

برای مثال کاربران می‌توانند با این هدست فیلم شبیه ساز پرواز با هیجان بسیاری تماشا کنند. به تازگی آمازون ایالات متحده برای بلک فرایدی و نزدیک شدن به فصل تعطیلات کاهش قیمت قابل توجهی برای محصول Oculus یعنی Oculus Go در نظر گرفته است.

به شکلی که Oculus Go را تنها با هزینه 119 دلار می‌توان خریداری کرد. از ویژگی‌های کلیدی Oculus Go باید به عدم احتیاج دستگاه اضافی چون رایانه و تلفن هوشمند برای فعال کردن هدست، وزن سبک و ارگونومی بالا در کاربری، صفحه نمایش LCD با وضوح بالا و چندگانه، هدفون‌های باکیفیت صوتی همه جانبه و فروشگاه Oculus Store با بیش از 1000 بازی، اپ و برخی دیگر.

اگر از علاقمندان به هدست‌های واقعیت مجازی هستید و نمی‌توانید گزینه ای با قیمت مناسب تهیه کنید، در حال حاضر Oculus Go به کمترین قیمت ممکن رسیده و قابل خریداری است. برای مثال هدست واقعیت مجازی HTC Vive قیمتی بیش از 600 دلار داشته که هزینه بالایی برای خرید محسوب می‌شود. بنابراین در مقایسه با هزینه هنگفت برای خرید محصول اچ تی سی، این هدست می‌تواند تجربه کاربری خوبی را رقم زند.

شایان ذکر است که اچ تی سی در تلاش بوده به گسترش فروش هدست‌های خود پرداخته و مدل‌های جدیدی را عرضه دارد.', N'https://static2.sakhtafzarmag.com/media/k2/items/cache/e36a9231d63eda176cf356b218639fb4_XL.jpg', 1, 1, 1, CAST(N'2019-12-04T00:52:27.6750606' AS DateTime2), 1, CAST(N'2019-12-04T00:52:27.6750606' AS DateTime2), 1, 0)
INSERT [dbo].[Newses] ([Id], [Headline], [Title], [Text], [ImageUrl], [AuthorId], [Status], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState], [SeenCount]) VALUES (2, N'شرکت سونی در دهه پیشین یکی از برندهای بزرگ صنعت تلفن همراه محسوب می‌شد اما با آغاز دهه جاری عملکرد بخش تلفن هوشمند این کمپانی چندان رضایت بخش نبود و موجب شد تا کاهش فروش شدیدی در محصولات گوشی هوشمند آن به وجود آید.', N'سونی اکسپریا کامپکت جدید اوایل 2020 معرفی می شود', N'براساس آمار سال 2017 سونی تنها 13.5 میلیون دستگاه، سال 2018 کمتر از 6.5 میلیون و سال 2019 تنها 2.5 میلیون دستگاه تلفن هوشمند به فروش رساند که پایین ترین سطح ممکن است. اگرچه فروش پایین اسمارتفون موجب شد تا سونی از برخی بازارها چون خاورمیانه خارج شود اما همچنان در بازارهای آسیای شرقی باقی مانده و به فعالیت ادامه می‌دهد.

این برند ژاپنی در نظر دارد حداقل سال 2020 بتواند عملکرد بهتری در این حوزه داشته باشد. طبق آخرین گزارش‌ها سال 2020 و طی نمایشگاه MWC 2020 سونی به معرفی تلفن هوشمند جدیدی از سری اکسپریا کامپکت می‌پردازد.
<strong>
سونی به دنبال معرفی گوشی هوشمند میان رده
</strong>
براساس گزارش مدل جدید ابعاد 136*60 میلی‌متری داشته و به نمایشگری با نسبت تصویر 21:9 نیز مجهز خواهد بود و این بدان معناست با صفحه نمایش حداقل FHD+ رو به رو هستیم. گفته می‌شود این دیوایس دارای پردازنده هشت هسته‌ای میان رده اسنپدراگون 665 شرکت کوالکام بوده و احتمالا با حافظه رم 6 یا 4 گیگابایتی همراه است.

سیستم عامل اندروید 10 کیو دیگر مشخصه اکسپریا کامپکت سال 2020 خواهد بود. جزئیات کافی نیست و تنها موارد محدودی از این میان رده نسل جدید سونی می‌دانیم. طی سال‌های‌ گذشته سونی اعلام کرد که تنها به عرضه مدل‌های میان رده و پرچمدار می‌پردازد، از این رو هیچ برنامه ای برای عرضه گوشی هوشمند پرچمدار ندارد.

بنابراین باید منتظر ماند تا در اوایل سال 2020 برند ژاپنی محصول مورد اشاره را معرفی و به شایعات پایان دهد. همانطور که گفته شد، اطلاعات بسیار کم است و نمی‌توان به شایعات بی‌اساس نیز اشاره داشت. پیش بینی می‌شود در کنار اکسپریا کامپکت جدید، پرچمدار اکسپریا 2 نیز معرفی گردد.', N'https://static2.sakhtafzarmag.com/media/k2/items/cache/709118363a84b4f378f67fb62b875d92_XL.jpg', 1, 1, 1, CAST(N'2019-12-04T00:53:32.7339763' AS DateTime2), 1, CAST(N'2019-12-04T00:53:32.7339763' AS DateTime2), 1, 0)
INSERT [dbo].[Newses] ([Id], [Headline], [Title], [Text], [ImageUrl], [AuthorId], [Status], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState], [SeenCount]) VALUES (3, N'شیائومی چندی پیش از اولین ساعت هوشمند خود با نام Xiaomi Mi Watch رونمایی کرد. این ساعت حالا در اولین نسخه از به‌روزرسانی فریمور، پیشرفت‌های زیادی کرده است و یکی از مهم‌ترین ویژگی‌های این آپدیت امکان پشتیبانی از iOS می‎باشد. در کنار این آپدیت شیائومی از برنامه Wear App برای پلتفرم iOS نیز رونمایی کرد.', N'امکان پشتیبانی از گوشی‌های آیفون در ساعت‌های هوشمند شیائومی', N'طبق گفته شیائومی این به‌روزرسانی از روز سوم دسامبر، یعنی امروز برای کاربران در چین ارائه خواهد شد و در طی آن روند اتصال به دستگاه نیز بهینه‌تر خواهد شد. گویا کاربران این ساعت از فریز شدن آن در زمان بالا آمدن برای اولین بار شکایت داشتند. آپدیت جدید همچنین به‌نظر می‎رسد که مشکلات مربوط به اعلانات مربوط به برنامه  Xiaomi Wear را نیز برطرف خواهد کرد و اطلاعات موقعیت جغرافیایی کاربران نیز به صورت خودکار آپدیت خواهد شد.', N'https://static2.sakhtafzarmag.com/media/k2/items/cache/24711d48a9d1f555293eba722135cae8_XL.jpg', 1, 1, 1, CAST(N'2019-12-04T00:53:58.4999114' AS DateTime2), 1, CAST(N'2019-12-04T00:53:58.4999114' AS DateTime2), 1, 0)
INSERT [dbo].[Newses] ([Id], [Headline], [Title], [Text], [ImageUrl], [AuthorId], [Status], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState], [SeenCount]) VALUES (4, N'قبل و بعد از به سرقت رفتن گوشی موبایل چه کارهایی باید انجام داد', N'به حداقل رساندن خسارت از دست دادن موبایل', N'رهگیری از راه دور را فعال کنید
رهگیری از راه دور که در اندروید تحت نام Find My Device و در iOS با عنوان Find My iPhone شناخته می‌شود این امکان را در اختیار شما می‌گذارد تا موقعیت مکانی یک گوشی را شناسایی کرده و از راه دور اطلاعات آن را پاک کنید. به این شكل اگر شما گوشی خود را گم کرده باشید می‌توانید آن را پیدا کنید و اگر آن را به سرقت برده باشند می‌توانید داده‌های موجود در آن را پاک کنید.

اگر از یک گوشی اندروید استفاده می‌کنید، ابتدا به Settings برويد و از آنجا گزینه Google را باز کنید. سپس به پایین صفحه حرکت کرده و روی گزينه Security تقه بزنید و در اینجا قابلیت Find My Device را فعال کنید. از این پس شما می‌توانید از طریق صفحه وب Find Your Phone گوشی خود را رهگیری یا اطلاعات آن را پاک کنید.

اگر از آی‌فون استفاده می‌کنید ابتدا به Settings برويد و از آنجا روی Apple ID (نام شما) خود تقه بزنید. سپس iCloud settings را باز کنید و قابلیت Find My iPhone را فعال کنید. حالا شما می‌توانید از طریق وبسایت iCloud گوشی خود را رهگیری یا اطلاعات آن را پاک کنید.

از یک کلمه عبور قدرتمند استفاده کنید
وارد کردن هر باره یک کلمه عبور پیچیده و طولانی در صفحه قفل گوشی می‌تواند عذاب آور باشد، اما بهترین راه برای جلوگیری از دسترسی سارقان به محتوای گوشی شما همین است. بنابراین سعی کنید همیشه روی دستگاه‌های خود یک کلمه عبور قدرتمند قرار دهید. یک کلمه عبور باید شامل ترکیبی از حروف بزرگ و کوچک، عدد و کاراکترهای خاص باشد.



اگر نمی‌خواهید در هر بار استفاده از گوشی خود یک کلمه عبور پیچیده و طولانی را وارد کنید، از قابلیت احراز هویت بیومتریک استفاده کنید. Face ID و اسکنر اثر انگشت یا عنبیه چشم گزینه‌های امنیتی مفیدی در این زمینه هستند.

اعلان‌ها را خصوصی نگه دارید
اگر نگران این هستید که سارقان بتوانند پیام‌های متنی و اعلان‌های شما را از روی صفحه قفل گوشی بخوانند، می‌توانید این نوع از محتوا را از روی صفحه قفل گوشی خود پنهان کنید.

روی دستگاه‌های اندروید، به Settings برويد، بخش Sound and Notifications را باز کنید، سپس گزینه When Device Is Locked را پیدا کنید و آن به وضعیت Hide Sensitive Notification Content تغییر دهید. اگر شما گزینه Don’t Show Notifications At All را انتخاب کنید حتی بعد از باز کردن قفل صفحه هم اعلان‌ها را مشاهده نخواهید کرد.

اگر از آی‌فون استفاده می‌کنید، به Settings برويد، منوی Notifications را باز کنید و بعد روی گزينه Show Previews تقه بزنید. در اینجا شما می‌توانید پیش نمایش اعلان‌ها در صفحه قفل را پنهان کرده و یا کلا آن را غیرفعال كنيد.

اگر قابلیت Face ID روی آی‌فون شما فعال است، به طور پیش فرض اعلان‌ها روی صفحه قفل نمایش داده نمی‌شود تا زمانی که شما قفل صفحه را باز کنید. این کار از مشاهده اعلان‌ها توسط سارقين روی گوشی شما جلوگیری می‌کند.

همگام سازی ابری را فعال کنید
اگر به داده‌های روی گوشی خود اهمیت می‌دهید حتما باید قابلیت همگام سازی ابری را فعال کنید. مسلما وقتی اطمینان خاطر دارید که یک نسخه پشتیبان از اطلاعات و محتوای روی گوشی خود را در محیط ابری در اختیار دارید، پاک کردن داده‌های گوشی به سرقت رفته شما کار ترسناکی نخواهد بود.



برای گوشی‌های اندروید، به Settings برويد و روی بخش Accounts And Backup تقه بزنید، سپس گزینه Back Up My Data را فعال کنید. با این کار از فهرست مخاطبین، اطلاعات لاگین و تنظیمات گوشی شما نسخه پشتیبان تهیه خواهد شد. سپس یک اپلیکیشن مثل Dropbox, Google Drive, Google Photos یا Amazon Photos را دانلود كنيد تا از اسناد، عکس‌ها و ویدیوهای شما نیز نسخه پشتیبان تهیه شود. تنظیمات و فهرست مخاطبین گوشی به طور خودکار با یک تلفن جدید همگام سازی می‌شود و شما می‌توانید با انتخاب یک راهکار ابری به عکس‌ها و ویدیوهای خود نیز دسترسی داشته باشید.

در آی‌فون، ابتدا به Settings برويد و از آنجا روی Apple ID (نام شما) خود تقه بزنید. سپس iCloud settings و بعد از آن iCloud Backup را باز کنید. حالا iCloud Backup را فعال کنید. وقتی یک آی‌فون جدید خریداری می‌کنید در فرآیند تنظیمات از شما پرسیده می‌شود که آیا می‌خواهید تنظیمات، فهرست مخاطبین، عکس‌ها و ویدیوهای خود را از iCloud بازیابی کنید.

در زمان گم شدن یا به سرقت رفتن گوشی موبایل چه باید کرد
حالا که گوشی شما با یک کلمه عبور قدرتمند محافظت شده است، روی محیط ابری همگام سازی می‌شود و می‌توان از راه دور آن را ردگیری کرد، دیگر نباید از دزديده شدن آن زیاد نگران باشید.



اما همچنان چند گام دیگر باید برداشته شود تا از دسترسی سارق به فایل‌های خصوصی، مخاطبین، عکس‌ها و حساب کاربری شما جلوگیری شود:

گوشی خود را ردگیری کنید: به صفحه وب Find My Phone  یا  iCloud برويد تا موقعیت مکانی گوشی خود را پیدا کنید.
اگر دزديده شده آن را پاکسازی کنید: برای مقابله با عواقب به سرقت رفتن داده‌های خود و حفظ حريم خصوصی باید محتوای گوشی را از راه دور پاکسازی کنید.
حساب‌های خود را بررسی کنید: حتی اگر سیستم احراز هویت دو مرحله‌ای را فعال کرده باشید، بهتر است بررسی کنید کسی به حساب‌های کاربری شما دسترسی پیدا نکرده باشد. برای احتیاط بیشتر بهتر است کلمات عبور (به ویژه حساب‌های بانکی و ای‌میل) خود را تغییر دهید.
به اپراتور مخابراتی خود اطلاع دهید: بعد از این که محتوای گوشی خود را از راه دور پاکسازی کردید، برای گزارش دزديده شدن آن با اپراتور مخابراتی خود تماس بگیرید. با این کار سیم کارت شما قفل می‌شود و دیگر نمی‌توان از آن روی دستگاه‌های دیگر استفاده کرد.
به پلیس اطلاع دهید: اگر 100% اطمینان دارید که گوشی شما به سرقت رفته است، آن را به پلیس اطلاع دهید. همیشه یک بازار سیاه بزرگ برای گوشی‌های سرقتی وجود دارد که ممکن است سارق گوشی شما زیاد به آنجا مراجعه کند. اما معمولا حتی بعد از دستگیری سارق شما گوشی خود را به دست نخواهید آورد.
اگر محتاط و کمی‌ خوش شانس باشید هرگز گم شدن گوشی را تجربه نخواهید کرد، هر چند احتمال چنین اتفاقی دور از ذهن نیست. بنابراین انجام مراحل ذکر شده در این مقاله می‌تواند به شما در راه محافظت از حریم خصوصی و امنیت کمک کند.', N'https://www.shabakeh-mag.com/sites/default/files/styles/content/public/images/main/1398/09/1574677114.png?itok=56bXMfCT', 1, 1, 1, CAST(N'2019-12-04T00:55:35.2430718' AS DateTime2), 1, CAST(N'2019-12-04T00:55:35.2430718' AS DateTime2), 1, 0)
INSERT [dbo].[Newses] ([Id], [Headline], [Title], [Text], [ImageUrl], [AuthorId], [Status], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState], [SeenCount]) VALUES (5, N'بهترین ابزارهای نظارت بر شبکه در سال 2019', N'آیا شبکه شما درست کار می‌کند؟', N'ماهیت شبکه تنها از سوی تهدیدات خارجی در معرض خطر قرار نمی‌گیرد، بلکه مسائل مربوط به حفظ و نگهداری پروتکل‌های امنیتی و اطمینان از اتصال پایدار شبکه در زمان نصب به‌روزرسانی‌ها و وصله‌ها نیز مخاطرات خاصی را به همراه می‌آورند. هر چه تعداد دستگاه‌های بیشتری به یک شبکه متصل شوند، چالش‌های پیش رو بیشتر می‌شود. نرم‌افزارها و سخت‌افزارها در گذر زمان قدیمی‌ می‌شوند و آسیب‌پذیری‌های مختلفی در زیرساخت‌های ارتباطی یک سازمان به وجود می‌آورند و خرابی‌های فیزیکی را رقم می‌زنند که در نهایت کاهش بهره‌وری را به همراه دارند. برای مقابله با چنین مشکلاتی راهکارهایی ارائه شده که نه تنها مدیریت بر شبکه‌ها، بلکه نظارت کلی بر شبکه‌ها و نرم‌افزارها را تسهیل می‌کنند. چالش اصلی در نظارت بر شبکه‌ها انتخاب ابزارهای درستی است که فرآیند مدیریت را ساده کرده و هماهنگ با کسب‌وکار باشند. در این مقاله با ابزارها و خدماتی آشنا می‌شویم که اجازه می‌دهند یک نظارت واقعی روی شبکه سازمانی اعمال کنید. ', N'https://www.shabakeh-mag.com/sites/default/files/styles/content/public/images/main/1398/08/1573978261.jpg?itok=_5PgKA6v', 1, 1, 1, CAST(N'2019-12-04T00:56:03.6401697' AS DateTime2), 1, CAST(N'2019-12-04T00:56:03.6401697' AS DateTime2), 1, 0)
INSERT [dbo].[Newses] ([Id], [Headline], [Title], [Text], [ImageUrl], [AuthorId], [Status], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState], [SeenCount]) VALUES (6, N'اینتل و کوالکام به عنوان دو تراشه‌ساز بزرگ امریکایی مدت زمان زیادی با یکدیگر در چالش و نزاع بودند. هر دو این کمپانی‌ها رقابت فشرده‌ای در صنعت مودم‌ها نیز داشتند اما در نهایت این اینتل بود که گود را به رقیب واگذار کرد و قید بازار مودم را زد.', N'انگشت اتهام اینتل به سوی کوالکام به خاطر خروج از بازار مودم‌ها', N'حال اینتل طی پست بلاگی که روز گذشته منتشر کرده، کوالکام را در موضوع خروج خود از بازار مودم مقصر دانسته است. به گفته اینتل، رفتار غیر رقابتی کوالکام باعث از بین فرصت‌ها برای اینتل در بازار مودم شده است. این پست توسط استیون راجرز، معاون اجرایی و مشاور عمومی شرکت اینتل به اشتراک گذاشته شده است و نشان میدهد اینتل در ماه می شکایتی را علیه کوالکام در دادگاه منطقه کالیفرنیا به ثبت رسانده است. در این شکایت اینتل مدعی شده است که کوالکام در بازارهای پر ترافیک تراشه مودم LTE و CDMA رفتارهایی از خود نشان داده که باعث آسیب رساندن به شرکت‌های رقیب، سازندگان و حتی مصرف کنندگان شده است.

راجرز در ادامه عنوان کرده است که اینتل آسیب رفتارهای غیر رقابتی از سوی کوالکام را دیده است که باعث شده این کمپانی نتواند از فرصت‌های خود در بازار مودم بهره‌مند شود. رفتار غیر رقابتی کوالکام، عدم فروش محصولات به مصرف کننده و فروش تراشه‌ها با قیمت غیر واقعی بوده است. در گذشته اینتل شکایتی را علیه کوالکام در دادگاه ضد انحصار ایالات متحده تنظیم کرد و در ماه آوریل، پس از توافقی که میان کوالکام و اپل صورت گرفت، اینتل مجبور به خروج از بازار مودم 5G شد. البته موضوع مهمی که در اینجا وجود دارد این است که اینتل در صنعت مودم 5G تا پیش از خروج از آن فعالیت خاصی نداشت و به طور کلی نمیتوانست تامین کننده مودم‌های 5G اپل باشد.

در ادامه پست استیون راجرز، وی گفته است که اینتل در ده سال گذشته میلیاردها دلار هزینه کرد و دو کمپانی را برای فعالیت در بازار مودم 5G خریداری کرده اما به خاطر اقدامات غیر منصفانه کوالکام نتوانسته به موفقیتی دست پیدا کند. یکی دیگر از برنامه های غیر رقابتی کوالکام، سیاست بدون لایسنس، بدون تراشه نام داشته است که در این برنامه، کوالکام هیچ تراشه‌ای را به فروشندگان به فروش نمیرسانده مگر آنکه با قوانین پتنتی کوالکام موافقت کند و قوانین این کمپانی را بپذیرد. با این حرکت کوالکام به طور مصنوعی قیمت تراشه های خود را پائین میاورده و باعث میشده است که رقبایی مانند اینتل نتوانند در این صنعت به تجارت بپردازند.', N'https://static2.sakhtafzarmag.com/media/k2/items/cache/287f15c850828819078251b246a551ec_XL.jpg', 1, 1, 1, CAST(N'2019-12-04T00:57:49.5262807' AS DateTime2), 1, CAST(N'2019-12-04T00:57:49.5262807' AS DateTime2), 1, 0)
INSERT [dbo].[Newses] ([Id], [Headline], [Title], [Text], [ImageUrl], [AuthorId], [Status], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState], [SeenCount]) VALUES (7, N'رئیس مجلس شورای اسلامی با بیان اینکه «هر اقدام معقولی که می‌خواهیم انجام دهیم باید آن را برای جامعه باز کنیم»، گفت: مردم ما مردم فهیمی هستند و اگر بدانند کاری منطقی است، از آن حمایت می کنند.', N'لاریجانی: اگر مردم بدانند کاری منطقی است، حمایت می‌کنند', N'به گزارش ایسنا، علی لاریجانی در مراسم افتتاح واحد نخست بخش گاز نیروگاه سیکل ترکیبی دالاهو در استان کرمانشاه بر لزوم اصلاح چرخه‌های اقتصادی کشور تاکید کرد و گفت: تنها در اینصورت است که می توانیم سرمایه گذاری و اشتغال در کشور ایجاد کنیم.

وی افزود: متاسفانه گاها شاهدیم موضوعات ملی و تخصصی دستمایه کشمکش‌های سیاسی شده و همین باعث می شود فضا برای تحقق یک تفکر ملی فراهم نشود که آسیب زا است.

لاریجانی با بیان اینکه «همه نهادها و دستگاه ها باید دست به دست هم بدهند و اتحاد داشته باشند تا بتوانیم اصلاحات واقعی را در اقتصاد رقم بزنیم»، گفت: باید مسائل را نیز برای ملت بازگو کنیم. مردم ما مردم فهیمی هستند و از امور منطقی حمایت می کنند.

رییس مجلس با بیان اینکه «باید فضا را برای فعالیت و سرمایه گذاری بخش خصوصی فراهم کنیم»، گفت: البته اگر چه حمایت از بخش خصوصی ضروری است، اما نباید به بهانه اجرای اصل ۴۴ قانون اساسی برخی امور به نهادهای غیرتخصصی واگذار شود که متاسفانه در گذشته این کار صورت گرفته و برخی نیروگاه ها بابت دیون به نهادهای غیرتخصصی واگذار شده که خلاف قانون است و باید برگردانده شود.

وی افزود: یکی از ایرادات ما به دولت همین موضوع است و باید واگذاری ها به بخش خصوصی صاحب صلاحیت صورت بگیرد.

لاریجانی در ادامه با بیان اینکه «وزارت نیرو اقدامات خوبی در حوزه تامین برق داشته است»، گفت: نباید اجازه دهیم بادهای موسمی که در فضای سیاسی کشور می‌وزد، حواس ما را از این خدمات پرت کند.

لاریجانی افزود: در برنامه ششم توسعه نیز فضا برای فعالیت بخش خصوصی در صنعت برق کشور به خوبی دیده شده، البته مشکلاتی هم وجود دارد که گاها باعث کاهش انگیزه فعالان بخش خصوصی می شود که باید چاره ای برای رفع آنها اندیشید.', N'https://cdn.isna.ir/d/2019/12/10/3/61507735.jpg', 1, 1, 1, CAST(N'2019-12-10T13:38:24.8348582' AS DateTime2), 1, CAST(N'2019-12-10T13:38:24.8348582' AS DateTime2), 1, 0)
INSERT [dbo].[Newses] ([Id], [Headline], [Title], [Text], [ImageUrl], [AuthorId], [Status], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState], [SeenCount]) VALUES (8, N'دبیر و سخنگوی ستاد انتخابات کشور، گزارش آخرین وضعیت ثبت‌نام انتخابات میان‌دوره‌ای مجلس خبرگان رهبری را اعلام کرد.', N'ثبت‌نام ۱۳۵ نفر تاکنون در انتخابات مجلس خبرگان', N'ه گزارش ایسنا به نقل از وزارت کشور، سید اسماعیل موسوی، با اعلام ثبت نام ۱۳۵ نفر تاکنون در این انتخابات، وضعیت تفکیک استانی ثبت نام در این انتخابات را بدین شرح برشمرد:

- استان قم ۶۱ نفر
- استان تهران ۵۵ نفر
- استان خراسان رضوی ۹ نفر
- استان خراسان شمالی ۷ نفر
- استان فارس ۳ نفر

بر اساس این گزارش،‌ ثبت نام انتخابات اولین میان دوره‌ای پنجمین دوره مجلس خبرگان رهبری، که در ۵ استان برگزار می‌شود، تا ۲۱ آذر ماه ادامه دارد.', N'https://cdn.isna.ir/d/2019/04/10/3/57859306.jpg', 1, 1, 1, CAST(N'2019-12-10T13:39:04.0249496' AS DateTime2), 1, CAST(N'2019-12-10T13:39:04.0249496' AS DateTime2), 1, 0)
INSERT [dbo].[Newses] ([Id], [Headline], [Title], [Text], [ImageUrl], [AuthorId], [Status], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState], [SeenCount]) VALUES (9, N'فرمانده سابق سپاه تصریح کرد که تنها راهی که مردم را از این بن بست خارج می کند تغییر رویکرد مردم در انتخاب هایشان است.', N'سردارجعفری: تنها راه خروج مردم از بن‌بست تغییر انتخاب‌هایشان است', N'به گزارش ایسنا، سردار محمد علی جعفری در برنامه جهان آرا با بیان اینکه در دهه دوم انقلاب ماهیت تهدیدات تغییر کرد ،گفت: با توجه به حماسه بزرگی که در جنگ آفریده شد و درس بزرگی که به دشمن داده شد و مرزهای کشور در برابر تجاوز بیگانگان امن شد دشمن فهمید باید روش خود را عوض کند.

وی ادامه داد: شاید قبلا این موضوع(امنیت) حس نمی شد اما اتفاقاتی که در سال 98 افتاد نشان داد که ما از چه قدرت دفاعی برخوردار هستیم. امروز فناوری همراه با کمک مردم یک قدرت بازداندگی بالایی را برای کشور ایجاد کرده است.

فرمانده سابق سپاه تصریح کرد: از دهه دوم انقلاب، آمریکایی ها متوجه شدند که باید از طریق جنگ نرم و شبیخون فرهنگی با هدف سست کردن باورهای مردم کار خود را شروع کنند. بعد از آن تهدیدات سیاسی هم از ناحیه مخالفان داخلی انقلاب شروع شد. در دهه دوم انقلاب آنهایی که با استمرار انقلاب اسلامی مخالف بودند توقف انقلاب اسلامی را هم مطرح کردند که از سوی رئیس جمهور وقت به آنها تذکر داده شد که این قدر تندروی نکنید و همه چیز را لو ندهید. در حالیکه ماهیت انقلاب اسلامی فقط پیروزی نبود، بلکه این حرکت باید به سمت اهداف انقلاب اسلامی استمرار داشته باشد.

مسئول قرارگاه بقیه الله عنوان کرد: دیدگاه  های انحرافی چنین نگرشی دارند وگرنه حضرت امام بارها اشاره کردند که هدف، استقرار ارزش های اسلامی است که اولین آنها عدالت اجتماعی است. اما حفظ استقلال کشور و پیاده سازی احکام اسلامی مواردی است که باید در روند انقلاب اسلامی تحقق پیدا کند.

وی گفت: ما حتی به دلیل برخی دیدگاه های غلط دولتمردان وقت به دلیل پیروی از سیاست های اقتصادی غربی به همراه  نگاه های لیبرالی و بی توجهی به مردم و نقش آنها در حل مشکلات اقتصادی با تهدیدات اقتصادی مواجه شدیم تا جایی که دشمنان تحریم اقتصادی را از هشت سال قبل به بهانه انرژی هسته ای آغاز کردند و تهدیدات علیه ما همه جانبه شد و یک مجموعه از جنگ نرم علیه انقلاب اسلامی آغاز شد. این تغییر ماهیت تهدیدات مسئله ای بود که در ذهن رهبر انقلاب بود و از اوایل سال 80 این بیان شد و می خواستند سپاه ماموریت اصلی اش یعنی حفظ انقلاب اسلامی را فراموش نکند.

سردار جعفری اضافه کرد: زمانیکه من در سپاه مسئولیت را بر عهده  گرفتم با همین نگاه، تحولاتی در سپاه انجام شد تا آمادگی سپاه همه جانبه شود. از سال 86 مقابله با جنگ نرم به سپاه ابلاغ شد و در همین راستا تشکیل سپاه های استانی با ماموریت مقابله با جنگ نرم آغاز شد. بعد ما ساختار مناسبی برای این کار تدوین کردیم تا اینکه در پایان سال 97 به این اطمینان رسیدم که اگر تهدید نظامی و امنیتی پیش آید قدرت ما به حدی رسیده است که می تواند به راحتی با دشمن مقابله کند. در عرصه امنیتی هم در این فتنه ای که اخیرا پیش آمد علی رغم آمادگی دشمن، ظرف دو سه روز حل شد. اما آنچه نگران کننده بود همین تهدیدات نرم بود که به میدان آوردن مردم برای نقش آفرینی موثر در جنگ نرم ساز و کاری می خواست. که ما باید در قرارگاه  فرهنگی اجتماعی بقیه الله آن را دنبال کنیم.

وی درباره موضوع جوانگرایی اظهار داشت: از ابتدای سال 97 رهبر انقلاب انتظاراتی را از جوانان بیان کردند و خواستند آنها پیشتازی کنند. در آخرین صحبتی که  کردند بر پیاده سازی بیانیه گام دوم تاکید کردند  و این یعنی ایجاد جامعه  اسلامی و حرکت به سمت تمدن اسلامی. در گام اول انقلاب، مردم انقلاب کرده و انقلاب را آنچنان در برابر دشمنان تثبیت کردند که هیچ تهدیدی نمی تواند با آن مقابله کند و در برابر دشمنی فیزیکی مصون شده است. در گام دوم باید به سمت حرکت های ایجابی و در حقیقت جامعه سازی رفت. خواست رهبر انقلاب حرکت عمومی جامعه به سمت اسلامی شدن جامعه و دستگاه های نظام است.

مسئول قرارگاه بقیه الله  ادامه داد : برای اینکه از این مشکلات که امروز در اوج آن هستیم عبور کنیم نیاز به یک حرکت نهضت گونه  است که  رهبر انقلاب از آن به عنوان حرکت آتش به اختیار نام بردند، این حرکت احتیاج به برنامه ریزی و انتقال تجربه و مجموعه سازی دارد تا این حرکت عظیم با محوریت جوانان متعهد ان‌شاء الله پیش برود. این کاری است که در قرارگاه دنبال می کنیم.

وی با بیان اینکه شرایط انقلاب کاملا روشن است گفت: ابهام برخی ناشی از جنگ روانی دشمن و سوء مدیریت های داخلی است. امروز مشکلات روی مسائل داخلی و اقتصادی و معشیتی مردم تمرکز دارد. بعد از این، بحث دیگری تحت عنوان فساد و تبعیض و بی عدالتی مطرح می شود که باز هم ذیل مشکلات اقتصادی قرار دارد، بقیه مسائل هم همانطور که مبارزه با فساد با یک اراده جدید شروع شده است و ان‌شاء الله ادامه پیدا کند قابل حل هستند.

سردار جعفری با اشاره به اینکه در چهل سال اول انقلاب کار بزرگی انجام شده است ، تاکید کرد: ماندگاری انقلاب کار بزرگی است و همچنین عظمت راه طی شده و کارکرد انقلاب تا امروز هم کار بزرگی است. عظمت چشم اندازی که باید به آن برسیم و نقش نیروی جوان متعهد هم از موضوعات مهمی است که باید به آن توجه کرد. در چهل سال اول ما با دشمنی دشمنان انقلاب مقابله می کردیم و در نتیجه در منطقه تقریبا آمریکایی ها به هیچ هدفی نرسیدند. از شهریور سال 80 که آمریکایی ها به منطقه لشکر کشی کردند، همه هدف آنها این بود که بتوانند با برهم زدن اوضاع داخلی، ایران را کنترل کنند اما همه اینها شکست خورده و بر عکس شده است.

وی خاطرنشان کرد: امروز در عراق دولتی هماهنگ با اهداف انقلاب روی کار آمده است و در عراق  و سوریه هم داعش را ایجاد کردند که نتیجه  آن به ضرر آنها شد. در ادامه اسرائیل به جنوب لبنان حمله کرد تا گسترش پیدا کند که نه تنها شکست خورد بلکه درون فلسطین اشغالی هم مشکل دارند.

وی عنوان کرد: برد حرف جمهوری اسلامی تا اروپا و آمریکا رفته و این کار بزرگی است. در برابر همه اینها مشکل اقتصاد و معیشت در داخل کشور اساسی است. همه اقتدار و عظمت انقلاب در بعد مسائل تهدیدات دفاعی و امنیتی است و انقلاب تثبیت صد در صدی در مقابل تهدیدات دفاعی و امنیتی شده است.

وی خاطرنشان کرد:آنچه که همه به آن اذعان دارند نقش نیروی جوان متعهد انقلاب در عرصه دفاعی و امنیتی است. در هر عرصه ای نگاه کنید نقش نیروهای جوان مشخص است. نوعی تفکر پشت این حرکت ها خوابیده است که به آن تفکر جهادی و اسلامی می گوییم. در برابر آن تفکر غیرانقلابی و لیبرالی قرار دارد.این اختلاف دیدگاه در کشور در دفاع  مقدس هم بود. یکسال اول جنگ بنی صدر مخالف حضور نیروهای جوان بود. بعد از فرار بنی صدر با 4 عملیات بزرگ ظرف 8 ماه خرمشهر آزاد شد.

فرمانده سابق سپاه  افزود: برای آزادی خرمشهر، تغییر در تفکر و مدیریت صحنه نبرد انجام گرفت.اما این اتفاق چرا در باقی نقاط کشور نیافتاده است. اگر این اتفاق در کشور بیافتد تمام مشکلات کشور قابل حل است.

وی با بیان اینکه عامل اصلی پیروزی ما در دفاع مقدس که محور اصلی حرکت انقلاب شده است نقش آفرینی مردم و مدیریت و رهبری جنگ بوده است گفت: ما باید به این مبانی توجه کنیم. مشکل امروز ما مباحث مدیریتی است. مشکلات انقلاب اسلامی برای حل مسائل اقتصادی با تغییر در رویکرد مدیریتی از جنس تغییر تفکر غیر انقلابی  به رویکرد انقلاب قابل حل است.

سردار جعفری ادامه داد: در یک دولت چشمه هایی از این را مردم دیدند اما کامل و جامع نبود. مدیریت کشور باید با همان نگاه  رهبری که نگاه اسلام ناب است هماهنگ شود. اگر کسی در این مبانی اشکال داشته باشد، سنجش آن، وظیفه سنگین شورای نگهبان است. که فکر نمی کنم شورای نگهبان با این دقت نگاه  کنند و روی مبانی فکری افراد برای تایید صلاحیت تمرکز کنند. الان در همین کشورهایی که مهد دموکراسی هم هستند باید نگاه فرد با نگاه حکومت بخواند.اما آقایانی که اینجا روی کار می آیند ابایی ندارند که بگویند دیدگاه ما با رهبری اختلاف دارد. خوب اگر دیدگاهت اختلاف دارد برای چه آمدی؟

مسئول قرارگاه بقیه الله خاطر نشان کرد: اگر صحبت از دیدگاه جهادی می کنیم باید با دیدگاه اسلام و رهبری تطبیق کند. خیلی ها ادعای انقلابی بودن کردند و می‌کنند. مهم این است که چه کسی دیدگاه هایش به صورت واقعی منطبق بر اسلام ناب باشد. این را در دستگاه های اجرایی کمتر داشته ایم.

وی افزود:اینکه صرفا هر کسی می گوید در چارچوب هستیم کافی نیست. در همه  کشورها اینطور است که عقبه فکری افراد را بررسی می کنند. از اول انقلاب تا امروز مشکل ما در اداره کشور با تفکراتی که به اسم تفکر انقلابی اما در حقیقت تفکر لیبرالی بوده اند، بوده است. برای حل این معضل یا عبور از این مشکل باید کسانیکه در چارچوب این نظام هستند پای کار بیایند. مبنای این جمهوری اسلام ناب است. اسلام ناب را رهبری تعریف می کنند و کسانی می توانند اسلام  ناب را پیاده  کنند که مبانی افکارشان گرایش به علوم انسانی غربی نداشته باشد.

وی در تبیین نقش مردم در پیش برد اهداف انقلاب گفت: متاسفانه آنچه از نقش مردم  در ذهن ما است  حضور مردم در راهپیمایی ها و پای صندوق های رای است. البته یکی از رمزهای ماندگاری انقلاب همین حضور مردم در صحنه بوده است. اما نکته اساسی این است که نباید حضور موثر مردم را صرفا حضور در راهپیمایی دانست. خیلی از کشورهای اروپایی بیش از ما مردمشان را در حل مشکلات کشور دخالت می دهند. در جنگ هم تکفر لیبرالی بنی صدر اعتقادی به حضور مردم در جنگ نداشت. در مسائل امنیتی همینطور در ناامنی های جنوبشرق و شمالغرب که  امروز بسیجیان  بومی در آنجا مشغول به  خدمت هستند و حضور گردانهای بسیج برای مقابله با ناامنی ها و مسائل داخلی تعیین کننده بوده است.

وی اضافه کرد:ممکن است باز هم این اشتباه رخ دهد که  فکر کنند نقش مردم فقط حضور فیزیکی است. نقش مردم باید در حل مشکلات سیاسی اقتصادی اجتماعی و فرهنگی تعریف شود.

سردار جعفری با طرح سوالی درباره چگونگی نقش آفرینی مردم تاکید کرد: خواست رهبر انقلاب ایجاد هسته های خودجوش مردمی با محوریت جوانان متعهد برای حل مشکلات است که البته این  حرکت شروع شده است. این  کار نیاز به تمرکز و پیگیری دارد و نیازمند هدایت و برنامه ریزی است که این به عهده حلقه های میانی و خود مردم است.

وی گفت: در کشور ما مرم باید بدانند عدالت اجتماعی بدون قیام و حرکت کردن امکان ندارد اتفاق بیافتد. دقیقا در زمانی که اسلام در حاکمیت قرار می گیرد مردم باید برای برقراری عدالت اجتماعی حرکت کنند. این حرکت مردمی اولین  اسمش جهاد است. جهاد که فقط جنگ نظامی نیست. عمده کار، جهاد فرهنگی اجتماعی است و امروز این اولویت دارد. جنگیدن با سیستم های فساد و بی عدالتی و سوء مدیریت ها خودش جهاد است. اینکه بگوییم چون مسئولان  در صحنه نیستند ما هم کار نکنیم درست نیست.

وی با اشاره  به نگرانی برخی از بی تجربگی جوانان عنوان کرد: در جنگ این مشکل نبود چون آن جوانی که به  جبهه می آمد هرلحظه امکان شهید شدن او وجود داشت. اینجا برای مقام و پست این خطر کاملا جدی است. جوانگرایی نباید رانتی و سفارشی باشد. جوانگرایی باید جوانگرایی واقعی باشد و سیلی خورده ها و کسانیکه تفکر آنها با رهبری همگرا است باید میدان پیدا کنند.

سردار جعفری با اشاره به تغییرات مورد انتظار مردم عنوان کرد: مردم از گرایشات مختلف خسته شده اند و کسانیکه قبلا مردم تجربه کرده اند امتحان خوبی پس نداده اند. مردم می دانند در همین شرایط اگر به توصیه های رهبر انقلاب درباره اقتصاد مقاومتی گوش داده می شد بسیاری از این مشکلات نبود.

مسئول قرارگاه بقیه  الله تصریح کرد: به  نظر من خواست رهبر انقلاب این است که جوانگرایی تنها راه برون رفت از این مشکلات است. تنها راهی که مردم را از این بن بست خارج می کند تغییر رویکرد مردم در انتخاب هایشان است.مردم هیچ چاره ای ندارند جز اینکه به سمت نیروی جوان مسلمان انقلاب مجاهد بروند که پشت سر رهبری مشکلات مردم را یکی پس از دیگری حل کنند.

وی با بیان اینکه مشکل اصلی ما ساختار نیست، افزود:  سیستم ها و روش های اداره کشور مشکل دارد اما این مشکل ساختاری نیست. سیستم ها یا آیین نامه های اداری باید تغییر کنند. اولین اتفاقی که باید بیافتد همین تغییر روش ها و بروکراسی است.

وی ادامه داد: با نیروی جوان انقلابی که مبانی فکری اش با انقلاب هماهنگ باشد این مشکلات حل می شود. جوانگرایی باید همیشه در مسئولین  کشور باشد و همیشه باید نیروی جوان تازه نفس در راس باشد. در سپاه تا حدی این  جوانگرایی انجام شده است. و در چند سال آینده نیروهای جوانی که  در سپاه وارد شده اند می توانند امورات را به عهده بگیرند.

فرمانده سابق سپاه  ادامه داد: همه دنیا می داند جمهوری اسلامی در عرصه دفاع و امنیت وضعیتش عالی است؛ موشک های بالای هزار کیلومتر ما نقطه زن شدند و دشمن در قلعه ای در اتاقی جلسه دارد و موشک به همان اتاق اصابت می کند که نتیجه کار جوانان است. من به شهید طهرانی مقدم گفتم چرا نمی توانیم موشکی را بسازیم که در ارتفاع بالا هدف بزند؟ گفت: می توانیم. و الان موشکی داریم که این کار را می کند.

وی خاطرنشان کرد:آنچه  که باید در کشور اتفاق بیافتد ضرورت ایجاد یک حرکت اجتماعی است که به دعوت رهبری باید انجام شود. اول جوانان باید این برنامه ریزی را انجام دهند و بعد هم  مردم آنها را همراهی کنند تا بسیاری از این مشکلات که توسط خود مردم قابل حل است مرتفع شود،در گام دوم انقلاب باید مدیریت جهادی از جنس اسلام ناب در مقابل مدیریت لیبرال قد علم کند.', N'https://cdn.isna.ir/d/2019/12/10/3/61507574.jpg', 1, 1, 1, CAST(N'2019-12-10T13:39:38.2309107' AS DateTime2), 1, CAST(N'2019-12-10T13:39:38.2309107' AS DateTime2), 1, 0)
INSERT [dbo].[Newses] ([Id], [Headline], [Title], [Text], [ImageUrl], [AuthorId], [Status], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState], [SeenCount]) VALUES (10, N'رییس ستاد گرامیداشت نهم دی استان تهران با تأکید بر ضرورت تبیین زوایای فتنه سال ۸۸ گفت: ۹ دی متعلق به گروه و جناح سیاسی خاصی نیست و همه باید به وظیفه خود در این راستا عمل کنند.', N'۹ دی متعلق به گروه و جناح سیاسی خاصی نیست', N'به گزارش ایسنا، حجت الاسلام سیدمحسن محمودی صبح سه شنبه در جلسه ستاد نهم دی ماه استان تهران که با حضور کلیه نهادها، ادارات و نمایندگان احزاب در ساختمان مرکزی شورای هماهنگی تبلیغات اسلامی استان تهران برگزار شد، اظهارکرد: امروز حساسیت دشمن روی مراسم ۹ دی از ۲۲ بهمن نیز بیشتر شده است ، علت آن هم این است، که ۹ دی مرز بین جریان انقلابی و غیر انقلابی است و اهمیت فراوانی دارد.

وی با اشاره به این نکته که فتنه سال ۸۸ یک میزان  و معیار برای سنجش بصیرت و پایبندی خواص و مردم به ارزش ها و اصول انقلاب اسلامی بود، اظهار کرد: مردم در جریان حوادث سال ۸۸ به خوبی بصیرت خود را نشان داده و در ۹ دی طومار فتنه گران را در هم پیچیدند.

رییس شورای هماهنگی تبلیغات اسلامی استان تهران افزود: نهم دی تمامی معادلات و برنامه های دشمن را که حاصل سال ها تلاش بود، برهم زد و قدرت و عظمت نظام اسلامی را دو چندان کرد.

 محمودی بیان کرد: فتنه خط قرمز نظام اسلامی محسوب شده و تعابیر مقام معظم رهبری مبنی بر زنده نگهداشتن حماسه نهم دی نشان دهنده عظمت حرکت ملت ایران در خنثی سازی توطئه های دشمن است.

رییس شورای هماهنگی تبلیغات اسلامی استان تهران یادآور شد: سالگرد حماسه ۹ دی بهترین فرصت برای بیان مجدد حوادث آن دوران و افشای ماهیت جریان مستکبر برای ضربه زدن به نظام اسلامی است.

 محمودی خاطر نشان کرد: از امروز تا نهم دی ماه وقت زیادی نداریم پس دست در دست یکدیگر و با اتحاد و همدلی و در کنار یکدیگر خود یک رسانه باشیم و در روز نهم دی ماه حضور پر رنگ داشته باشیم و با استفاده از رسانه های موجود از جمله فضای مجازی و خبرگزاری ها کشوری تبلیغات مناسبی برای یوم الله ۹دی ماه باشیم.', N'https://cdn.isna.ir/d/2019/12/10/3/61507450.jpg', 1, 1, 1, CAST(N'2019-12-10T13:40:10.1971044' AS DateTime2), 1, CAST(N'2019-12-10T13:40:10.1971044' AS DateTime2), 1, 0)
SET IDENTITY_INSERT [dbo].[Newses] OFF
SET IDENTITY_INSERT [dbo].[Subscribers] ON 

INSERT [dbo].[Subscribers] ([Id], [EMail], [Name], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (1, N'mohammadmahdi.hamzeh@yahoo.com', N'محمدمهدی', 0, CAST(N'2019-12-10T06:53:10.8672899' AS DateTime2), 0, CAST(N'2019-12-10T06:53:10.8672899' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Subscribers] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [FirstName], [LastName], [ProfilePictureUrl], [Biography], [TelegramUrl], [FacebookUrl], [TwitterUrl], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [ViewState]) VALUES (1, N'meytol', N'mohammadmahdi.hamzeh@yahoo.com', N'Leomleom1997', N'محمدمهدی', N'حمزه', N'https://i.pinimg.com/280x280_RS/73/a1/5e/73a15e001b820dbd04e28f475afd5d36.jpg', N'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد. ', N't.me/mohammadmahdi_hamzeh', NULL, NULL, 1, 0, CAST(N'2019-12-04T00:49:06.4483340' AS DateTime2), 0, CAST(N'2019-12-04T00:49:06.4483340' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [IX_Comments_NewsId]    Script Date: 28/10/98 10:47:30 ق.ظ ******/
CREATE NONCLUSTERED INDEX [IX_Comments_NewsId] ON [dbo].[Comments]
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_UserId]    Script Date: 28/10/98 10:47:30 ق.ظ ******/
CREATE NONCLUSTERED INDEX [IX_Comments_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HotNewses_NewsId]    Script Date: 28/10/98 10:47:30 ق.ظ ******/
CREATE NONCLUSTERED INDEX [IX_HotNewses_NewsId] ON [dbo].[HotNewses]
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NewsCategories_CategoryId]    Script Date: 28/10/98 10:47:30 ق.ظ ******/
CREATE NONCLUSTERED INDEX [IX_NewsCategories_CategoryId] ON [dbo].[NewsCategories]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NewsCategories_NewsId]    Script Date: 28/10/98 10:47:30 ق.ظ ******/
CREATE NONCLUSTERED INDEX [IX_NewsCategories_NewsId] ON [dbo].[NewsCategories]
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Newses_AuthorId]    Script Date: 28/10/98 10:47:30 ق.ظ ******/
CREATE NONCLUSTERED INDEX [IX_Newses_AuthorId] ON [dbo].[Newses]
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NewsSeens_NewsId]    Script Date: 28/10/98 10:47:30 ق.ظ ******/
CREATE NONCLUSTERED INDEX [IX_NewsSeens_NewsId] ON [dbo].[NewsSeens]
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NewsSeens_UserId]    Script Date: 28/10/98 10:47:30 ق.ظ ******/
CREATE NONCLUSTERED INDEX [IX_NewsSeens_UserId] ON [dbo].[NewsSeens]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleActions_ActionId]    Script Date: 28/10/98 10:47:30 ق.ظ ******/
CREATE NONCLUSTERED INDEX [IX_RoleActions_ActionId] ON [dbo].[RoleActions]
(
	[ActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleActions_RoleId]    Script Date: 28/10/98 10:47:30 ق.ظ ******/
CREATE NONCLUSTERED INDEX [IX_RoleActions_RoleId] ON [dbo].[RoleActions]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserRoles_RoleId]    Script Date: 28/10/98 10:47:30 ق.ظ ******/
CREATE NONCLUSTERED INDEX [IX_UserRoles_RoleId] ON [dbo].[UserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserRoles_UserId]    Script Date: 28/10/98 10:47:30 ق.ظ ******/
CREATE NONCLUSTERED INDEX [IX_UserRoles_UserId] ON [dbo].[UserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT ((0)) FOR [NewsId]
GO
ALTER TABLE [dbo].[Newses] ADD  DEFAULT ((0)) FOR [SeenCount]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Newses_NewsId] FOREIGN KEY([NewsId])
REFERENCES [dbo].[Newses] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Newses_NewsId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_UserId]
GO
ALTER TABLE [dbo].[HotNewses]  WITH CHECK ADD  CONSTRAINT [FK_HotNewses_Newses_NewsId] FOREIGN KEY([NewsId])
REFERENCES [dbo].[Newses] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HotNewses] CHECK CONSTRAINT [FK_HotNewses_Newses_NewsId]
GO
ALTER TABLE [dbo].[NewsCategories]  WITH CHECK ADD  CONSTRAINT [FK_NewsCategories_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsCategories] CHECK CONSTRAINT [FK_NewsCategories_Categories_CategoryId]
GO
ALTER TABLE [dbo].[NewsCategories]  WITH CHECK ADD  CONSTRAINT [FK_NewsCategories_Newses_NewsId] FOREIGN KEY([NewsId])
REFERENCES [dbo].[Newses] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsCategories] CHECK CONSTRAINT [FK_NewsCategories_Newses_NewsId]
GO
ALTER TABLE [dbo].[Newses]  WITH CHECK ADD  CONSTRAINT [FK_Newses_Users_AuthorId] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Newses] CHECK CONSTRAINT [FK_Newses_Users_AuthorId]
GO
ALTER TABLE [dbo].[NewsSeens]  WITH CHECK ADD  CONSTRAINT [FK_NewsSeens_Newses_NewsId] FOREIGN KEY([NewsId])
REFERENCES [dbo].[Newses] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsSeens] CHECK CONSTRAINT [FK_NewsSeens_Newses_NewsId]
GO
ALTER TABLE [dbo].[NewsSeens]  WITH CHECK ADD  CONSTRAINT [FK_NewsSeens_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[NewsSeens] CHECK CONSTRAINT [FK_NewsSeens_Users_UserId]
GO
ALTER TABLE [dbo].[RoleActions]  WITH CHECK ADD  CONSTRAINT [FK_RoleActions_Actions_ActionId] FOREIGN KEY([ActionId])
REFERENCES [dbo].[Actions] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleActions] CHECK CONSTRAINT [FK_RoleActions_Actions_ActionId]
GO
ALTER TABLE [dbo].[RoleActions]  WITH CHECK ADD  CONSTRAINT [FK_RoleActions_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleActions] CHECK CONSTRAINT [FK_RoleActions_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [NewsAgencyDB] SET  READ_WRITE 
GO
