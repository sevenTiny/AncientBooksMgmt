USE [master]
GO
/****** Object:  Database [DB_QX_Frame_MS_User]    Script Date: 04/22/2018 17:55:55 ******/
CREATE DATABASE [DB_QX_Frame_MS_User] ON  PRIMARY 
( NAME = N'DB_QX_Frame_MS_User', FILENAME = N'D:\guji_mgmt\database\DB_QX_Frame_MS_User.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_QX_Frame_MS_User_log', FILENAME = N'D:\guji_mgmt\database\DB_QX_Frame_MS_User_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_QX_Frame_MS_User].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET ANSI_NULLS OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET ANSI_PADDING OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET ARITHABORT OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET  DISABLE_BROKER
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET  READ_WRITE
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET RECOVERY FULL
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET  MULTI_USER
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [DB_QX_Frame_MS_User] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_QX_Frame_MS_User', N'ON'
GO
USE [DB_QX_Frame_MS_User]
GO
/****** Object:  Table [dbo].[TB_FriendGroupName]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_FriendGroupName](
	[FriendGroupUid] [uniqueidentifier] NOT NULL,
	[SelfUserUid] [uniqueidentifier] NOT NULL,
	[FriendGroupName] [nvarchar](20) NOT NULL,
	[FriendGroupIndex] [int] NOT NULL,
 CONSTRAINT [PK_TB_FriendGroupName] PRIMARY KEY CLUSTERED 
(
	[FriendGroupUid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'好友分组Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_FriendGroupName', @level2type=N'COLUMN',@level2name=N'FriendGroupUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自己Uid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_FriendGroupName', @level2type=N'COLUMN',@level2name=N'SelfUserUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'好友分组名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_FriendGroupName', @level2type=N'COLUMN',@level2name=N'FriendGroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'好友分组序号(显示顺序)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_FriendGroupName', @level2type=N'COLUMN',@level2name=N'FriendGroupIndex'
GO
INSERT [dbo].[TB_FriendGroupName] ([FriendGroupUid], [SelfUserUid], [FriendGroupName], [FriendGroupIndex]) VALUES (N'4364d8e8-cbca-4535-9bc7-e8c41f2d2491', N'7b508e8f-29c5-42dd-bd64-08cba6124d47', N'My Friend', 0)
/****** Object:  Table [dbo].[TB_DisplayCode]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_DisplayCode](
	[DisplayCode] [int] IDENTITY(1001,1) NOT NULL,
	[DisplayDescription] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TB_DisplayCode] PRIMARY KEY CLUSTERED 
(
	[DisplayCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'界面显示Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DisplayCode', @level2type=N'COLUMN',@level2name=N'DisplayCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'界面显示描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DisplayCode', @level2type=N'COLUMN',@level2name=N'DisplayDescription'
GO
SET IDENTITY_INSERT [dbo].[TB_DisplayCode] ON
INSERT [dbo].[TB_DisplayCode] ([DisplayCode], [DisplayDescription]) VALUES (1001, N'古籍添加界面')
INSERT [dbo].[TB_DisplayCode] ([DisplayCode], [DisplayDescription]) VALUES (1002, N'用户添加界面')
SET IDENTITY_INSERT [dbo].[TB_DisplayCode] OFF
/****** Object:  Table [dbo].[TB_ConstellationName]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ConstellationName](
	[ConstellationId] [int] NOT NULL,
	[ConstellationName] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_TB_ConstellationName] PRIMARY KEY CLUSTERED 
(
	[ConstellationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'星座Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ConstellationName', @level2type=N'COLUMN',@level2name=N'ConstellationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'星座名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ConstellationName', @level2type=N'COLUMN',@level2name=N'ConstellationName'
GO
INSERT [dbo].[TB_ConstellationName] ([ConstellationId], [ConstellationName]) VALUES (-1, N'-')
INSERT [dbo].[TB_ConstellationName] ([ConstellationId], [ConstellationName]) VALUES (0, N'白羊座')
INSERT [dbo].[TB_ConstellationName] ([ConstellationId], [ConstellationName]) VALUES (1, N'金牛座')
INSERT [dbo].[TB_ConstellationName] ([ConstellationId], [ConstellationName]) VALUES (2, N'双子座')
INSERT [dbo].[TB_ConstellationName] ([ConstellationId], [ConstellationName]) VALUES (3, N'巨蟹座')
INSERT [dbo].[TB_ConstellationName] ([ConstellationId], [ConstellationName]) VALUES (4, N'狮子座')
INSERT [dbo].[TB_ConstellationName] ([ConstellationId], [ConstellationName]) VALUES (5, N'处女座')
INSERT [dbo].[TB_ConstellationName] ([ConstellationId], [ConstellationName]) VALUES (6, N'天秤座')
INSERT [dbo].[TB_ConstellationName] ([ConstellationId], [ConstellationName]) VALUES (7, N'天蝎座')
INSERT [dbo].[TB_ConstellationName] ([ConstellationId], [ConstellationName]) VALUES (8, N'射手座')
INSERT [dbo].[TB_ConstellationName] ([ConstellationId], [ConstellationName]) VALUES (9, N'摩羯座')
INSERT [dbo].[TB_ConstellationName] ([ConstellationId], [ConstellationName]) VALUES (10, N'水瓶座')
INSERT [dbo].[TB_ConstellationName] ([ConstellationId], [ConstellationName]) VALUES (11, N'双鱼座')
/****** Object:  Table [dbo].[TB_CommentReply]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CommentReply](
	[CommentUid] [uniqueidentifier] NOT NULL,
	[TopicUidOrCommentUid] [uniqueidentifier] NOT NULL,
	[PublisherUid] [uniqueidentifier] NOT NULL,
	[PublishContent] [nvarchar](500) NOT NULL,
	[PublishTime] [datetime] NOT NULL,
 CONSTRAINT [PK_TB_CommentReply] PRIMARY KEY CLUSTERED 
(
	[CommentUid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评论Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CommentReply', @level2type=N'COLUMN',@level2name=N'CommentUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主题Uid 或 评论Uid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CommentReply', @level2type=N'COLUMN',@level2name=N'TopicUidOrCommentUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布者Uid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CommentReply', @level2type=N'COLUMN',@level2name=N'PublisherUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CommentReply', @level2type=N'COLUMN',@level2name=N'PublishContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CommentReply', @level2type=N'COLUMN',@level2name=N'PublishTime'
GO
/****** Object:  Table [dbo].[TB_ChineseZodiacName]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ChineseZodiacName](
	[ChineseZodiacId] [int] NOT NULL,
	[ChineseZodiacName] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_TB_ChineseZodiacName] PRIMARY KEY CLUSTERED 
(
	[ChineseZodiacId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生肖Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ChineseZodiacName', @level2type=N'COLUMN',@level2name=N'ChineseZodiacId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生肖名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ChineseZodiacName', @level2type=N'COLUMN',@level2name=N'ChineseZodiacName'
GO
INSERT [dbo].[TB_ChineseZodiacName] ([ChineseZodiacId], [ChineseZodiacName]) VALUES (-1, N'-')
INSERT [dbo].[TB_ChineseZodiacName] ([ChineseZodiacId], [ChineseZodiacName]) VALUES (0, N'鼠')
INSERT [dbo].[TB_ChineseZodiacName] ([ChineseZodiacId], [ChineseZodiacName]) VALUES (1, N'牛')
INSERT [dbo].[TB_ChineseZodiacName] ([ChineseZodiacId], [ChineseZodiacName]) VALUES (2, N'虎')
INSERT [dbo].[TB_ChineseZodiacName] ([ChineseZodiacId], [ChineseZodiacName]) VALUES (3, N'兔')
INSERT [dbo].[TB_ChineseZodiacName] ([ChineseZodiacId], [ChineseZodiacName]) VALUES (4, N'龙')
INSERT [dbo].[TB_ChineseZodiacName] ([ChineseZodiacId], [ChineseZodiacName]) VALUES (5, N'蛇')
INSERT [dbo].[TB_ChineseZodiacName] ([ChineseZodiacId], [ChineseZodiacName]) VALUES (6, N'马')
INSERT [dbo].[TB_ChineseZodiacName] ([ChineseZodiacId], [ChineseZodiacName]) VALUES (7, N'羊')
INSERT [dbo].[TB_ChineseZodiacName] ([ChineseZodiacId], [ChineseZodiacName]) VALUES (8, N'猴')
INSERT [dbo].[TB_ChineseZodiacName] ([ChineseZodiacId], [ChineseZodiacName]) VALUES (9, N'鸡')
INSERT [dbo].[TB_ChineseZodiacName] ([ChineseZodiacId], [ChineseZodiacName]) VALUES (10, N'狗')
INSERT [dbo].[TB_ChineseZodiacName] ([ChineseZodiacId], [ChineseZodiacName]) VALUES (11, N'猪')
/****** Object:  Table [dbo].[TB_BloodTypeName]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_BloodTypeName](
	[BloodTypeId] [int] NOT NULL,
	[BloodTypeName] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_TB_BloodTypeName] PRIMARY KEY CLUSTERED 
(
	[BloodTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'血型Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_BloodTypeName', @level2type=N'COLUMN',@level2name=N'BloodTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'血型名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_BloodTypeName', @level2type=N'COLUMN',@level2name=N'BloodTypeName'
GO
INSERT [dbo].[TB_BloodTypeName] ([BloodTypeId], [BloodTypeName]) VALUES (-1, N'-')
INSERT [dbo].[TB_BloodTypeName] ([BloodTypeId], [BloodTypeName]) VALUES (0, N'0')
INSERT [dbo].[TB_BloodTypeName] ([BloodTypeId], [BloodTypeName]) VALUES (1, N'A')
INSERT [dbo].[TB_BloodTypeName] ([BloodTypeId], [BloodTypeName]) VALUES (2, N'B')
INSERT [dbo].[TB_BloodTypeName] ([BloodTypeId], [BloodTypeName]) VALUES (3, N'AB')
/****** Object:  Table [dbo].[TB_Authentication]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Authentication](
	[AuthenticationUid] [uniqueidentifier] NOT NULL,
	[TokenSign] [nvarchar](32) NOT NULL,
	[RSA_PublicKey] [nvarchar](3000) NOT NULL,
	[RSA_PrivateKey] [nvarchar](3000) NOT NULL,
 CONSTRAINT [PK_TB_Authentication] PRIMARY KEY CLUSTERED 
(
	[AuthenticationUid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限验证Uid 可以和UserUid相等' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_Authentication', @level2type=N'COLUMN',@level2name=N'AuthenticationUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Token认证签名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_Authentication', @level2type=N'COLUMN',@level2name=N'TokenSign'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RSA加密公钥' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_Authentication', @level2type=N'COLUMN',@level2name=N'RSA_PublicKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RSA加密私钥' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_Authentication', @level2type=N'COLUMN',@level2name=N'RSA_PrivateKey'
GO
/****** Object:  Table [dbo].[TB_UserFunctionLimit]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_UserFunctionLimit](
	[UserUid] [uniqueidentifier] NOT NULL,
	[FunctionAttribute] [nvarchar](500) NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_TB_UserFunctionLimit] PRIMARY KEY CLUSTERED 
(
	[UserUid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User Uid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserFunctionLimit', @level2type=N'COLUMN',@level2name=N'UserUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户功能权限数组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserFunctionLimit', @level2type=N'COLUMN',@level2name=N'FunctionAttribute'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserFunctionLimit', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
/****** Object:  Table [dbo].[TB_UserAuthenCodes]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_UserAuthenCodes](
	[UserUid] [uniqueidentifier] NOT NULL,
	[UserDisplayCodes] [nvarchar](1000) NULL,
	[UserLimitCodes] [nvarchar](1000) NULL,
 CONSTRAINT [PK_TB_UserAuthenCodes] PRIMARY KEY CLUSTERED 
(
	[UserUid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Uid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserAuthenCodes', @level2type=N'COLUMN',@level2name=N'UserUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户显示代码数组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserAuthenCodes', @level2type=N'COLUMN',@level2name=N'UserDisplayCodes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户权限代码组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserAuthenCodes', @level2type=N'COLUMN',@level2name=N'UserLimitCodes'
GO
INSERT [dbo].[TB_UserAuthenCodes] ([UserUid], [UserDisplayCodes], [UserLimitCodes]) VALUES (N'2c1f4eaa-a529-406a-a2e0-072212106945', N'', N'')
INSERT [dbo].[TB_UserAuthenCodes] ([UserUid], [UserDisplayCodes], [UserLimitCodes]) VALUES (N'7b508e8f-29c5-42dd-bd64-08cba6124d47', N'1001,1002,1016', N'1003,1001,1002,1004,1016,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020')
INSERT [dbo].[TB_UserAuthenCodes] ([UserUid], [UserDisplayCodes], [UserLimitCodes]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-157aa0472c02', N'1001,1002', N'1001')
INSERT [dbo].[TB_UserAuthenCodes] ([UserUid], [UserDisplayCodes], [UserLimitCodes]) VALUES (N'926801fe-c5c3-48ec-b493-2090feebfb4e', N'', N'1001,1004')
INSERT [dbo].[TB_UserAuthenCodes] ([UserUid], [UserDisplayCodes], [UserLimitCodes]) VALUES (N'0d5a4861-efe9-4460-850e-22b919637c33', N'', N'')
INSERT [dbo].[TB_UserAuthenCodes] ([UserUid], [UserDisplayCodes], [UserLimitCodes]) VALUES (N'66c774ec-b411-4c64-a34e-2554c6396904', N'1001,1002', N'1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020')
INSERT [dbo].[TB_UserAuthenCodes] ([UserUid], [UserDisplayCodes], [UserLimitCodes]) VALUES (N'54a9527c-a3b1-4cf3-a8e0-264e9256f262', N'1001,1002', N'1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020')
INSERT [dbo].[TB_UserAuthenCodes] ([UserUid], [UserDisplayCodes], [UserLimitCodes]) VALUES (N'4dc2940a-d069-45ae-bd1a-311ec938451a', N'', N'')
INSERT [dbo].[TB_UserAuthenCodes] ([UserUid], [UserDisplayCodes], [UserLimitCodes]) VALUES (N'fad417b2-6d08-4a60-b8e5-586055ca4d4a', N'1001', N'1001,1002,1004')
INSERT [dbo].[TB_UserAuthenCodes] ([UserUid], [UserDisplayCodes], [UserLimitCodes]) VALUES (N'9ada28ce-d2f6-4df2-97b9-b33e9787f750', N'', N'')
INSERT [dbo].[TB_UserAuthenCodes] ([UserUid], [UserDisplayCodes], [UserLimitCodes]) VALUES (N'ec068252-3ca1-4092-86de-ef6e046b582a', N'', N'')
/****** Object:  Table [dbo].[TB_UserAccount]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_UserAccount](
	[UserUid] [uniqueidentifier] NOT NULL,
	[LoginId] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Tel] [nvarchar](50) NULL,
 CONSTRAINT [PK_TB_UserAccount] PRIMARY KEY CLUSTERED 
(
	[UserUid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserAccount', @level2type=N'COLUMN',@level2name=N'UserUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserAccount', @level2type=N'COLUMN',@level2name=N'LoginId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户密码 MD5方式加密' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserAccount', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserAccount', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserAccount', @level2type=N'COLUMN',@level2name=N'Tel'
GO
INSERT [dbo].[TB_UserAccount] ([UserUid], [LoginId], [Password], [Email], [Tel]) VALUES (N'2c1f4eaa-a529-406a-a2e0-072212106945', N'aaaa', N'0b4e7a0e5fe84ad35fb5f95b9ceeac79', N'', N'')
INSERT [dbo].[TB_UserAccount] ([UserUid], [LoginId], [Password], [Email], [Tel]) VALUES (N'7b508e8f-29c5-42dd-bd64-08cba6124d47', N'xuhongchao', N'e10adc3949ba59abbe56e057f20f883e', N'wd8622088@foxmail.com', N' ')
INSERT [dbo].[TB_UserAccount] ([UserUid], [LoginId], [Password], [Email], [Tel]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-157aa0472c02', N'1111', N'e10adc3949ba59abbe56e057f20f883e', N' ', N' ')
INSERT [dbo].[TB_UserAccount] ([UserUid], [LoginId], [Password], [Email], [Tel]) VALUES (N'926801fe-c5c3-48ec-b493-2090feebfb4e', N'2222', N'e3ceb5881a0a1fdaad01296d7554868d', N' ', N' ')
INSERT [dbo].[TB_UserAccount] ([UserUid], [LoginId], [Password], [Email], [Tel]) VALUES (N'0d5a4861-efe9-4460-850e-22b919637c33', N'333333', N'1a100d2c0dab19c4430e7d73762b3423', N'', N'')
INSERT [dbo].[TB_UserAccount] ([UserUid], [LoginId], [Password], [Email], [Tel]) VALUES (N'66c774ec-b411-4c64-a34e-2554c6396904', N'windows', N'0f4137ed1502b5045d6083aa258b5c42', N'', N'')
INSERT [dbo].[TB_UserAccount] ([UserUid], [LoginId], [Password], [Email], [Tel]) VALUES (N'54a9527c-a3b1-4cf3-a8e0-264e9256f262', N'qqq', N'b2ca678b4c936f905fb82f2733f5297f', N'', N'')
INSERT [dbo].[TB_UserAccount] ([UserUid], [LoginId], [Password], [Email], [Tel]) VALUES (N'4dc2940a-d069-45ae-bd1a-311ec938451a', N'111', N'698d51a19d8a121ce581499d7b701668', N'', N'')
INSERT [dbo].[TB_UserAccount] ([UserUid], [LoginId], [Password], [Email], [Tel]) VALUES (N'fad417b2-6d08-4a60-b8e5-586055ca4d4a', N'mmmm', N'96e79218965eb72c92a549dd5a330112', N'', N'')
INSERT [dbo].[TB_UserAccount] ([UserUid], [LoginId], [Password], [Email], [Tel]) VALUES (N'9ada28ce-d2f6-4df2-97b9-b33e9787f750', N'666666', N'f379eaf3c831b04de153469d1bec345e', N'', N'')
INSERT [dbo].[TB_UserAccount] ([UserUid], [LoginId], [Password], [Email], [Tel]) VALUES (N'ec068252-3ca1-4092-86de-ef6e046b582a', N'ssss', N'af15d5fdacd5fdfea300e88a8e253e82', N'', N'')
/****** Object:  Table [dbo].[TB_SexName]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_SexName](
	[SexId] [int] NOT NULL,
	[SexName] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_TB_SexName] PRIMARY KEY CLUSTERED 
(
	[SexId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SexName', @level2type=N'COLUMN',@level2name=N'SexId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SexName', @level2type=N'COLUMN',@level2name=N'SexName'
GO
INSERT [dbo].[TB_SexName] ([SexId], [SexName]) VALUES (-1, N'-')
INSERT [dbo].[TB_SexName] ([SexId], [SexName]) VALUES (0, N'Man')
INSERT [dbo].[TB_SexName] ([SexId], [SexName]) VALUES (1, N'Woman')
/****** Object:  Table [dbo].[TB_Message]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Message](
	[MessageUid] [uniqueidentifier] NOT NULL,
	[MessageContent] [nvarchar](500) NOT NULL,
	[PublisherUid] [uniqueidentifier] NOT NULL,
	[ReceiverUid] [uniqueidentifier] NOT NULL,
	[SendTime] [datetime] NOT NULL,
	[MessageStatus] [int] NOT NULL,
 CONSTRAINT [PK_TB_Message] PRIMARY KEY CLUSTERED 
(
	[MessageUid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息Uid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_Message', @level2type=N'COLUMN',@level2name=N'MessageUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_Message', @level2type=N'COLUMN',@level2name=N'MessageContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送者Uid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_Message', @level2type=N'COLUMN',@level2name=N'PublisherUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接受者Uid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_Message', @level2type=N'COLUMN',@level2name=N'ReceiverUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_Message', @level2type=N'COLUMN',@level2name=N'SendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'相对于接受者的消息状态 已读未读' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_Message', @level2type=N'COLUMN',@level2name=N'MessageStatus'
GO
/****** Object:  Table [dbo].[TB_LoginHistory]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_LoginHistory](
	[LoginHistoryUid] [uniqueidentifier] NOT NULL,
	[UserUid] [uniqueidentifier] NOT NULL,
	[LoginIp] [nvarchar](50) NOT NULL,
	[LoginTime] [datetime] NOT NULL,
 CONSTRAINT [PK_TB_LoginHistory] PRIMARY KEY CLUSTERED 
(
	[LoginHistoryUid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录历史记录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LoginHistory', @level2type=N'COLUMN',@level2name=N'LoginHistoryUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Uid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LoginHistory', @level2type=N'COLUMN',@level2name=N'UserUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录Ip地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LoginHistory', @level2type=N'COLUMN',@level2name=N'LoginIp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LoginHistory', @level2type=N'COLUMN',@level2name=N'LoginTime'
GO
/****** Object:  Table [dbo].[TB_LimitCode]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_LimitCode](
	[LimitCodeId] [int] IDENTITY(1001,1) NOT NULL,
	[LimitDescription] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TB_LimitCode] PRIMARY KEY CLUSTERED 
(
	[LimitCodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LimitCode', @level2type=N'COLUMN',@level2name=N'LimitCodeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LimitCode', @level2type=N'COLUMN',@level2name=N'LimitDescription'
GO
SET IDENTITY_INSERT [dbo].[TB_LimitCode] ON
INSERT [dbo].[TB_LimitCode] ([LimitCodeId], [LimitDescription]) VALUES (1001, N'用户信息查看')
INSERT [dbo].[TB_LimitCode] ([LimitCodeId], [LimitDescription]) VALUES (1002, N'用户信息修改')
INSERT [dbo].[TB_LimitCode] ([LimitCodeId], [LimitDescription]) VALUES (1003, N'用户删除')
INSERT [dbo].[TB_LimitCode] ([LimitCodeId], [LimitDescription]) VALUES (1004, N'古籍列表查看')
INSERT [dbo].[TB_LimitCode] ([LimitCodeId], [LimitDescription]) VALUES (1005, N'古籍添加')
INSERT [dbo].[TB_LimitCode] ([LimitCodeId], [LimitDescription]) VALUES (1006, N'古籍导入')
INSERT [dbo].[TB_LimitCode] ([LimitCodeId], [LimitDescription]) VALUES (1007, N'古籍导出')
INSERT [dbo].[TB_LimitCode] ([LimitCodeId], [LimitDescription]) VALUES (1008, N'古籍修改')
INSERT [dbo].[TB_LimitCode] ([LimitCodeId], [LimitDescription]) VALUES (1009, N'图片上传')
INSERT [dbo].[TB_LimitCode] ([LimitCodeId], [LimitDescription]) VALUES (1010, N'图片管理')
INSERT [dbo].[TB_LimitCode] ([LimitCodeId], [LimitDescription]) VALUES (1011, N'古籍下载')
INSERT [dbo].[TB_LimitCode] ([LimitCodeId], [LimitDescription]) VALUES (1012, N'古籍删除')
INSERT [dbo].[TB_LimitCode] ([LimitCodeId], [LimitDescription]) VALUES (1013, N'古籍恢复')
INSERT [dbo].[TB_LimitCode] ([LimitCodeId], [LimitDescription]) VALUES (1014, N'用户添加')
INSERT [dbo].[TB_LimitCode] ([LimitCodeId], [LimitDescription]) VALUES (1015, N'用户恢复')
INSERT [dbo].[TB_LimitCode] ([LimitCodeId], [LimitDescription]) VALUES (1016, N'用户权限管理')
INSERT [dbo].[TB_LimitCode] ([LimitCodeId], [LimitDescription]) VALUES (1017, N'古籍分类管理')
INSERT [dbo].[TB_LimitCode] ([LimitCodeId], [LimitDescription]) VALUES (1018, N'古籍分类添加')
INSERT [dbo].[TB_LimitCode] ([LimitCodeId], [LimitDescription]) VALUES (1019, N'古籍分类修改')
INSERT [dbo].[TB_LimitCode] ([LimitCodeId], [LimitDescription]) VALUES (1020, N'古籍分类删除')
SET IDENTITY_INSERT [dbo].[TB_LimitCode] OFF
/****** Object:  Table [dbo].[TB_FriendStatusName]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_FriendStatusName](
	[FriendStatusId] [int] NOT NULL,
	[FriendStatusName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_TB_FriendStatusName_1] PRIMARY KEY CLUSTERED 
(
	[FriendStatusId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'好友状态Uid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_FriendStatusName', @level2type=N'COLUMN',@level2name=N'FriendStatusId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'好友状态（添加中，正常，已删除）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_FriendStatusName', @level2type=N'COLUMN',@level2name=N'FriendStatusName'
GO
INSERT [dbo].[TB_FriendStatusName] ([FriendStatusId], [FriendStatusName]) VALUES (0, N'Sending')
INSERT [dbo].[TB_FriendStatusName] ([FriendStatusId], [FriendStatusName]) VALUES (1, N'Normal')
INSERT [dbo].[TB_FriendStatusName] ([FriendStatusId], [FriendStatusName]) VALUES (2, N'Deleted')
/****** Object:  Table [dbo].[TB_UserRoleName]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_UserRoleName](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_TB_UserRoleName] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserRoleName', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserRoleName', @level2type=N'COLUMN',@level2name=N'RoleName'
GO
INSERT [dbo].[TB_UserRoleName] ([RoleId], [RoleName]) VALUES (0, N'USER')
INSERT [dbo].[TB_UserRoleName] ([RoleId], [RoleName]) VALUES (5, N'ADMINISTRATOR')
INSERT [dbo].[TB_UserRoleName] ([RoleId], [RoleName]) VALUES (6, N'ROOT')
/****** Object:  Table [dbo].[TB_UserPointsHistory]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_UserPointsHistory](
	[UserPointsHistoryUid] [uniqueidentifier] NOT NULL,
	[UserUid] [uniqueidentifier] NOT NULL,
	[PointsChange] [int] NOT NULL,
	[ChangeTime] [datetime] NOT NULL,
	[Platform] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_TB_UserPointsHistory_1] PRIMARY KEY CLUSTERED 
(
	[UserPointsHistoryUid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户积分历史Uid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserPointsHistory', @level2type=N'COLUMN',@level2name=N'UserPointsHistoryUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User Uid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserPointsHistory', @level2type=N'COLUMN',@level2name=N'UserUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户积分变化值 减少为负' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserPointsHistory', @level2type=N'COLUMN',@level2name=N'PointsChange'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分消费时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserPointsHistory', @level2type=N'COLUMN',@level2name=N'ChangeTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分消费平台' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserPointsHistory', @level2type=N'COLUMN',@level2name=N'Platform'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分消费描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserPointsHistory', @level2type=N'COLUMN',@level2name=N'Description'
GO
/****** Object:  Table [dbo].[TB_UserPoints]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_UserPoints](
	[UserUid] [uniqueidentifier] NOT NULL,
	[UserPoints] [bigint] NOT NULL,
 CONSTRAINT [PK_TB_UserPoints] PRIMARY KEY CLUSTERED 
(
	[UserUid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User Uid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserPoints', @level2type=N'COLUMN',@level2name=N'UserUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户积分总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserPoints', @level2type=N'COLUMN',@level2name=N'UserPoints'
GO
INSERT [dbo].[TB_UserPoints] ([UserUid], [UserPoints]) VALUES (N'7b508e8f-29c5-42dd-bd64-08cba6124d47', 0)
/****** Object:  Table [dbo].[TB_UserStatusName]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_UserStatusName](
	[StatusId] [int] NOT NULL,
	[StatusName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_TB_UserStatusName] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserStatusName', @level2type=N'COLUMN',@level2name=N'StatusId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户状态名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserStatusName', @level2type=N'COLUMN',@level2name=N'StatusName'
GO
INSERT [dbo].[TB_UserStatusName] ([StatusId], [StatusName]) VALUES (0, N'NORMAL')
INSERT [dbo].[TB_UserStatusName] ([StatusId], [StatusName]) VALUES (1, N'STOP')
INSERT [dbo].[TB_UserStatusName] ([StatusId], [StatusName]) VALUES (2, N'FREEZE')
INSERT [dbo].[TB_UserStatusName] ([StatusId], [StatusName]) VALUES (3, N'ABANDON')
/****** Object:  Table [dbo].[TB_UserRoleStatus]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_UserRoleStatus](
	[UserUid] [uniqueidentifier] NOT NULL,
	[RoleId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_TB_UserRoleStatus] PRIMARY KEY CLUSTERED 
(
	[UserUid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Uid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserRoleStatus', @level2type=N'COLUMN',@level2name=N'UserUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户角色id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserRoleStatus', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户状态id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserRoleStatus', @level2type=N'COLUMN',@level2name=N'StatusId'
GO
INSERT [dbo].[TB_UserRoleStatus] ([UserUid], [RoleId], [StatusId]) VALUES (N'2c1f4eaa-a529-406a-a2e0-072212106945', 0, 1)
INSERT [dbo].[TB_UserRoleStatus] ([UserUid], [RoleId], [StatusId]) VALUES (N'7b508e8f-29c5-42dd-bd64-08cba6124d47', 0, 0)
INSERT [dbo].[TB_UserRoleStatus] ([UserUid], [RoleId], [StatusId]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-157aa0472c02', 0, 1)
INSERT [dbo].[TB_UserRoleStatus] ([UserUid], [RoleId], [StatusId]) VALUES (N'926801fe-c5c3-48ec-b493-2090feebfb4e', 0, 1)
INSERT [dbo].[TB_UserRoleStatus] ([UserUid], [RoleId], [StatusId]) VALUES (N'0d5a4861-efe9-4460-850e-22b919637c33', 0, 1)
INSERT [dbo].[TB_UserRoleStatus] ([UserUid], [RoleId], [StatusId]) VALUES (N'66c774ec-b411-4c64-a34e-2554c6396904', 0, 0)
INSERT [dbo].[TB_UserRoleStatus] ([UserUid], [RoleId], [StatusId]) VALUES (N'54a9527c-a3b1-4cf3-a8e0-264e9256f262', 0, 0)
INSERT [dbo].[TB_UserRoleStatus] ([UserUid], [RoleId], [StatusId]) VALUES (N'4dc2940a-d069-45ae-bd1a-311ec938451a', 0, 1)
INSERT [dbo].[TB_UserRoleStatus] ([UserUid], [RoleId], [StatusId]) VALUES (N'fad417b2-6d08-4a60-b8e5-586055ca4d4a', 0, 0)
INSERT [dbo].[TB_UserRoleStatus] ([UserUid], [RoleId], [StatusId]) VALUES (N'9ada28ce-d2f6-4df2-97b9-b33e9787f750', 0, 1)
INSERT [dbo].[TB_UserRoleStatus] ([UserUid], [RoleId], [StatusId]) VALUES (N'ec068252-3ca1-4092-86de-ef6e046b582a', 0, 1)
/****** Object:  Table [dbo].[TB_UserInfo]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_UserInfo](
	[UserUid] [uniqueidentifier] NOT NULL,
	[LoginId] [nvarchar](20) NOT NULL,
	[NickName] [nvarchar](20) NULL,
	[HeadImageUrl] [nvarchar](200) NULL,
	[Age] [int] NOT NULL,
	[SexId] [int] NOT NULL,
	[Birthday] [datetime] NULL,
	[BloodTypeId] [int] NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Position] [nvarchar](50) NULL,
	[School] [nvarchar](50) NULL,
	[Company] [nvarchar](50) NULL,
	[ConstellationId] [int] NOT NULL,
	[ChineseZodiacId] [int] NOT NULL,
	[PersonalizedSignature] [nvarchar](50) NULL,
	[PersonalizedDescription] [nvarchar](200) NULL,
	[RegisterTime] [datetime] NOT NULL,
 CONSTRAINT [PK_TB_UserInfo] PRIMARY KEY CLUSTERED 
(
	[UserUid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Uid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserInfo', @level2type=N'COLUMN',@level2name=N'UserUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserInfo', @level2type=N'COLUMN',@level2name=N'LoginId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserInfo', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserInfo', @level2type=N'COLUMN',@level2name=N'HeadImageUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年龄' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserInfo', @level2type=N'COLUMN',@level2name=N'Age'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserInfo', @level2type=N'COLUMN',@level2name=N'SexId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出生日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserInfo', @level2type=N'COLUMN',@level2name=N'Birthday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'血型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserInfo', @level2type=N'COLUMN',@level2name=N'BloodTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserInfo', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserInfo', @level2type=N'COLUMN',@level2name=N'Position'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学校' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserInfo', @level2type=N'COLUMN',@level2name=N'School'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserInfo', @level2type=N'COLUMN',@level2name=N'Company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'星座' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserInfo', @level2type=N'COLUMN',@level2name=N'ConstellationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生肖' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserInfo', @level2type=N'COLUMN',@level2name=N'ChineseZodiacId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个性签名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserInfo', @level2type=N'COLUMN',@level2name=N'PersonalizedSignature'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserInfo', @level2type=N'COLUMN',@level2name=N'PersonalizedDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_UserInfo', @level2type=N'COLUMN',@level2name=N'RegisterTime'
GO
INSERT [dbo].[TB_UserInfo] ([UserUid], [LoginId], [NickName], [HeadImageUrl], [Age], [SexId], [Birthday], [BloodTypeId], [Address], [Position], [School], [Company], [ConstellationId], [ChineseZodiacId], [PersonalizedSignature], [PersonalizedDescription], [RegisterTime]) VALUES (N'2c1f4eaa-a529-406a-a2e0-072212106945', N'aaaa', N'aaaa', N'', 0, 0, CAST(0x0000A80F00DC20D9 AS DateTime), 0, N'', N'', N'', N'', 0, 0, N'', N'', CAST(0x0000A80F00DC20D9 AS DateTime))
INSERT [dbo].[TB_UserInfo] ([UserUid], [LoginId], [NickName], [HeadImageUrl], [Age], [SexId], [Birthday], [BloodTypeId], [Address], [Position], [School], [Company], [ConstellationId], [ChineseZodiacId], [PersonalizedSignature], [PersonalizedDescription], [RegisterTime]) VALUES (N'7b508e8f-29c5-42dd-bd64-08cba6124d47', N'xuhongchao', N'xuhongchao超吵吵人2w2', N' ', 0, -1, CAST(0x0000A7C9011CBACF AS DateTime), -1, N' ', N' ', N' ', N' ', -1, -1, N' ', N' ', CAST(0x0000A7AF00FC37F4 AS DateTime))
INSERT [dbo].[TB_UserInfo] ([UserUid], [LoginId], [NickName], [HeadImageUrl], [Age], [SexId], [Birthday], [BloodTypeId], [Address], [Position], [School], [Company], [ConstellationId], [ChineseZodiacId], [PersonalizedSignature], [PersonalizedDescription], [RegisterTime]) VALUES (N'7a3ad0d9-a8c7-4058-80c8-157aa0472c02', N'1111', N'11', N' ', 0, 0, CAST(0x0000A7C9011CBACF AS DateTime), 0, N' ', N' ', N' ', N' ', 0, 0, N' ', N' ', CAST(0x0000A7C9011CBACF AS DateTime))
INSERT [dbo].[TB_UserInfo] ([UserUid], [LoginId], [NickName], [HeadImageUrl], [Age], [SexId], [Birthday], [BloodTypeId], [Address], [Position], [School], [Company], [ConstellationId], [ChineseZodiacId], [PersonalizedSignature], [PersonalizedDescription], [RegisterTime]) VALUES (N'926801fe-c5c3-48ec-b493-2090feebfb4e', N'2222', N'22', N' ', 0, 0, CAST(0x0000A7CA00AB0927 AS DateTime), 0, N' ', N' ', N' ', N' ', 0, 0, N' ', N' ', CAST(0x0000A7CA00AB0927 AS DateTime))
INSERT [dbo].[TB_UserInfo] ([UserUid], [LoginId], [NickName], [HeadImageUrl], [Age], [SexId], [Birthday], [BloodTypeId], [Address], [Position], [School], [Company], [ConstellationId], [ChineseZodiacId], [PersonalizedSignature], [PersonalizedDescription], [RegisterTime]) VALUES (N'0d5a4861-efe9-4460-850e-22b919637c33', N'333333', N'3333333', N'', 0, 0, CAST(0x0000A80F00BD148E AS DateTime), 0, N'', N'', N'', N'', 0, 0, N'', N'', CAST(0x0000A80F00BD148E AS DateTime))
INSERT [dbo].[TB_UserInfo] ([UserUid], [LoginId], [NickName], [HeadImageUrl], [Age], [SexId], [Birthday], [BloodTypeId], [Address], [Position], [School], [Company], [ConstellationId], [ChineseZodiacId], [PersonalizedSignature], [PersonalizedDescription], [RegisterTime]) VALUES (N'66c774ec-b411-4c64-a34e-2554c6396904', N'windows', N'windows', N'', 0, 0, CAST(0x0000A811010D8A20 AS DateTime), 0, N'', N'', N'', N'', 0, 0, N'', N'', CAST(0x0000A811010D8A20 AS DateTime))
INSERT [dbo].[TB_UserInfo] ([UserUid], [LoginId], [NickName], [HeadImageUrl], [Age], [SexId], [Birthday], [BloodTypeId], [Address], [Position], [School], [Company], [ConstellationId], [ChineseZodiacId], [PersonalizedSignature], [PersonalizedDescription], [RegisterTime]) VALUES (N'54a9527c-a3b1-4cf3-a8e0-264e9256f262', N'qqq', N'qqq', N'', 0, 0, CAST(0x0000A817008D0240 AS DateTime), 0, N'', N'', N'', N'', 0, 0, N'', N'', CAST(0x0000A817008D0240 AS DateTime))
INSERT [dbo].[TB_UserInfo] ([UserUid], [LoginId], [NickName], [HeadImageUrl], [Age], [SexId], [Birthday], [BloodTypeId], [Address], [Position], [School], [Company], [ConstellationId], [ChineseZodiacId], [PersonalizedSignature], [PersonalizedDescription], [RegisterTime]) VALUES (N'4dc2940a-d069-45ae-bd1a-311ec938451a', N'111', N'111', N'', 0, 0, CAST(0x0000A8170096E758 AS DateTime), 0, N'', N'', N'', N'', 0, 0, N'', N'', CAST(0x0000A8170096E758 AS DateTime))
INSERT [dbo].[TB_UserInfo] ([UserUid], [LoginId], [NickName], [HeadImageUrl], [Age], [SexId], [Birthday], [BloodTypeId], [Address], [Position], [School], [Company], [ConstellationId], [ChineseZodiacId], [PersonalizedSignature], [PersonalizedDescription], [RegisterTime]) VALUES (N'fad417b2-6d08-4a60-b8e5-586055ca4d4a', N'mmmm', N'mm', N'', 0, 0, CAST(0x0000A80F0152CE4A AS DateTime), 0, N'', N'', N'', N'', 0, 0, N'', N'', CAST(0x0000A80F0152CE4A AS DateTime))
INSERT [dbo].[TB_UserInfo] ([UserUid], [LoginId], [NickName], [HeadImageUrl], [Age], [SexId], [Birthday], [BloodTypeId], [Address], [Position], [School], [Company], [ConstellationId], [ChineseZodiacId], [PersonalizedSignature], [PersonalizedDescription], [RegisterTime]) VALUES (N'9ada28ce-d2f6-4df2-97b9-b33e9787f750', N'666666', N'666666', N'', 0, 0, CAST(0x0000A80F00B4C3A8 AS DateTime), 0, N'', N'', N'', N'', 0, 0, N'', N'', CAST(0x0000A80F00B4C3A8 AS DateTime))
INSERT [dbo].[TB_UserInfo] ([UserUid], [LoginId], [NickName], [HeadImageUrl], [Age], [SexId], [Birthday], [BloodTypeId], [Address], [Position], [School], [Company], [ConstellationId], [ChineseZodiacId], [PersonalizedSignature], [PersonalizedDescription], [RegisterTime]) VALUES (N'ec068252-3ca1-4092-86de-ef6e046b582a', N'ssss', N'ssss', N'', 0, 0, CAST(0x0000A80F00DBDE04 AS DateTime), 0, N'', N'', N'', N'', 0, 0, N'', N'', CAST(0x0000A80F00DBDE04 AS DateTime))
/****** Object:  Table [dbo].[TB_FriendShip]    Script Date: 04/22/2018 17:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_FriendShip](
	[FriendShipUid] [uniqueidentifier] NOT NULL,
	[SelfUserUid] [uniqueidentifier] NOT NULL,
	[FriendUid] [uniqueidentifier] NOT NULL,
	[StartTime] [datetime2](2) NOT NULL,
	[EndTime] [datetime2](2) NOT NULL,
	[Remark] [nvarchar](20) NOT NULL,
	[FriendStatusId] [int] NOT NULL,
	[FriendGroupUid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TB_FriendShip] PRIMARY KEY CLUSTERED 
(
	[FriendShipUid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'好友Uid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_FriendShip', @level2type=N'COLUMN',@level2name=N'FriendShipUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自己Uid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_FriendShip', @level2type=N'COLUMN',@level2name=N'SelfUserUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'好友Uid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_FriendShip', @level2type=N'COLUMN',@level2name=N'FriendUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_FriendShip', @level2type=N'COLUMN',@level2name=N'StartTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_FriendShip', @level2type=N'COLUMN',@level2name=N'EndTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'好友备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_FriendShip', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'好友状态Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_FriendShip', @level2type=N'COLUMN',@level2name=N'FriendStatusId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'好友分组Uid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_FriendShip', @level2type=N'COLUMN',@level2name=N'FriendGroupUid'
GO
/****** Object:  ForeignKey [FK_TB_UserRoleStatus_TB_UserRoleName]    Script Date: 04/22/2018 17:55:57 ******/
ALTER TABLE [dbo].[TB_UserRoleStatus]  WITH CHECK ADD  CONSTRAINT [FK_TB_UserRoleStatus_TB_UserRoleName] FOREIGN KEY([RoleId])
REFERENCES [dbo].[TB_UserRoleName] ([RoleId])
GO
ALTER TABLE [dbo].[TB_UserRoleStatus] CHECK CONSTRAINT [FK_TB_UserRoleStatus_TB_UserRoleName]
GO
/****** Object:  ForeignKey [FK_TB_UserRoleStatus_TB_UserStatusName]    Script Date: 04/22/2018 17:55:57 ******/
ALTER TABLE [dbo].[TB_UserRoleStatus]  WITH CHECK ADD  CONSTRAINT [FK_TB_UserRoleStatus_TB_UserStatusName] FOREIGN KEY([StatusId])
REFERENCES [dbo].[TB_UserStatusName] ([StatusId])
GO
ALTER TABLE [dbo].[TB_UserRoleStatus] CHECK CONSTRAINT [FK_TB_UserRoleStatus_TB_UserStatusName]
GO
/****** Object:  ForeignKey [FK_TB_UserInfo_TB_ChineseZodiacName]    Script Date: 04/22/2018 17:55:57 ******/
ALTER TABLE [dbo].[TB_UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_TB_UserInfo_TB_ChineseZodiacName] FOREIGN KEY([ChineseZodiacId])
REFERENCES [dbo].[TB_ChineseZodiacName] ([ChineseZodiacId])
GO
ALTER TABLE [dbo].[TB_UserInfo] CHECK CONSTRAINT [FK_TB_UserInfo_TB_ChineseZodiacName]
GO
/****** Object:  ForeignKey [FK_TB_UserInfo_TB_ConstellationName]    Script Date: 04/22/2018 17:55:57 ******/
ALTER TABLE [dbo].[TB_UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_TB_UserInfo_TB_ConstellationName] FOREIGN KEY([ConstellationId])
REFERENCES [dbo].[TB_ConstellationName] ([ConstellationId])
GO
ALTER TABLE [dbo].[TB_UserInfo] CHECK CONSTRAINT [FK_TB_UserInfo_TB_ConstellationName]
GO
/****** Object:  ForeignKey [FK_TB_UserInfo_TB_SexName]    Script Date: 04/22/2018 17:55:57 ******/
ALTER TABLE [dbo].[TB_UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_TB_UserInfo_TB_SexName] FOREIGN KEY([SexId])
REFERENCES [dbo].[TB_SexName] ([SexId])
GO
ALTER TABLE [dbo].[TB_UserInfo] CHECK CONSTRAINT [FK_TB_UserInfo_TB_SexName]
GO
/****** Object:  ForeignKey [FK_TB_UserInfo_TB_UserInfo]    Script Date: 04/22/2018 17:55:57 ******/
ALTER TABLE [dbo].[TB_UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_TB_UserInfo_TB_UserInfo] FOREIGN KEY([BloodTypeId])
REFERENCES [dbo].[TB_BloodTypeName] ([BloodTypeId])
GO
ALTER TABLE [dbo].[TB_UserInfo] CHECK CONSTRAINT [FK_TB_UserInfo_TB_UserInfo]
GO
/****** Object:  ForeignKey [FK_TB_FriendShip_TB_FriendGroupName]    Script Date: 04/22/2018 17:55:57 ******/
ALTER TABLE [dbo].[TB_FriendShip]  WITH CHECK ADD  CONSTRAINT [FK_TB_FriendShip_TB_FriendGroupName] FOREIGN KEY([FriendGroupUid])
REFERENCES [dbo].[TB_FriendGroupName] ([FriendGroupUid])
GO
ALTER TABLE [dbo].[TB_FriendShip] CHECK CONSTRAINT [FK_TB_FriendShip_TB_FriendGroupName]
GO
/****** Object:  ForeignKey [FK_TB_FriendShip_TB_FriendShip]    Script Date: 04/22/2018 17:55:57 ******/
ALTER TABLE [dbo].[TB_FriendShip]  WITH CHECK ADD  CONSTRAINT [FK_TB_FriendShip_TB_FriendShip] FOREIGN KEY([FriendStatusId])
REFERENCES [dbo].[TB_FriendStatusName] ([FriendStatusId])
GO
ALTER TABLE [dbo].[TB_FriendShip] CHECK CONSTRAINT [FK_TB_FriendShip_TB_FriendShip]
GO
