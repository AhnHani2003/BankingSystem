use master
create database BANK
on primary
/****** Object:  Database [BANK]*/
GO
USE [BANK]
GO
/****** Object:  Table account*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE account(
	[accountid] [int] IDENTITY(10000000,1) NOT NULL,
	[customerid] [int] NOT NULL,
	[password] [varchar](50) NOT NULL,
	[money] [float] NOT NULL,
	[loan] [float](50) NULL,
	[saving] [float] NULL,
	[notiID] [int] NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[customerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table customer*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE customer(
	[customerid] [int] NOT NULL,
	[accountid] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[phone] [varchar] (20) NOT NULL,
	[email] [varchar] (100) NULL,
	[birthday] [date] NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[customerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE account
ADD CONSTRAINT FK_acount_customerid FOREIGN KEY (customerid) REFERENCES customer (customerid);

ALTER TABLE customer
ADD CONSTRAINT FK_customer_acountid FOREIGN KEY (acountid) REFERENCES acount (customerid);


ALTER DATABASE [BANK] SET  READ_WRITE
GO
