
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/20/2016 21:57:05
-- Generated from EDMX file: D:\VisualStudio2015\Projects\MvcFlowerShop\MvcFlowerShop\FlowerShopModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [FlowerShop];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [price] decimal(18,0)  NOT NULL,
    [quantity] nvarchar(max)  NOT NULL,
    [status] nvarchar(max)  NOT NULL,
    [photo] nvarchar(max)  NOT NULL,
    [specials] nvarchar(max)  NOT NULL,
    [categoryId] int  NOT NULL,
    [CategoryProduct_Product_Id] int  NOT NULL
);
GO

-- Creating table 'OrdersDetails'
CREATE TABLE [dbo].[OrdersDetails] (
    [ordersId] int IDENTITY(1,1) NOT NULL,
    [productId] int  NOT NULL,
    [price] decimal(18,0)  NOT NULL,
    [quantity] int  NOT NULL,
    [OrdersOrdersDetail_OrdersDetail_Id] int  NOT NULL,
    [ProductOrdersDetail_OrdersDetail_Id] int  NOT NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [creationDate] datetime  NOT NULL,
    [payment] nvarchar(max)  NOT NULL,
    [status] nvarchar(max)  NOT NULL,
    [username] nvarchar(max)  NOT NULL,
    [AccountOrders_Orders_username] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Accounts'
CREATE TABLE [dbo].[Accounts] (
    [username] nvarchar(max)  NOT NULL,
    [password] nvarchar(max)  NOT NULL,
    [fullName] nvarchar(max)  NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [website] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ordersId], [productId] in table 'OrdersDetails'
ALTER TABLE [dbo].[OrdersDetails]
ADD CONSTRAINT [PK_OrdersDetails]
    PRIMARY KEY CLUSTERED ([ordersId], [productId] ASC);
GO

-- Creating primary key on [Id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [username] in table 'Accounts'
ALTER TABLE [dbo].[Accounts]
ADD CONSTRAINT [PK_Accounts]
    PRIMARY KEY CLUSTERED ([username] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [OrdersOrdersDetail_OrdersDetail_Id] in table 'OrdersDetails'
ALTER TABLE [dbo].[OrdersDetails]
ADD CONSTRAINT [FK_OrdersOrdersDetail]
    FOREIGN KEY ([OrdersOrdersDetail_OrdersDetail_Id])
    REFERENCES [dbo].[Orders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrdersOrdersDetail'
CREATE INDEX [IX_FK_OrdersOrdersDetail]
ON [dbo].[OrdersDetails]
    ([OrdersOrdersDetail_OrdersDetail_Id]);
GO

-- Creating foreign key on [ProductOrdersDetail_OrdersDetail_Id] in table 'OrdersDetails'
ALTER TABLE [dbo].[OrdersDetails]
ADD CONSTRAINT [FK_ProductOrdersDetail]
    FOREIGN KEY ([ProductOrdersDetail_OrdersDetail_Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductOrdersDetail'
CREATE INDEX [IX_FK_ProductOrdersDetail]
ON [dbo].[OrdersDetails]
    ([ProductOrdersDetail_OrdersDetail_Id]);
GO

-- Creating foreign key on [CategoryProduct_Product_Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_CategoryProduct]
    FOREIGN KEY ([CategoryProduct_Product_Id])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryProduct'
CREATE INDEX [IX_FK_CategoryProduct]
ON [dbo].[Products]
    ([CategoryProduct_Product_Id]);
GO

-- Creating foreign key on [AccountOrders_Orders_username] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_AccountOrders]
    FOREIGN KEY ([AccountOrders_Orders_username])
    REFERENCES [dbo].[Accounts]
        ([username])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountOrders'
CREATE INDEX [IX_FK_AccountOrders]
ON [dbo].[Orders]
    ([AccountOrders_Orders_username]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------