USE [master]
GO
/****** Object:  Database [ECommerce]    Script Date: 4/20/2024 3:49:55 PM ******/
CREATE DATABASE [ECommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECommerce', FILENAME = N'D:\Softwares\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ECommerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ECommerce_log', FILENAME = N'D:\Softwares\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ECommerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ECommerce] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ECommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECommerce] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ECommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECommerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ECommerce] SET  MULTI_USER 
GO
ALTER DATABASE [ECommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECommerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ECommerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ECommerce] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ECommerce] SET QUERY_STORE = ON
GO
ALTER DATABASE [ECommerce] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ECommerce]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 4/20/2024 3:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[UserId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/20/2024 3:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
	[CategoryImageUrl] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 4/20/2024 3:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Subject] [nvarchar](200) NULL,
	[Message] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/20/2024 3:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [nvarchar](max) NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[UserId] [int] NOT NULL,
	[Status] [nvarchar](50) NULL,
	[PaymentId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[IsCancel] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 4/20/2024 3:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CardNo] [nvarchar](50) NULL,
	[ExpiryDate] [nvarchar](50) NULL,
	[CvvNo] [int] NULL,
	[Address] [nvarchar](max) NULL,
	[PaymentMode] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/20/2024 3:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[ShortDescription] [nvarchar](200) NULL,
	[LongDescription] [nvarchar](max) NULL,
	[AdditionalDescription] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Size] [nvarchar](30) NULL,
	[Color] [nvarchar](50) NOT NULL,
	[CompanyName] [nvarchar](100) NULL,
	[CategoryId] [int] NOT NULL,
	[SubCategoryId] [int] NOT NULL,
	[Sold] [int] NULL,
	[IsCustomized] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 4/20/2024 3:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[ProductId] [int] NOT NULL,
	[DefaultImage] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductReview]    Script Date: 4/20/2024 3:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductReview](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/20/2024 3:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 4/20/2024 3:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryName] [nvarchar](100) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/20/2024 3:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[PostCode] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[RoleId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 4/20/2024 3:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[WishlistId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WishlistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryImageUrl], [IsActive], [CreatedDate]) VALUES (3, N'Jeans', N'Images/Category/fd054159-e19a-4e39-b312-27ad367fdfc2.jpg', 1, CAST(N'2024-04-20T15:43:08.483' AS DateTime))
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'Customer')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E4675D9579]    Script Date: 4/20/2024 3:49:55 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [IsCancel]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([PaymentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductReview]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductReview]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[Category_Crud]    Script Date: 4/20/2024 3:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Category_Crud]
	-- Add the parameters for the stored procedure here
	@Action NVARCHAR(15),
	@CategoryId INT = NULL,
	@CategoryName NVARCHAR(100) = NULL,
	@CategoryImageUrl NVARCHAR(MAX) = NULL,
	@IsActive BIT = FALSE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Get All Category
	IF(@Action = 'GETALL')
	BEGIN
		SELECT * FROM Category
	END

	-- Insert Category
	IF(@Action = 'INSERT')
	BEGIN
		INSERT INTO Category (CategoryName, CategoryImageUrl, IsActive, CreatedDate)
		VALUES(@CategoryName, @CategoryImageUrl, @IsActive, GETDATE())
	END

	-- Update Category
	IF(@Action = 'UPDATE')
	BEGIN
		DECLARE @UPDATE_IMAGE NVARCHAR(20)
		SELECT @UPDATE_IMAGE = (CASE WHEN @CategoryImageUrl IS NULL THEN 'NO' ELSE 'YES' END)
		IF(@UPDATE_IMAGE = 'NO')
			BEGIN
				UPDATE Category
				SET CategoryName = @CategoryName, IsActive = @IsActive
				WHERE CategoryId = @CategoryId
			END
		ElSE
			BEGIN
				UPDATE Category
				SET CategoryName = @CategoryName, CategoryImageUrl = @CategoryImageUrl, IsActive = @IsActive
				WHERE CategoryId = @CategoryId
			END
	END

	-- Delete Category
	IF(@Action = 'DELETE')
	BEGIN
		DELETE FROM Category WHERE CategoryId = @CategoryId
	END

	--Get Active Category By CategoryId
	IF(@Action = 'ACTIVECATEGORY')
	BEGIN
		SELECT * FROM Category c 
		WHERE c.IsActive = 1 ORDER BY c.CategoryName

	END

END
GO
USE [master]
GO
ALTER DATABASE [ECommerce] SET  READ_WRITE 
GO
