USE sari_sari_store_db;

-- Suppliers
INSERT INTO Supplier (Name)
VALUES
('Cola-cola Distributor'),
('Nestle Distributor');

-- Products
INSERT INTO Product
(Name, Unit, CostPrice, SellingPrice, StockQty)
VALUES
('Coke 500ml', 'Bottle', 18.00, 25.00, 100),
('Lucky Me Pancit Canton', 'Pack', 12.00, 18.00, 50),
('Cloud 9', 'Piece', 5.00, 10.00, 200);

-- Customers
INSERT INTO Customer (Name)
VALUES
('Dandave Abad'),
('Jops');

-- Expenses
INSERT INTO Operating_Expense
(Amount, ExpenseDate, ExpenseType)
VALUES
(2500.00, NOW(), 'Electricity');