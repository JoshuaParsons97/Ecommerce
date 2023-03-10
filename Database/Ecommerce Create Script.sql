/****** Object:  Database [EcommerceDev]    Script Date: 2022/08/20 11:12:12 ******/
CREATE DATABASE [EcommerceDev]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 2 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [EcommerceDev] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [EcommerceDev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EcommerceDev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EcommerceDev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EcommerceDev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EcommerceDev] SET ARITHABORT OFF 
GO
ALTER DATABASE [EcommerceDev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EcommerceDev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EcommerceDev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EcommerceDev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EcommerceDev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EcommerceDev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EcommerceDev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EcommerceDev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EcommerceDev] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [EcommerceDev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EcommerceDev] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [EcommerceDev] SET  MULTI_USER 
GO
ALTER DATABASE [EcommerceDev] SET ENCRYPTION ON
GO
ALTER DATABASE [EcommerceDev] SET QUERY_STORE = ON
GO
ALTER DATABASE [EcommerceDev] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[Address]    Script Date: 2022/08/20 11:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Address_ID] [varchar](36) NOT NULL,
	[Client_ID] [varchar](36) NULL,
	[AddressLine] [varchar](250) NOT NULL,
	[Suburb] [varchar](250) NULL,
	[Province] [varchar](250) NULL,
	[City] [varchar](250) NULL,
	[ZipCode] [int] NOT NULL,
	[Country] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Address_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 2022/08/20 11:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Client_ID] [varchar](36) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Password] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Client_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientRole]    Script Date: 2022/08/20 11:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientRole](
	[ClientRole_ID] [varchar](36) NOT NULL,
	[Client_ID] [varchar](36) NOT NULL,
	[Role_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientRole_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IndexImage]    Script Date: 2022/08/20 11:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndexImage](
	[IndexImage_ID] [varchar](50) NOT NULL,
	[URL] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[IndexImage_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2022/08/20 11:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_ID] [varchar](36) NOT NULL,
	[Number] [int] IDENTITY(1,1) NOT NULL,
	[Client_ID] [varchar](36) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[DeliveryAddress_ID] [varchar](36) NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProductLink]    Script Date: 2022/08/20 11:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProductLink](
	[OrderProductLink_ID] [varchar](36) NOT NULL,
	[Order_ID] [varchar](36) NOT NULL,
	[Product_ID] [varchar](36) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ItemPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderProductLink_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PasswordRecovery]    Script Date: 2022/08/20 11:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PasswordRecovery](
	[PasswordRecovery_ID] [varchar](36) NOT NULL,
	[Client_ID] [varchar](36) NOT NULL,
	[DateRequested] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PasswordRecovery_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2022/08/20 11:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_ID] [varchar](36) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Price] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Category_ID] [varchar](36) NOT NULL,
	[Brand] [varchar](200) NOT NULL,
	[Color] [varchar](200) NOT NULL,
	[WeightInGrams] [int] NOT NULL,
	[HeightInMillimeters] [int] NOT NULL,
	[WidthInMillimeters] [int] NOT NULL,
	[DepthInMillimeters] [int] NOT NULL,
	[Featured] [bit] NULL,
	[Hidden] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 2022/08/20 11:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ProductCategory_ID] [varchar](36) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Department_ID] [varchar](36) NOT NULL,
	[Hidden] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductCategory_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDepartment]    Script Date: 2022/08/20 11:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDepartment](
	[ProductDepartment_ID] [varchar](36) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Hidden] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductDepartment_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 2022/08/20 11:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[ProductImage_ID] [varchar](36) NOT NULL,
	[Product_ID] [varchar](36) NULL,
	[Order] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSpecification]    Script Date: 2022/08/20 11:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSpecification](
	[ProductSpecification_ID] [varchar](36) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Value] [varchar](100) NOT NULL,
	[Product_ID] [varchar](36) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductSpecification_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReferenceClientRole]    Script Date: 2022/08/20 11:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferenceClientRole](
	[ClientRole_ID] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientRole_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReferenceOrderStatus]    Script Date: 2022/08/20 11:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferenceOrderStatus](
	[OrderStatus_ID] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderStatus_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReferenceReviewStatus]    Script Date: 2022/08/20 11:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferenceReviewStatus](
	[ReviewStatus_ID] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewStatus_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 2022/08/20 11:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[Review_ID] [varchar](36) NOT NULL,
	[Client_ID] [varchar](36) NOT NULL,
	[Product_ID] [varchar](36) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Rating] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Review_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionLog]    Script Date: 2022/08/20 11:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionLog](
	[Transaction_ID] [varchar](36) NOT NULL,
	[Order_ID] [varchar](36) NOT NULL,
	[Amount] [int] NULL,
	[Client_ID] [varchar](36) NOT NULL,
	[RequestDate] [datetime] NOT NULL,
	[CompleteDate] [datetime] NULL,
	[PayRequestID] [varchar](100) NULL,
	[Checksum] [varchar](100) NULL,
	[StatusCode] [varchar](10) NULL,
	[Description] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Transaction_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 2022/08/20 11:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[Wishlist_ID] [varchar](36) NOT NULL,
	[Client_ID] [varchar](36) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Wishlist_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishlistItem]    Script Date: 2022/08/20 11:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishlistItem](
	[WishlistItem_ID] [varchar](36) NOT NULL,
	[Wishlist_ID] [varchar](36) NOT NULL,
	[Product_ID] [varchar](36) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WishlistItem_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [Hidden]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  DEFAULT ((0)) FOR [Hidden]
GO
ALTER TABLE [dbo].[ProductDepartment] ADD  DEFAULT ((0)) FOR [Hidden]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD FOREIGN KEY([Client_ID])
REFERENCES [dbo].[Client] ([Client_ID])
GO
ALTER TABLE [dbo].[ClientRole]  WITH CHECK ADD FOREIGN KEY([Client_ID])
REFERENCES [dbo].[Client] ([Client_ID])
GO
ALTER TABLE [dbo].[ClientRole]  WITH CHECK ADD FOREIGN KEY([Role_ID])
REFERENCES [dbo].[ReferenceClientRole] ([ClientRole_ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([Client_ID])
REFERENCES [dbo].[Client] ([Client_ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Status] FOREIGN KEY([Status])
REFERENCES [dbo].[ReferenceOrderStatus] ([OrderStatus_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Status]
GO
ALTER TABLE [dbo].[OrderProductLink]  WITH CHECK ADD FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Order] ([Order_ID])
GO
ALTER TABLE [dbo].[OrderProductLink]  WITH CHECK ADD FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[PasswordRecovery]  WITH CHECK ADD FOREIGN KEY([Client_ID])
REFERENCES [dbo].[Client] ([Client_ID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([Category_ID])
REFERENCES [dbo].[ProductCategory] ([ProductCategory_ID])
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD FOREIGN KEY([Department_ID])
REFERENCES [dbo].[ProductDepartment] ([ProductDepartment_ID])
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[ProductSpecification]  WITH CHECK ADD FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([Client_ID])
REFERENCES [dbo].[Client] ([Client_ID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[ReferenceReviewStatus] ([ReviewStatus_ID])
GO
ALTER TABLE [dbo].[TransactionLog]  WITH CHECK ADD FOREIGN KEY([Client_ID])
REFERENCES [dbo].[Client] ([Client_ID])
GO
ALTER TABLE [dbo].[TransactionLog]  WITH CHECK ADD FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Order] ([Order_ID])
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([Client_ID])
REFERENCES [dbo].[Client] ([Client_ID])
GO
ALTER TABLE [dbo].[WishlistItem]  WITH CHECK ADD FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[WishlistItem]  WITH CHECK ADD FOREIGN KEY([Wishlist_ID])
REFERENCES [dbo].[Wishlist] ([Wishlist_ID])
GO
ALTER DATABASE [EcommerceDev] SET  READ_WRITE 
GO
