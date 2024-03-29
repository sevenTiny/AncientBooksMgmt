USE [master]
GO
/****** Object:  Database [DB_QX_Frame_MS_CMS]    Script Date: 04/22/2018 17:55:18 ******/
CREATE DATABASE [DB_QX_Frame_MS_CMS] ON  PRIMARY 
( NAME = N'DB_QX_Frame_MS_CMS', FILENAME = N'D:\guji_mgmt\database\DB_QX_Frame_MS_CMS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_QX_Frame_MS_CMS_log', FILENAME = N'D:\guji_mgmt\database\DB_QX_Frame_MS_CMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_QX_Frame_MS_CMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET ANSI_NULLS OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET ANSI_PADDING OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET ARITHABORT OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET  DISABLE_BROKER
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET  READ_WRITE
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET RECOVERY FULL
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET  MULTI_USER
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [DB_QX_Frame_MS_CMS] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_QX_Frame_MS_CMS', N'ON'
GO
USE [DB_QX_Frame_MS_CMS]
GO
/****** Object:  Table [dbo].[TB_CmsStatusName]    Script Date: 04/22/2018 17:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CmsStatusName](
	[StatusId] [int] NOT NULL,
	[StatusName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_TB_StatusName] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TB_CmsStatusName] ([StatusId], [StatusName]) VALUES (1, N'Nomal')
INSERT [dbo].[TB_CmsStatusName] ([StatusId], [StatusName]) VALUES (2, N'Delete')
/****** Object:  Table [dbo].[TB_CmsStatus]    Script Date: 04/22/2018 17:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CmsStatus](
	[CmsUid] [uniqueidentifier] NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_TB_CmsStatus] PRIMARY KEY CLUSTERED 
(
	[CmsUid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TB_CmsStatus] ([CmsUid], [StatusId]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-111aa0499c02', 2)
INSERT [dbo].[TB_CmsStatus] ([CmsUid], [StatusId]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-122aa0499c02', 2)
INSERT [dbo].[TB_CmsStatus] ([CmsUid], [StatusId]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-133aa0499c02', 2)
INSERT [dbo].[TB_CmsStatus] ([CmsUid], [StatusId]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-144aa0499c02', 2)
INSERT [dbo].[TB_CmsStatus] ([CmsUid], [StatusId]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-155aa0499c02', 2)
INSERT [dbo].[TB_CmsStatus] ([CmsUid], [StatusId]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-157aa0499c02', 2)
INSERT [dbo].[TB_CmsStatus] ([CmsUid], [StatusId]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-166aa0499c02', 2)
INSERT [dbo].[TB_CmsStatus] ([CmsUid], [StatusId]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-177aa0499c02', 2)
INSERT [dbo].[TB_CmsStatus] ([CmsUid], [StatusId]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-188aa0499c02', 2)
INSERT [dbo].[TB_CmsStatus] ([CmsUid], [StatusId]) VALUES (N'0959ea35-13a0-4728-90df-8e9ce0483ac8', 2)
/****** Object:  Table [dbo].[TB_Category]    Script Date: 04/22/2018 17:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](20) NULL,
	[PId] [int] NOT NULL,
	[Levels] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[LastChangeTime] [datetime] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[TB_Category_CategoryId] [int] NULL,
 CONSTRAINT [PK_dbo.TB_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TB_Category] ON
INSERT [dbo].[TB_Category] ([CategoryId], [CategoryName], [PId], [Levels], [CreateTime], [LastChangeTime], [IsDelete], [TB_Category_CategoryId]) VALUES (2, N'史部', 28, 0, CAST(0x0000A8AA00000000 AS DateTime), CAST(0x0000A8AA00000000 AS DateTime), 0, NULL)
INSERT [dbo].[TB_Category] ([CategoryId], [CategoryName], [PId], [Levels], [CreateTime], [LastChangeTime], [IsDelete], [TB_Category_CategoryId]) VALUES (4, N'经部', 28, 0, CAST(0x0000A8AA00000000 AS DateTime), CAST(0x0000A8AA00000000 AS DateTime), 0, NULL)
INSERT [dbo].[TB_Category] ([CategoryId], [CategoryName], [PId], [Levels], [CreateTime], [LastChangeTime], [IsDelete], [TB_Category_CategoryId]) VALUES (5, N'子部', 28, 0, CAST(0x0000A8AA00000000 AS DateTime), CAST(0x0000A8AA00000000 AS DateTime), 0, NULL)
INSERT [dbo].[TB_Category] ([CategoryId], [CategoryName], [PId], [Levels], [CreateTime], [LastChangeTime], [IsDelete], [TB_Category_CategoryId]) VALUES (6, N'集部', 28, 0, CAST(0x0000A8AA00000000 AS DateTime), CAST(0x0000A8AA00000000 AS DateTime), 0, NULL)
INSERT [dbo].[TB_Category] ([CategoryId], [CategoryName], [PId], [Levels], [CreateTime], [LastChangeTime], [IsDelete], [TB_Category_CategoryId]) VALUES (7, N'易经', 4, 1, CAST(0x0000A8AA00000000 AS DateTime), CAST(0x0000A8AA00000000 AS DateTime), 0, NULL)
INSERT [dbo].[TB_Category] ([CategoryId], [CategoryName], [PId], [Levels], [CreateTime], [LastChangeTime], [IsDelete], [TB_Category_CategoryId]) VALUES (8, N'三字经', 4, 1, CAST(0x0000A8AA00000000 AS DateTime), CAST(0x0000A8AA00000000 AS DateTime), 0, NULL)
INSERT [dbo].[TB_Category] ([CategoryId], [CategoryName], [PId], [Levels], [CreateTime], [LastChangeTime], [IsDelete], [TB_Category_CategoryId]) VALUES (9, N'四书类', 4, 1, CAST(0x0000A8AA00000000 AS DateTime), CAST(0x0000A8AA00000000 AS DateTime), 0, NULL)
INSERT [dbo].[TB_Category] ([CategoryId], [CategoryName], [PId], [Levels], [CreateTime], [LastChangeTime], [IsDelete], [TB_Category_CategoryId]) VALUES (10, N'大学之属', 9, 2, CAST(0x0000A8AA00000000 AS DateTime), CAST(0x0000A8AA00000000 AS DateTime), 0, NULL)
INSERT [dbo].[TB_Category] ([CategoryId], [CategoryName], [PId], [Levels], [CreateTime], [LastChangeTime], [IsDelete], [TB_Category_CategoryId]) VALUES (11, N'中庸之属', 9, 2, CAST(0x0000A8AA00000000 AS DateTime), CAST(0x0000A8AA00000000 AS DateTime), 0, NULL)
INSERT [dbo].[TB_Category] ([CategoryId], [CategoryName], [PId], [Levels], [CreateTime], [LastChangeTime], [IsDelete], [TB_Category_CategoryId]) VALUES (12, N'论语之属', 9, 2, CAST(0x0000A8AA00000000 AS DateTime), CAST(0x0000A8AA00000000 AS DateTime), 0, NULL)
INSERT [dbo].[TB_Category] ([CategoryId], [CategoryName], [PId], [Levels], [CreateTime], [LastChangeTime], [IsDelete], [TB_Category_CategoryId]) VALUES (23, N'大学下属', 11, 3, CAST(0x0000A8AE017E9675 AS DateTime), CAST(0x0000A8AE017E9675 AS DateTime), 0, NULL)
INSERT [dbo].[TB_Category] ([CategoryId], [CategoryName], [PId], [Levels], [CreateTime], [LastChangeTime], [IsDelete], [TB_Category_CategoryId]) VALUES (25, N'中庸下属2', 11, 3, CAST(0x0000A8AE0184176B AS DateTime), CAST(0x0000A8AE0184176B AS DateTime), 0, NULL)
INSERT [dbo].[TB_Category] ([CategoryId], [CategoryName], [PId], [Levels], [CreateTime], [LastChangeTime], [IsDelete], [TB_Category_CategoryId]) VALUES (26, N'AAA', 1, 0, CAST(0x0000A87B00000000 AS DateTime), CAST(0x0000A87A00000000 AS DateTime), 0, NULL)
INSERT [dbo].[TB_Category] ([CategoryId], [CategoryName], [PId], [Levels], [CreateTime], [LastChangeTime], [IsDelete], [TB_Category_CategoryId]) VALUES (27, N'AAA', 1, 0, CAST(0x0000A87B00000000 AS DateTime), CAST(0x0000A87A00000000 AS DateTime), 0, NULL)
INSERT [dbo].[TB_Category] ([CategoryId], [CategoryName], [PId], [Levels], [CreateTime], [LastChangeTime], [IsDelete], [TB_Category_CategoryId]) VALUES (29, N'测试一个分类吧', 8, 2, CAST(0x0000A8AF0177933A AS DateTime), CAST(0x0000A8AF0177933A AS DateTime), 0, NULL)
INSERT [dbo].[TB_Category] ([CategoryId], [CategoryName], [PId], [Levels], [CreateTime], [LastChangeTime], [IsDelete], [TB_Category_CategoryId]) VALUES (30, N'經部', 0, 0, CAST(0x0000A8C700E52815 AS DateTime), CAST(0x0000A8C700E52815 AS DateTime), 0, NULL)
INSERT [dbo].[TB_Category] ([CategoryId], [CategoryName], [PId], [Levels], [CreateTime], [LastChangeTime], [IsDelete], [TB_Category_CategoryId]) VALUES (31, N'史部', 0, 0, CAST(0x0000A8C700E5380B AS DateTime), CAST(0x0000A8C700E5380B AS DateTime), 0, NULL)
INSERT [dbo].[TB_Category] ([CategoryId], [CategoryName], [PId], [Levels], [CreateTime], [LastChangeTime], [IsDelete], [TB_Category_CategoryId]) VALUES (32, N'子部', 0, 0, CAST(0x0000A8C700E53F3A AS DateTime), CAST(0x0000A8C700E53F3A AS DateTime), 0, NULL)
INSERT [dbo].[TB_Category] ([CategoryId], [CategoryName], [PId], [Levels], [CreateTime], [LastChangeTime], [IsDelete], [TB_Category_CategoryId]) VALUES (33, N'集部', 0, 0, CAST(0x0000A8C700E54A16 AS DateTime), CAST(0x0000A8C700E54A16 AS DateTime), 0, NULL)
SET IDENTITY_INSERT [dbo].[TB_Category] OFF
/****** Object:  Table [dbo].[TB_Book]    Script Date: 04/22/2018 17:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Book](
	[BookUid] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Title2] [nvarchar](50) NULL,
	[Volume] [nvarchar](max) NULL,
	[Dynasty] [nvarchar](10) NULL,
	[CategoryId] [int] NOT NULL,
	[Functionary] [nvarchar](20) NULL,
	[Publisher] [nvarchar](20) NULL,
	[Version] [nvarchar](20) NULL,
	[FromBF49] [nvarchar](50) NULL,
	[FromAF49] [nvarchar](50) NULL,
	[ImageUris] [nvarchar](2000) NULL,
	[Notice] [nvarchar](200) NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_dbo.TB_Book] PRIMARY KEY CLUSTERED 
(
	[BookUid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CategoryId] ON [dbo].[TB_Book] 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[TB_Book] ([BookUid], [Title], [Title2], [Volume], [Dynasty], [CategoryId], [Functionary], [Publisher], [Version], [FromBF49], [FromAF49], [ImageUris], [Notice], [CreateTime]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-111aa0499c02', N'鐘情', N'测试2', N'2', N'2', 10, N'2', N'刘备', N'2', N'2', NULL, N'2', N'9', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[TB_Book] ([BookUid], [Title], [Title2], [Volume], [Dynasty], [CategoryId], [Functionary], [Publisher], [Version], [FromBF49], [FromAF49], [ImageUris], [Notice], [CreateTime]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-122aa0499c02', N'啦啦2', N'测试2', N'2', N'2', 11, N'2', N'孙孙', N'2', N'2', NULL, N'2', N'9', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[TB_Book] ([BookUid], [Title], [Title2], [Volume], [Dynasty], [CategoryId], [Functionary], [Publisher], [Version], [FromBF49], [FromAF49], [ImageUris], [Notice], [CreateTime]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-133aa0499c02', N'测试13', N'测试2', N'2', N'2', 12, N'2', N'六六', N'2', N'2', NULL, N'2', N'9', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[TB_Book] ([BookUid], [Title], [Title2], [Volume], [Dynasty], [CategoryId], [Functionary], [Publisher], [Version], [FromBF49], [FromAF49], [ImageUris], [Notice], [CreateTime]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-144aa0499c02', N'测试14', N'测试2', N'2', N'2', 12, N'2', N'2', N'2', N'2', NULL, N'2', N'9', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[TB_Book] ([BookUid], [Title], [Title2], [Volume], [Dynasty], [CategoryId], [Functionary], [Publisher], [Version], [FromBF49], [FromAF49], [ImageUris], [Notice], [CreateTime]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-155aa0499c02', N'测试15', N'頭發', N'2', N'2', 10, N'2', N'2', N'2', N'2', NULL, N'2', N'9', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[TB_Book] ([BookUid], [Title], [Title2], [Volume], [Dynasty], [CategoryId], [Functionary], [Publisher], [Version], [FromBF49], [FromAF49], [ImageUris], [Notice], [CreateTime]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-157aa0499c02', N'和嘿16', N'劉備', N'2', N'2', 11, N'2', N'2', N'2', N'2', NULL, N'2', N'9', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[TB_Book] ([BookUid], [Title], [Title2], [Volume], [Dynasty], [CategoryId], [Functionary], [Publisher], [Version], [FromBF49], [FromAF49], [ImageUris], [Notice], [CreateTime]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-166aa0499c02', N'测试17', N'测试2', N'2', N'2', 11, N'2', N'2', N'2', N'2', NULL, N'2', N'9', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[TB_Book] ([BookUid], [Title], [Title2], [Volume], [Dynasty], [CategoryId], [Functionary], [Publisher], [Version], [FromBF49], [FromAF49], [ImageUris], [Notice], [CreateTime]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-177aa0499c02', N'劉備鏡王之', N'测试2', N'2', N'2', 10, N'2', N'2', N'2', N'2', NULL, N'2', N'9', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[TB_Book] ([BookUid], [Title], [Title2], [Volume], [Dynasty], [CategoryId], [Functionary], [Publisher], [Version], [FromBF49], [FromAF49], [ImageUris], [Notice], [CreateTime]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-188aa0499c02', N'测试19頭發', N'测试2', N'2', N'2', 10, N'2', N'2', N'2', N'2', NULL, N'2', N'9', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[TB_Book] ([BookUid], [Title], [Title2], [Volume], [Dynasty], [CategoryId], [Functionary], [Publisher], [Version], [FromBF49], [FromAF49], [ImageUris], [Notice], [CreateTime]) VALUES (N'0959ea35-13a0-4728-90df-8e9ce0483ac8', N'新添加古籍测试', N'123', N'33', N'33', 2, N'3', N'44', N'44', N'3', N'3', N'/Uploads/0959ea35-13a0-4728-90df-8e9ce0483ac8', N'3', CAST(0x0000A8AD0175DFC6 AS DateTime))
/****** Object:  ForeignKey [FK_dbo.TB_Book_dbo.TB_Category_CategoryId]    Script Date: 04/22/2018 17:55:20 ******/
ALTER TABLE [dbo].[TB_Book]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TB_Book_dbo.TB_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[TB_Category] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TB_Book] CHECK CONSTRAINT [FK_dbo.TB_Book_dbo.TB_Category_CategoryId]
GO
