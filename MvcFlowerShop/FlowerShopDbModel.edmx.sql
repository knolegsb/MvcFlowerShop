
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/20/2016 23:58:32
-- Generated from EDMX file: D:\VisualStudio2015\Projects\MvcFlowerShop\MvcFlowerShop\FlowerShopDbModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [FlowerShopDb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Accounts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Accounts];
GO
IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[Orders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Orders];
GO
IF OBJECT_ID(N'[dbo].[OrdersDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrdersDetails];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Accounts'
CREATE TABLE [dbo].[Accounts] (
    [Username] nvarchar(50)  NOT NULL,
    [Password] nvarchar(50)  NULL,
    [FullName] nvarchar(50)  NULL,
    [Email] nvarchar(50)  NULL,
    [Website] nvarchar(max)  NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [CreationDate] datetime  NOT NULL,
    [Payment] nvarchar(50)  NOT NULL,
    [Status] nvarchar(50)  NOT NULL,
    [Username] nvarchar(50)  NOT NULL,
    [Account_Username] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'OrdersDetails'
CREATE TABLE [dbo].[OrdersDetails] (
    [OrdersId] int  NOT NULL,
    [ProductId] int  NOT NULL,
    [Price] decimal(18,2)  NULL,
    [Quantity] int  NULL,
    [Product_Id] int  NOT NULL,
    [Order_Id] int  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [Id] int  NOT NULL,
    [Name] nvarchar(50)  NULL,
    [Price] decimal(18,2)  NULL,
    [Quantity] int  NULL,
    [Status] nvarchar(50)  NULL,
    [Photo] nvarchar(50)  NULL,
    [Specials] nvarchar(50)  NULL,
    [CategoryId] int  NULL,
    [Category_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Username] in table 'Accounts'
ALTER TABLE [dbo].[Accounts]
ADD CONSTRAINT [PK_Accounts]
    PRIMARY KEY CLUSTERED ([Username] ASC);
GO

-- Creating primary key on [Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [OrdersId], [ProductId] in table 'OrdersDetails'
ALTER TABLE [dbo].[OrdersDetails]
ADD CONSTRAINT [PK_OrdersDetails]
    PRIMARY KEY CLUSTERED ([OrdersId], [ProductId] ASC);
GO

-- Creating primary key on [Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Category_Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_CategoryProduct]
    FOREIGN KEY ([Category_Id])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryProduct'
CREATE INDEX [IX_FK_CategoryProduct]
ON [dbo].[Products]
    ([Category_Id]);
GO

-- Creating foreign key on [Product_Id] in table 'OrdersDetails'
ALTER TABLE [dbo].[OrdersDetails]
ADD CONSTRAINT [FK_ProductOrdersDetail]
    FOREIGN KEY ([Product_Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductOrdersDetail'
CREATE INDEX [IX_FK_ProductOrdersDetail]
ON [dbo].[OrdersDetails]
    ([Product_Id]);
GO

-- Creating foreign key on [Order_Id] in table 'OrdersDetails'
ALTER TABLE [dbo].[OrdersDetails]
ADD CONSTRAINT [FK_OrderOrdersDetail]
    FOREIGN KEY ([Order_Id])
    REFERENCES [dbo].[Orders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderOrdersDetail'
CREATE INDEX [IX_FK_OrderOrdersDetail]
ON [dbo].[OrdersDetails]
    ([Order_Id]);
GO

-- Creating foreign key on [Account_Username] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_AccountOrder]
    FOREIGN KEY ([Account_Username])
    REFERENCES [dbo].[Accounts]
        ([Username])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountOrder'
CREATE INDEX [IX_FK_AccountOrder]
ON [dbo].[Orders]
    ([Account_Username]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------