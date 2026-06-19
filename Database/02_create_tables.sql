-- ============================================
-- Sari-Sari Store Management System
-- Core Master Tables
-- Author: Jophet
-- ============================================

USE sari_sari_store_db;

-- Stores products available for sale and inventory tracking
CREATE TABLE Product (
	ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Unit VARCHAR(20),
    CostPrice DECIMAL(10,2) NOT NULL,
    SellingPrice DECIMAL(10,2) NOT NULL,
    StockQty INT NOT NULL
);

-- Store supplier information for inventory purchases
CREATE TABLE Supplier (
	SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

-- Stores customers used only for utang tracking
CREATE TABLE Customer (
	CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

-- Stores operating expenses such as electricty, water, rent, and transportation
CREATE TABLE Operating_expense (
	ExpenseID INT AUTO_INCREMENT PRIMARY KEY,
    Amount DECIMAL(10,2) NOT NULL,
    Date DATETIME NOT NULL,
    ExpenseType VARCHAR(50) NOT NULL
);