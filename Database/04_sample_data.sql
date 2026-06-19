USE sari_sari_store_db;

-- ============================================
-- SAMPLE PRODUCTS
-- ============================================

INSERT INTO Product
(Name, Unit, CostPrice, SellingPrice, StockQty)
VALUES
('Coke 1.5L', 'bottle', 65.00, 80.00, 20),
('Lucky Me Pancit Canton', 'pack', 10.00, 15.00, 50),
('SkyFlakes', 'pack', 8.00, 12.00, 40),
('Milo Sachet', 'sachet', 7.00, 10.00, 100),
('Candy', 'piece', 1.00, 2.00, 200);

-- ============================================
-- SAMPLE SUPPLIERS
-- ============================================
INSERT INTO Supplier
(Name)
VALUES
('Puregold Supplier'),
('Emilus Store');

-- ============================================
-- SAMPLE CUSTOMERS
-- Used only for utang
-- ============================================
INSERT INTO Customer
(Name)
VALUES
('Dave Abad'),
('Jops');

-- ============================================
-- SAMPLE PURCHASE
-- ============================================
INSERT INTO Purchase
(SupplierID, PurchaseDate, Total)
VALUES
(1, NOW(), 500.00);

INSERT INTO Purchase_Item
(PurchaseID, ProductID, Qty, CostPrice)
VALUES
(1, 1, 5, 65.00),
(1, 1, 20, 10.00);

-- ============================================
-- CASH SALE
-- ============================================
INSERT INTO Sale
(SaleDate, Total)
VALUES
(NOW(), 30.00);

INSERT INTO Sale_Item
(SaleID, ProductID, Qty, Price)
VALUES
(1, 2, 2, 15.00);

INSERT INTO Sale
(SaleDate, Total)
VALUES
(NOW(), 80.00);

INSERT INTO Sale_Item
(SaleID, ProductID, Qty, Price)
VALUES
(2, 1, 1, 80.00);

INSERT INTO Customer_Debt
(CustomerID, SaleID, Amount, DateCreated, DueDate, Status)
VALUES
(1, 2, 80.00, NOW(), CURDATE(), 'Active');
