USE sari_sari_store_db;

-- ============================================
-- SALE
-- Stores completed cash and utang sales
-- ============================================
CREATE TABLE Sale (
	SaleID INT AUTO_INCREMENT PRIMARY KEY,
    SaleDate DATETIME NOT NULL,
    Total DECIMAL(10,2) NOT NULL
);

-- ============================================
-- SALE ITEM
-- Stores products included in a sale
-- ============================================
CREATE TABLE Sale_Item (
	SaleItemID INT AUTO_INCREMENT PRIMARY KEY,
    SaleID INT NOT NULL,
    ProductID INT NOT NULL,
    Qty INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    
    FOREIGN KEY (SaleID) REFERENCES Sale(SaleID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- ============================================
-- PURCHASE
-- Stores inventory purchases from suppliers
-- ============================================
CREATE TABLE Purchase (
	PurchaseID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierID INT NOT NULL,
    PurchaseDate DATETIME NOT NULL,
    Total DECIMAL(10,2) NOT NULL,
    
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

-- ============================================
-- PURCHASE ITEM
-- Stores products included in a purchase
-- ============================================
CREATE TABLE Purchase_Item (
	PurchaseItemID INT AUTO_INCREMENT PRIMARY KEY,
    PurchaseID INT NOT NULL,
    ProductID INT NOT NULL,
    Qty INT NOT NULL,
    CostPrice DECIMAL(10,2) NOT NULL,
    
    FOREIGN KEY (PurchaseID) REFERENCES Purchase(PurchaseID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- ============================================
-- CUSTOMER DEBT
-- Stores utang records
-- ============================================
CREATE TABLE Customer_Debt (
	DebtID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    SaleID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    DateCreated DATETIME NOT NULL,
    DueDate DATE,
    Status ENUM('Active','Paid') NOT NULL,
    
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (SaleID) REFERENCES Sale(SaleID)
);