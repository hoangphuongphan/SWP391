USE [master]
GO
/****** Object:  Database [Foodpal]    Script Date: 7/16/2024 8:53:08 AM ******/
CREATE DATABASE [Foodpal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Foodpal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Foodpal.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Foodpal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Foodpal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Foodpal] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Foodpal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Foodpal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Foodpal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Foodpal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Foodpal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Foodpal] SET ARITHABORT OFF 
GO
ALTER DATABASE [Foodpal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Foodpal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Foodpal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Foodpal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Foodpal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Foodpal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Foodpal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Foodpal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Foodpal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Foodpal] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Foodpal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Foodpal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Foodpal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Foodpal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Foodpal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Foodpal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Foodpal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Foodpal] SET RECOVERY FULL 
GO
ALTER DATABASE [Foodpal] SET  MULTI_USER 
GO
ALTER DATABASE [Foodpal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Foodpal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Foodpal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Foodpal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Foodpal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Foodpal] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Foodpal', N'ON'
GO
ALTER DATABASE [Foodpal] SET QUERY_STORE = ON
GO
ALTER DATABASE [Foodpal] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Foodpal]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/16/2024 8:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Type] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 7/16/2024 8:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[LoginCode] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/16/2024 8:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CateID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 7/16/2024 8:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[DiscountID] [int] IDENTITY(1,1) NOT NULL,
	[DiscountName] [nvarchar](50) NULL,
	[Offer] [varchar](20) NULL,
	[ValidDate] [date] NULL,
	[ExpiredDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountOwner]    Script Date: 7/16/2024 8:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountOwner](
	[DiscountID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 7/16/2024 8:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[ShopID] [int] NULL,
	[FoodID] [int] IDENTITY(1,1) NOT NULL,
	[CateID] [int] NULL,
	[Price] [money] NULL,
	[FoodImage] [varchar](100) NULL,
	[Foodname] [nvarchar](100) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/16/2024 8:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Time] [smalldatetime] NULL,
	[ShipLocation] [nvarchar](200) NOT NULL,
	[Status] [nvarchar](20) NULL,
	[ShopID] [int] NULL,
	[Total] [int] NULL,
	[ShipperID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersDetail]    Script Date: 7/16/2024 8:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetail](
	[OrderID] [int] NOT NULL,
	[FoodID] [int] NOT NULL,
	[Amount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RateFood]    Script Date: 7/16/2024 8:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RateFood](
	[FoodID] [int] NULL,
	[RateID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Rate] [int] NULL,
	[Reply] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[RateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportFood]    Script Date: 7/16/2024 8:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportFood](
	[ReportFoodID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[FoodID] [int] NOT NULL,
	[content] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[FoodID] ASC,
	[ReportFoodID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportShipper]    Script Date: 7/16/2024 8:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportShipper](
	[ReportFoodID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ShipperID] [int] NOT NULL,
	[content] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC,
	[ReportFoodID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportShop]    Script Date: 7/16/2024 8:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportShop](
	[ReportFoodID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ShopID] [int] NOT NULL,
	[content] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShopID] ASC,
	[ReportFoodID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 7/16/2024 8:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[FoodID] [int] NULL,
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[RateID] [int] NULL,
	[content] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 7/16/2024 8:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipper](
	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [varchar](20) NULL,
	[VehicleID] [varchar](20) NOT NULL,
	[AccountID] [int] SPARSE  NULL,
	[Avatar] [nvarchar](200) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 7/16/2024 8:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ShopID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[Location] [nvarchar](100) NOT NULL,
	[ShopImage] [varchar](100) NULL,
	[AccountID] [int] NULL,
	[ShopEmail] [varchar](100) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ShopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 7/16/2024 8:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[TicketID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Subject] [nvarchar](50) NULL,
	[Content] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticketResponse]    Script Date: 7/16/2024 8:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticketResponse](
	[TicketID] [int] NOT NULL,
	[response] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/16/2024 8:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [varchar](50) NOT NULL,
	[Location] [nvarchar](100) NULL,
	[AccountID] [int] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wallet]    Script Date: 7/16/2024 8:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wallet](
	[UserID] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[Amount] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (1, N'sunheophp', N'123', N'User')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (2, N'shopanvat', N'123', N'Shop')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (1002, N'shipper1', N'123', N'Shipper')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (2002, N'pnt@123', N'123', N'User')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (2003, N'dnd@123', N'123', N'User')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (2004, N'hcm@123', N'123', N'User')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (2005, N'ptt2@123', N'123', N'User')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (2006, N'ttt@123', N'123', N'User')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (2007, N'ntp@123', N'123', N'User')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (2008, N'ptt@123', N'123', N'User')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (2009, N'shop1', N'123', N'Shop')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (2010, N'shop2', N'123', N'Shop')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (2011, N'shop3', N'123', N'Shop')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (2012, N'shop4', N'123', N'Shop')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (2013, N'shop5', N'123', N'Shop')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (2014, N'shop6', N'123', N'Shop')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (2015, N'shop7', N'123', N'Shop')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (2016, N'ship1', N'123', N'Shipper')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (2017, N'ship2', N'123', N'Shipper')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (2018, N'ship3', N'123', N'Shipper')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (2019, N'ship4', N'123', N'Shipper')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (2020, N'ship5', N'123', N'Shipper')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (2021, N'ship6', N'123', N'Shipper')
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Type]) VALUES (3004, N'shopnew', N'123', N'Shop')
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 
GO
INSERT [dbo].[Admin] ([AdminID], [Name], [LoginCode]) VALUES (1, N'Phuong', N'php_am1')
GO
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([CateID], [Name]) VALUES (1, N'Snacks')
GO
INSERT [dbo].[Category] ([CateID], [Name]) VALUES (2, N'Desserts')
GO
INSERT [dbo].[Category] ([CateID], [Name]) VALUES (3, N'Soups')
GO
INSERT [dbo].[Category] ([CateID], [Name]) VALUES (4, N'Beverages')
GO
INSERT [dbo].[Category] ([CateID], [Name]) VALUES (5, N'Main Courses')
GO
INSERT [dbo].[Category] ([CateID], [Name]) VALUES (1002, N'Salads')
GO
INSERT [dbo].[Category] ([CateID], [Name]) VALUES (1003, N'Breakfast')
GO
INSERT [dbo].[Category] ([CateID], [Name]) VALUES (1004, N'Vegan')
GO
INSERT [dbo].[Category] ([CateID], [Name]) VALUES (1005, N'Seafood')
GO
INSERT [dbo].[Category] ([CateID], [Name]) VALUES (1006, N'Appetizers')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 
GO
INSERT [dbo].[Discount] ([DiscountID], [DiscountName], [Offer], [ValidDate], [ExpiredDate]) VALUES (3, N'Giam 30%', N'30%', CAST(N'2024-03-11' AS Date), CAST(N'2025-11-25' AS Date))
GO
INSERT [dbo].[Discount] ([DiscountID], [DiscountName], [Offer], [ValidDate], [ExpiredDate]) VALUES (4, N'Free ship', N'free-ship', CAST(N'2024-03-11' AS Date), CAST(N'2025-11-25' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
INSERT [dbo].[DiscountOwner] ([DiscountID], [UserID], [stock]) VALUES (3, 1, 5)
GO
INSERT [dbo].[DiscountOwner] ([DiscountID], [UserID], [stock]) VALUES (4, 1, 5)
GO
SET IDENTITY_INSERT [dbo].[Food] ON 
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 1, 1, 20000.0000, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnbmkhQSim64h2vJzu939EAZM8KjeFAp31bw&s', N'banh trang tron', 2)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2, 1, 15000.0000, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKe9wBAIHdUUKA89uIRnV40VQ0AZtsuvlxMg&s', N'banh trang cuon', 2)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 1005, 1, 15000.0000, NULL, N'banh trang cuon nuong', 2)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 1006, 1, 20000.0000, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnbmkhQSim64h2vJzu939EAZM8KjeFAp31bw&s', N'banh trang tron trung cut', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2004, 1, 15000.0000, NULL, N'banh trang cuon nuong', 2)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2006, 1, 15000.0000, NULL, N'banh trang cuon nuong', 2)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2007, 1, 15000.0000, N'FoodImage\5.jpg', N'banh trang cuon nuong', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2008, 1, 50000.0000, N'FoodImages/1.jpg', N'Chips', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2009, 1, 55000.0000, N'FoodImages/2.jpg', N'Pretzels', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2010, 1, 60000.0000, N'FoodImages/3.jpg', N'Popcorn', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2011, 2, 70000.0000, N'FoodImages/4.jpg', N'Chocolate Cake', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2012, 2, 65000.0000, N'FoodImages/5.jpg', N'Cheesecake', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2013, 2, 80000.0000, N'FoodImages/6.jpg', N'Ice Cream', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2014, 3, 50000.0000, N'FoodImages/7.jpg', N'Chicken Soup', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2015, 3, 55000.0000, N'FoodImages/8.jpg', N'Tomato Soup', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2016, 3, 60000.0000, N'FoodImages/9.jpg', N'Beef Soup', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2017, 4, 30000.0000, N'FoodImages/10.jpg', N'Lemonade', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2018, 4, 35000.0000, N'FoodImages/11.jpg', N'Orange Juice', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2019, 4, 40000.0000, N'FoodImages/12.jpg', N'Milkshake', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2020, 5, 150000.0000, N'FoodImages/13.jpg', N'Beef Steak', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2021, 5, 140000.0000, N'FoodImages/14.jpg', N'Grilled Chicken', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2022, 5, 160000.0000, N'FoodImages/15.jpg', N'Spaghetti', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2023, 1002, 70000.0000, N'FoodImages/16.jpg', N'Caesar Salad', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2024, 1002, 65000.0000, N'FoodImages/17.jpg', N'Greek Salad', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2025, 1002, 80000.0000, N'FoodImages/18.jpg', N'Fruit Salad', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2026, 1003, 50000.0000, N'FoodImages/19.jpg', N'Pancakes', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2027, 1003, 55000.0000, N'FoodImages/20.jpg', N'Omelette', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2028, 1003, 60000.0000, N'FoodImages/21.jpg', N'French Toast', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2029, 1004, 80000.0000, N'FoodImages/22.jpg', N'Vegan Burger', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2030, 1004, 75000.0000, N'FoodImages/23.jpg', N'Vegan Salad', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2031, 1004, 90000.0000, N'FoodImages/24.jpg', N'Vegan Pizza', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2032, 1005, 100000.0000, N'FoodImages/25.jpg', N'Grilled Salmon', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2033, 1005, 95000.0000, N'FoodImages/26.jpg', N'Shrimp Cocktail', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2034, 1005, 110000.0000, N'FoodImages/27.jpg', N'Lobster', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2035, 1006, 40000.0000, N'FoodImages/28.jpg', N'Spring Rolls', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2036, 1006, 35000.0000, N'FoodImages/29.jpg', N'Bruschetta', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (1, 2037, 1006, 45000.0000, N'FoodImages/30.jpg', N'Garlic Bread', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2038, 1, 50000.0000, N'FoodImages/31.jpg', N'Chips', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2039, 1, 55000.0000, N'FoodImages/32.jpg', N'Pretzels', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2040, 1, 60000.0000, N'FoodImages/33.jpg', N'Popcorn', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2041, 2, 70000.0000, N'FoodImages/34.jpg', N'Chocolate Cake', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2042, 2, 65000.0000, N'FoodImages/35.jpg', N'Cheesecake', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2043, 2, 80000.0000, N'FoodImages/36.jpg', N'Ice Cream', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2044, 3, 50000.0000, N'FoodImages/37.jpg', N'Chicken Soup', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2045, 3, 55000.0000, N'FoodImages/38.jpg', N'Tomato Soup', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2046, 3, 60000.0000, N'FoodImages/39.jpg', N'Beef Soup', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2047, 4, 30000.0000, N'FoodImages/40.jpg', N'Lemonade', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2048, 4, 35000.0000, N'FoodImages/41.jpg', N'Orange Juice', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2049, 4, 40000.0000, N'FoodImages/42.jpg', N'Milkshake', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2050, 5, 150000.0000, N'FoodImages/43.jpg', N'Beef Steak', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2051, 5, 140000.0000, N'FoodImages/44.jpg', N'Grilled Chicken', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2052, 5, 160000.0000, N'FoodImages/45.jpg', N'Spaghetti', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2053, 1002, 70000.0000, N'FoodImages/46.jpg', N'Caesar Salad', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2054, 1002, 65000.0000, N'FoodImages/47.jpg', N'Greek Salad', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2055, 1002, 80000.0000, N'FoodImages/48.jpg', N'Fruit Salad', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2056, 1003, 50000.0000, N'FoodImages/49.jpg', N'Pancakes', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2057, 1003, 55000.0000, N'FoodImages/50.jpg', N'Omelette', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2058, 1003, 60000.0000, N'FoodImages/51.jpg', N'French Toast', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2059, 1004, 80000.0000, N'FoodImages/52.jpg', N'Vegan Burger', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2060, 1004, 75000.0000, N'FoodImages/53.jpg', N'Vegan Salad', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2061, 1004, 90000.0000, N'FoodImages/54.jpg', N'Vegan Pizza', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2062, 1005, 100000.0000, N'FoodImages/55.jpg', N'Grilled Salmon', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2063, 1005, 95000.0000, N'FoodImages/56.jpg', N'Shrimp Cocktail', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2064, 1005, 110000.0000, N'FoodImages/57.jpg', N'Lobster', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2065, 1006, 40000.0000, N'FoodImages/58.jpg', N'Spring Rolls', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2066, 1006, 35000.0000, N'FoodImages/59.jpg', N'Bruschetta', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (2, 2067, 1006, 45000.0000, N'FoodImages/60.jpg', N'Garlic Bread', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2068, 1, 50000.0000, N'FoodImages/61.jpg', N'Chips', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2069, 1, 55000.0000, N'FoodImages/62.jpg', N'Pretzels', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2070, 1, 60000.0000, N'FoodImages/63.jpg', N'Popcorn', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2071, 2, 70000.0000, N'FoodImages/64.jpg', N'Chocolate Cake', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2072, 2, 65000.0000, N'FoodImages/65.jpg', N'Cheesecake', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2073, 2, 80000.0000, N'FoodImages/66.jpg', N'Ice Cream', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2074, 3, 50000.0000, N'FoodImages/67.jpg', N'Chicken Soup', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2075, 3, 55000.0000, N'FoodImages/68.jpg', N'Tomato Soup', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2076, 3, 60000.0000, N'FoodImages/69.jpg', N'Beef Soup', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2077, 4, 30000.0000, N'FoodImages/70.jpg', N'Lemonade', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2078, 4, 35000.0000, N'FoodImages/71.jpg', N'Orange Juice', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2079, 4, 40000.0000, N'FoodImages/72.jpg', N'Milkshake', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2080, 5, 150000.0000, N'FoodImages/73.jpg', N'Beef Steak', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2081, 5, 140000.0000, N'FoodImages/74.jpg', N'Grilled Chicken', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2082, 5, 160000.0000, N'FoodImages/75.jpg', N'Spaghetti', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2083, 1002, 70000.0000, N'FoodImages/76.jpg', N'Caesar Salad', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2084, 1002, 65000.0000, N'FoodImages/77.jpg', N'Greek Salad', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2085, 1002, 80000.0000, N'FoodImages/78.jpg', N'Fruit Salad', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2086, 1003, 50000.0000, N'FoodImages/79.jpg', N'Pancakes', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2087, 1003, 55000.0000, N'FoodImages/80.jpg', N'Omelette', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2088, 1003, 60000.0000, N'FoodImages/81.jpg', N'French Toast', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2089, 1004, 80000.0000, N'FoodImages/82.jpg', N'Vegan Burger', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2090, 1004, 75000.0000, N'FoodImages/83.jpg', N'Vegan Salad', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2091, 1004, 90000.0000, N'FoodImages/84.jpg', N'Vegan Pizza', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2092, 1005, 100000.0000, N'FoodImages/85.jpg', N'Grilled Salmon', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2093, 1005, 95000.0000, N'FoodImages/86.jpg', N'Shrimp Cocktail', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2094, 1005, 110000.0000, N'FoodImages/87.jpg', N'Lobster', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2095, 1006, 40000.0000, N'FoodImages/88.jpg', N'Spring Rolls', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2096, 1006, 35000.0000, N'FoodImages/89.jpg', N'Bruschetta', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (3, 2097, 1006, 45000.0000, N'FoodImages/90.jpg', N'Garlic Bread', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (4, 2098, 1, 50000.0000, N'FoodImages/91.jpg', N'Chips', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (4, 2099, 1, 55000.0000, N'FoodImages/92.jpg', N'Pretzels', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (4, 2100, 1, 60000.0000, N'FoodImages/93.jpg', N'Popcorn', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (4, 2101, 2, 70000.0000, N'FoodImages/94.jpg', N'Chocolate Cake', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (4, 2102, 2, 65000.0000, N'FoodImages/95.jpg', N'Cheesecake', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (4, 2103, 2, 80000.0000, N'FoodImages/96.jpg', N'Ice Cream', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (4, 2104, 3, 50000.0000, N'FoodImages/97.jpg', N'Chicken Soup', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (4, 2105, 3, 55000.0000, N'FoodImages/98.jpg', N'Tomato Soup', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (4, 2106, 3, 60000.0000, N'FoodImages/99.jpg', N'Beef Soup', 1)
GO
INSERT [dbo].[Food] ([ShopID], [FoodID], [CateID], [Price], [FoodImage], [Foodname], [Status]) VALUES (4, 2107, 4, 30000.0000, N'FoodImages/100.jpg', N'Lemonade', 1)
GO
SET IDENTITY_INSERT [dbo].[Food] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [Time], [ShipLocation], [Status], [ShopID], [Total], [ShipperID]) VALUES (2012, 1, CAST(N'2024-07-15T21:19:00' AS SmallDateTime), N'328 Cù Chính Lan, P.An Khê, Q.Thanh Khê, Đà Nẵng, 50000, Vietnam', N'Done', 1, 125000, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [Time], [ShipLocation], [Status], [ShopID], [Total], [ShipperID]) VALUES (2014, 1, CAST(N'2024-07-15T22:58:00' AS SmallDateTime), N'328 Cù Chính Lan, P.An Khê, Q.Thanh Khê, Đà Nẵng, 50000, Vietnam', N'Cooking', 1, 125000, 4)
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [Time], [ShipLocation], [Status], [ShopID], [Total], [ShipperID]) VALUES (3012, 1, CAST(N'2024-07-16T07:55:00' AS SmallDateTime), N'328 Cù Chính Lan, P.An Khê, Q.Thanh Khê, Đà Nẵng, 50000, Vietnam', N'Done', 1, 125000, 1)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[OrdersDetail] ([OrderID], [FoodID], [Amount]) VALUES (2012, 1, 4)
GO
INSERT [dbo].[OrdersDetail] ([OrderID], [FoodID], [Amount]) VALUES (2012, 2, 3)
GO
INSERT [dbo].[OrdersDetail] ([OrderID], [FoodID], [Amount]) VALUES (2014, 1, 4)
GO
INSERT [dbo].[OrdersDetail] ([OrderID], [FoodID], [Amount]) VALUES (2014, 2, 3)
GO
INSERT [dbo].[OrdersDetail] ([OrderID], [FoodID], [Amount]) VALUES (3012, 1, 4)
GO
INSERT [dbo].[OrdersDetail] ([OrderID], [FoodID], [Amount]) VALUES (3012, 2, 3)
GO
SET IDENTITY_INSERT [dbo].[RateFood] ON 
GO
INSERT [dbo].[RateFood] ([FoodID], [RateID], [UserID], [Rate], [Reply]) VALUES (2007, 1, 1, 5, N'thanks')
GO
INSERT [dbo].[RateFood] ([FoodID], [RateID], [UserID], [Rate], [Reply]) VALUES (2007, 2, 1, 5, NULL)
GO
SET IDENTITY_INSERT [dbo].[RateFood] OFF
GO
SET IDENTITY_INSERT [dbo].[ReportFood] ON 
GO
INSERT [dbo].[ReportFood] ([ReportFoodID], [UserID], [FoodID], [content]) VALUES (1, 1, 1006, N'bad')
GO
SET IDENTITY_INSERT [dbo].[ReportFood] OFF
GO
SET IDENTITY_INSERT [dbo].[ReportShipper] ON 
GO
INSERT [dbo].[ReportShipper] ([ReportFoodID], [UserID], [ShipperID], [content]) VALUES (1, 1, 1, N'steal')
GO
SET IDENTITY_INSERT [dbo].[ReportShipper] OFF
GO
SET IDENTITY_INSERT [dbo].[ReportShop] ON 
GO
INSERT [dbo].[ReportShop] ([ReportFoodID], [UserID], [ShopID], [content]) VALUES (1, 1, 1, N'bad')
GO
SET IDENTITY_INSERT [dbo].[ReportShop] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 
GO
INSERT [dbo].[Review] ([FoodID], [ReviewID], [UserID], [RateID], [content]) VALUES (2007, 1, 1, 1, N'nice')
GO
INSERT [dbo].[Review] ([FoodID], [ReviewID], [UserID], [RateID], [content]) VALUES (2007, 2, 1, 2, N'nice')
GO
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipper] ON 
GO
INSERT [dbo].[Shipper] ([ShipperID], [Name], [Phone], [VehicleID], [AccountID], [Avatar], [status]) VALUES (1, N'Phan Hoang Phuong', N'0914020508', N'43D67397', 1002, NULL, 2)
GO
INSERT [dbo].[Shipper] ([ShipperID], [Name], [Phone], [VehicleID], [AccountID], [Avatar], [status]) VALUES (4, N'Do Ngoc Duc', N'0932054032', N'43D392053', 2016, NULL, 2)
GO
INSERT [dbo].[Shipper] ([ShipperID], [Name], [Phone], [VehicleID], [AccountID], [Avatar], [status]) VALUES (5, N'Phung Nhat Tan', N'09323434032', N'43D3923423', 2017, NULL, 1)
GO
INSERT [dbo].[Shipper] ([ShipperID], [Name], [Phone], [VehicleID], [AccountID], [Avatar], [status]) VALUES (6, N'Hoang Cong Minh', N'0933214032', N'43D395433', 2018, NULL, 1)
GO
INSERT [dbo].[Shipper] ([ShipperID], [Name], [Phone], [VehicleID], [AccountID], [Avatar], [status]) VALUES (7, N'Than Tuyet Trinh', N'084232032', N'43D392654', 2019, NULL, 1)
GO
INSERT [dbo].[Shipper] ([ShipperID], [Name], [Phone], [VehicleID], [AccountID], [Avatar], [status]) VALUES (8, N'Hoang Thao My', N'0932432032', N'43D555053', 2020, NULL, 1)
GO
INSERT [dbo].[Shipper] ([ShipperID], [Name], [Phone], [VehicleID], [AccountID], [Avatar], [status]) VALUES (9, N'Do Minh Duc', N'0943252232', N'43D365432', 2021, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Shipper] OFF
GO
SET IDENTITY_INSERT [dbo].[Shop] ON 
GO
INSERT [dbo].[Shop] ([ShopID], [Name], [Phone], [Location], [ShopImage], [AccountID], [ShopEmail], [Status]) VALUES (1, N'Do an vat', N'0914020508', N'124 Tran Quoc Toan', N'Avatar\26.jpg', 2, N'phoangphuong309@gmail.com', 1)
GO
INSERT [dbo].[Shop] ([ShopID], [Name], [Phone], [Location], [ShopImage], [AccountID], [ShopEmail], [Status]) VALUES (2, N'Phuc Drink', N'0943050702', N'12 Dinh Tien Hoang', N'phoangphuong309@gmail.com', 2009, N'phoangphuong309@gmail.com', 1)
GO
INSERT [dbo].[Shop] ([ShopID], [Name], [Phone], [Location], [ShopImage], [AccountID], [ShopEmail], [Status]) VALUES (3, N'Ba Mua', N'0943043254', N'12 Nguyen Chi Thanh', N'phoangphuong309@gmail.com', 2010, N'phoangphuong309@gmail.com', 1)
GO
INSERT [dbo].[Shop] ([ShopID], [Name], [Phone], [Location], [ShopImage], [AccountID], [ShopEmail], [Status]) VALUES (4, N'Mi Quang Ech', N'0944343254', N'12 Phan Chau Trinh', N'phoangphuong309@gmail.com', 2011, N'phoangphuong309@gmail.com', 1)
GO
INSERT [dbo].[Shop] ([ShopID], [Name], [Phone], [Location], [ShopImage], [AccountID], [ShopEmail], [Status]) VALUES (5, N'Dasushi', N'0943045554', N'12 Nguyen Sinh Cung', N'phoangphuong309@gmail.com', 2012, N'phoangphuong309@gmail.com', 1)
GO
INSERT [dbo].[Shop] ([ShopID], [Name], [Phone], [Location], [ShopImage], [AccountID], [ShopEmail], [Status]) VALUES (6, N'bun Mam Van', N'0943432254', N'12 Nguyen tri Phuong', N'phoangphuong309@gmail.com', 2013, N'phoangphuong309@gmail.com', 1)
GO
INSERT [dbo].[Shop] ([ShopID], [Name], [Phone], [Location], [ShopImage], [AccountID], [ShopEmail], [Status]) VALUES (7, N'Mi Quang 1A', N'0943543254', N'12 Hai Phong', N'phoangphuong309@gmail.com', 2014, N'phoangphuong309@gmail.com', 1)
GO
INSERT [dbo].[Shop] ([ShopID], [Name], [Phone], [Location], [ShopImage], [AccountID], [ShopEmail], [Status]) VALUES (8, N'Bnh Mi Nuong Lang Son', N'0943044354', N'12 Dong Da', N'phoangphuong309@gmail.com', 2015, N'phoangphuong309@gmail.com', 2)
GO
INSERT [dbo].[Shop] ([ShopID], [Name], [Phone], [Location], [ShopImage], [AccountID], [ShopEmail], [Status]) VALUES (1002, N'user952958000', N'0914020508', N'328 Cù Chính Lan, P.An Khê, Q.Thanh Khê, Đà Nẵng, 50000, Vietnam', NULL, 3004, N'phoangphuong309@gmail.com', 4)
GO
SET IDENTITY_INSERT [dbo].[Shop] OFF
GO
SET IDENTITY_INSERT [dbo].[Ticket] ON 
GO
INSERT [dbo].[Ticket] ([TicketID], [UserID], [Subject], [Content]) VALUES (1, 1, N'help me', N'test ticket writing')
GO
SET IDENTITY_INSERT [dbo].[Ticket] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserID], [Name], [Phone], [Email], [Location], [AccountID], [status]) VALUES (1, N'Phuong', N'0914020508', N'phoangphuong309@gmail.com', NULL, 1, 1)
GO
INSERT [dbo].[Users] ([UserID], [Name], [Phone], [Email], [Location], [AccountID], [status]) VALUES (4, N'Phung Nhat Tan', N'0382958373', N'email1@gmail.com', N'', 2002, 1)
GO
INSERT [dbo].[Users] ([UserID], [Name], [Phone], [Email], [Location], [AccountID], [status]) VALUES (5, N'Do Ngoc Duc', N'0382943254', N'email2@gmail.com', N'', 2003, 1)
GO
INSERT [dbo].[Users] ([UserID], [Name], [Phone], [Email], [Location], [AccountID], [status]) VALUES (6, N'Hoang Cong minh', N'0384262575', N'email3@gmail.com', N'', 2004, 1)
GO
INSERT [dbo].[Users] ([UserID], [Name], [Phone], [Email], [Location], [AccountID], [status]) VALUES (7, N'Phan Thanh Tai', N'0382958361', N'email4@gmail.com', N'', 2005, 1)
GO
INSERT [dbo].[Users] ([UserID], [Name], [Phone], [Email], [Location], [AccountID], [status]) VALUES (8, N'Phan Minh Thanh', N'0382954372', N'email5@gmail.com', N'', 2008, 1)
GO
INSERT [dbo].[Users] ([UserID], [Name], [Phone], [Email], [Location], [AccountID], [status]) VALUES (9, N'Than Tuyet Trinh', N'0382954324', N'email6@gmail.com', N'', 2006, 1)
GO
INSERT [dbo].[Users] ([UserID], [Name], [Phone], [Email], [Location], [AccountID], [status]) VALUES (10, N'Nguyen trong Phuong', N'0382952345', N'email7@gmail.com', N'', 2007, 1)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[Wallet] ([UserID], [Type], [Amount]) VALUES (1, 1, 98855000.0000)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Person]    Script Date: 7/16/2024 8:53:09 AM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UC_Person] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Discount] ADD  DEFAULT (getdate()) FOR [ValidDate]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [Time]
GO
ALTER TABLE [dbo].[DiscountOwner]  WITH CHECK ADD FOREIGN KEY([DiscountID])
REFERENCES [dbo].[Discount] ([DiscountID])
GO
ALTER TABLE [dbo].[DiscountOwner]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD FOREIGN KEY([CateID])
REFERENCES [dbo].[Category] ([CateID])
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shop] ([ShopID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([ShipperID])
REFERENCES [dbo].[Shipper] ([ShipperID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shop] ([ShopID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[OrdersDetail]  WITH CHECK ADD FOREIGN KEY([FoodID])
REFERENCES [dbo].[Food] ([FoodID])
GO
ALTER TABLE [dbo].[OrdersDetail]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[RateFood]  WITH CHECK ADD FOREIGN KEY([FoodID])
REFERENCES [dbo].[Food] ([FoodID])
GO
ALTER TABLE [dbo].[RateFood]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ReportFood]  WITH CHECK ADD FOREIGN KEY([FoodID])
REFERENCES [dbo].[Food] ([FoodID])
GO
ALTER TABLE [dbo].[ReportFood]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ReportShipper]  WITH CHECK ADD FOREIGN KEY([ShipperID])
REFERENCES [dbo].[Shipper] ([ShipperID])
GO
ALTER TABLE [dbo].[ReportShipper]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ReportShop]  WITH CHECK ADD FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shop] ([ShopID])
GO
ALTER TABLE [dbo].[ReportShop]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([FoodID])
REFERENCES [dbo].[Food] ([FoodID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([RateID])
REFERENCES [dbo].[RateFood] ([RateID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Shipper]  WITH CHECK ADD  CONSTRAINT [FK_Shipper_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Shipper] CHECK CONSTRAINT [FK_Shipper_Account]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Account]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ticketResponse]  WITH CHECK ADD FOREIGN KEY([TicketID])
REFERENCES [dbo].[Ticket] ([TicketID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Account]
GO
ALTER TABLE [dbo].[Wallet]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD CHECK  (([Type]='Shipper' OR [Type]='Shop' OR [Type]='User'))
GO
ALTER TABLE [dbo].[DiscountOwner]  WITH CHECK ADD  CONSTRAINT [stock] CHECK  (([stock]>(-1)))
GO
ALTER TABLE [dbo].[DiscountOwner] CHECK CONSTRAINT [stock]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([Status]='Denied' OR [Status]='Done' OR [Status]='Shipping' OR [Status]='Cooking'))
GO
ALTER TABLE [dbo].[RateFood]  WITH CHECK ADD  CONSTRAINT [Rate] CHECK  (([Rate]>=(0) AND [Rate]<=(5)))
GO
ALTER TABLE [dbo].[RateFood] CHECK CONSTRAINT [Rate]
GO
USE [master]
GO
ALTER DATABASE [Foodpal] SET  READ_WRITE 
GO
