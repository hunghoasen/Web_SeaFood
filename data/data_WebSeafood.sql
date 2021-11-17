USE [master]
GO
/****** Object:  Database [SeaFoods]    Script Date: 8/18/2021 10:40:38 PM ******/
CREATE DATABASE [SeaFoods]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SeaFoods', FILENAME = N'E:\Web\Data_Web\SeaFoods.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SeaFoods_log', FILENAME = N'E:\Web\Data_Web\SeaFoods_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SeaFoods] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SeaFoods].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SeaFoods] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SeaFoods] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SeaFoods] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SeaFoods] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SeaFoods] SET ARITHABORT OFF 
GO
ALTER DATABASE [SeaFoods] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SeaFoods] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SeaFoods] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SeaFoods] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SeaFoods] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SeaFoods] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SeaFoods] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SeaFoods] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SeaFoods] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SeaFoods] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SeaFoods] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SeaFoods] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SeaFoods] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SeaFoods] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SeaFoods] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SeaFoods] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SeaFoods] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SeaFoods] SET RECOVERY FULL 
GO
ALTER DATABASE [SeaFoods] SET  MULTI_USER 
GO
ALTER DATABASE [SeaFoods] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SeaFoods] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SeaFoods] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SeaFoods] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SeaFoods] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SeaFoods] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SeaFoods] SET QUERY_STORE = OFF
GO
USE [SeaFoods]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 8/18/2021 10:40:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quatity] [int] NOT NULL,
	[productdetailsID] [int] NOT NULL,
	[orderID] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/18/2021 10:40:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[imgURL] [nchar](10) NOT NULL,
	[description] [nvarchar](50) NULL,
	[subID] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 8/18/2021 10:40:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderdate] [date] NOT NULL,
	[deliveryAddress] [nvarchar](50) NOT NULL,
	[payment] [nvarchar](50) NOT NULL,
	[Total] [decimal](18, 0) NOT NULL,
	[status] [nchar](10) NULL,
	[cartID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[paymentMethod] [nvarchar](50) NOT NULL,
	[phone] [int] NULL,
	[fee] [float] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productdetails]    Script Date: 8/18/2021 10:40:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productdetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[size] [nvarchar](50) NOT NULL,
	[imgURL] [nvarchar](50) NOT NULL,
	[description] [nvarchar](500) NULL,
	[categoryID] [int] NULL,
 CONSTRAINT [PK_Productdetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 8/18/2021 10:40:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[phone] [int] NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[birthday] [date] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name], [imgURL], [description], [subID]) VALUES (1, N'Cá', N'1.jpg     ', NULL, 1)
INSERT [dbo].[Category] ([id], [name], [imgURL], [description], [subID]) VALUES (2, N'Cua', N'cua.jpg   ', NULL, 2)
INSERT [dbo].[Category] ([id], [name], [imgURL], [description], [subID]) VALUES (3, N'Mực', N'muc.jpg   ', NULL, 3)
INSERT [dbo].[Category] ([id], [name], [imgURL], [description], [subID]) VALUES (4, N'Tôm', N'tom.jpg   ', NULL, 4)
INSERT [dbo].[Category] ([id], [name], [imgURL], [description], [subID]) VALUES (5, N'Cá nục', N'canc.jpg  ', NULL, 1)
INSERT [dbo].[Category] ([id], [name], [imgURL], [description], [subID]) VALUES (7, N'Cá ngừ đại dương', N'cnd.jpg   ', NULL, 1)
INSERT [dbo].[Category] ([id], [name], [imgURL], [description], [subID]) VALUES (8, N'Cua Hoàng Đế', N'chd.jpg   ', NULL, 2)
INSERT [dbo].[Category] ([id], [name], [imgURL], [description], [subID]) VALUES (9, N'Mực khổng Lồ', N'mkl.jpg   ', NULL, 3)
INSERT [dbo].[Category] ([id], [name], [imgURL], [description], [subID]) VALUES (10, N'Mực lá', N'ml.jpg    ', NULL, 3)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Productdetails] ON 

INSERT [dbo].[Productdetails] ([id], [name], [price], [size], [imgURL], [description], [categoryID]) VALUES (1, N'Cá nục bông', 150.05, N'kg', N'ca-nuc-tuoi-cac-mon-ngon-tu-ca-nuc-.jpg', N'cá nhỏ ', 5)
INSERT [dbo].[Productdetails] ([id], [name], [price], [size], [imgURL], [description], [categoryID]) VALUES (3, N'Cá mập ', 999999.99, N'kg', N'White_shark.jpg', N'cá bự', 1)
INSERT [dbo].[Productdetails] ([id], [name], [price], [size], [imgURL], [description], [categoryID]) VALUES (4, N'Cua Hoàng Đế', 1700, N'kg', N'cua-hoang-de-2.jpg', N'cua bự', 8)
INSERT [dbo].[Productdetails] ([id], [name], [price], [size], [imgURL], [description], [categoryID]) VALUES (5, N'Cua gạch', 50000, N'kg', N'cua-bien.jpg', N'cua vừa', 2)
INSERT [dbo].[Productdetails] ([id], [name], [price], [size], [imgURL], [description], [categoryID]) VALUES (7, N'Bạch tuộc', 60000, N'mg', N'bach-tuoc.jpg', N'mực vừa', 3)
INSERT [dbo].[Productdetails] ([id], [name], [price], [size], [imgURL], [description], [categoryID]) VALUES (8, N'Cá đêu hồng', 20000, N'mg', N'cadeuhong.jpg', N'cá vừa', 1)
INSERT [dbo].[Productdetails] ([id], [name], [price], [size], [imgURL], [description], [categoryID]) VALUES (9, N'Cá đêu hồng', 2131213321, N'kg', N'Muc-tuoi-lam-cha-muc.jpg', N'mực bự ', 9)
INSERT [dbo].[Productdetails] ([id], [name], [price], [size], [imgURL], [description], [categoryID]) VALUES (10, N'Mực non', 1223.213, N'mg', N'Muc-tuoi-lam-cha-muc.jpg', N'mực nhỏ ', 10)
INSERT [dbo].[Productdetails] ([id], [name], [price], [size], [imgURL], [description], [categoryID]) VALUES (13, N'Cá voi', 99090, N'kg', N'White_shark.jpg', N'cá bự', 1)
INSERT [dbo].[Productdetails] ([id], [name], [price], [size], [imgURL], [description], [categoryID]) VALUES (14, N'Cá voi', 9239329, N'kg', N'White_shark.jpg', N'cá bự', 1)
INSERT [dbo].[Productdetails] ([id], [name], [price], [size], [imgURL], [description], [categoryID]) VALUES (15, N'Cá voi', 13123123, N'kg', N'ca-voi-trang-thong-minh.jpg', N'asdasd', 1)
INSERT [dbo].[Productdetails] ([id], [name], [price], [size], [imgURL], [description], [categoryID]) VALUES (17, N'cá ba sa', 123123, N'asdasd', N'White_shark.jpg', N'asdas', 1)
INSERT [dbo].[Productdetails] ([id], [name], [price], [size], [imgURL], [description], [categoryID]) VALUES (18, N'cá bống', 123123, N'123213', N'White_shark.jpg', N'12321', 1)
INSERT [dbo].[Productdetails] ([id], [name], [price], [size], [imgURL], [description], [categoryID]) VALUES (19, N'Tôm hùm ', 15.55, N'kg', N'tomtom.jpg', N'tôm bự', 4)
INSERT [dbo].[Productdetails] ([id], [name], [price], [size], [imgURL], [description], [categoryID]) VALUES (20, N'Tôm đất', 20.7, N'kg', N'tomtom.jpg', N'tôm nhỏ ', 4)
INSERT [dbo].[Productdetails] ([id], [name], [price], [size], [imgURL], [description], [categoryID]) VALUES (21, N'Cá mmmmm', 321321321, N'kg', N'mm.jpg', N'không có', NULL)
SET IDENTITY_INSERT [dbo].[Productdetails] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Order] FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Order]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Productdetails] FOREIGN KEY([productdetailsID])
REFERENCES [dbo].[Productdetails] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Productdetails]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Category] FOREIGN KEY([subID])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Category]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Productdetails]  WITH CHECK ADD  CONSTRAINT [FK_Productdetails_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Productdetails] CHECK CONSTRAINT [FK_Productdetails_Category]
GO
USE [master]
GO
ALTER DATABASE [SeaFoods] SET  READ_WRITE 
GO
