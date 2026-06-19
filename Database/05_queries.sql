USE sari_sari_store_db;

-- ============================================
-- 1. VIEW ALL PRODUCTS / INVENTORY
-- Used for inventory screen
-- ============================================
SELECT 
    ProductID, Name, Unit, SellingPrice, StockQty
FROM
    Product;

-- ============================================
-- LOW STOCK PRODUCTS
-- ============================================
SELECT 
    Name, StockQty
FROM
    Product
WHERE
    StockQty <= 10;

-- ============================================
-- TODAY SALES
-- ============================================
SELECT 
    SUM(Total) AS TodaySales
FROM
    Sale
WHERE
    DATE(SaleDate) = CURDATE();

-- ============================================
-- SALES HISTORY
-- ============================================
SELECT 
    SaleID, SaleDate, Total
FROM
    sale
ORDER BY SaleDate DESC;

-- ============================================
-- SALE DETAILS
-- ============================================
SELECT 
    s.SaleID,
    s.SaleDate,
    p.Name AS Product,
    si.Qty,
    si.Price,
    (si.Qty * si.Price) AS Subtotal
FROM
    Sale s
        JOIN
    Sale_Item si ON s.SaleID = si.SaleID
        JOIN
    Product p ON si.ProductID = p.ProductID
WHERE
    s.SaleID = 1;

-- ============================================
-- ACTIVE CUSTOMER DEBTS
-- ============================================
SELECT 
    c.Name, cd.Amount, cd.DateCreated, cd.DueDate
FROM
    Customer_Debt cd
        JOIN
    Customer c ON cd.CustomerID = c.CustomerID
WHERE
    cd.Status = 'Active';

-- ============================================
-- CHECK CUSTOMER DEBT STATUS
-- ============================================
SELECT 
    COUNT(*) AS ActiveDebt
FROM
    Customer_Debt
WHERE
    CustomerID = 1 AND Status = 'Active';

-- ============================================
-- SETTLE CUSTOMER DEBT
-- ============================================
UPDATE Customer_Debt 
SET 
    Status = 'Paid'
WHERE
    DebtID = 1;

-- ============================================
-- PURCHASE HISTORY
-- ============================================
SELECT 
    p.PurchaseID, s.Name AS Supplier, p.PurchaseDate, p.Total
FROM
    Purchase p
        JOIN
    Supplier s ON p.SupplierID = s.SupplierID;

-- ============================================
-- SALES PROFIT
-- ============================================
SELECT 
    p.Name,
    SUM(si.Qty) AS TotalSold,
    SUM((si.Price - p.CostPrice) * si.Qty) AS EstimatedProfit
FROM
    Sale_Item si
        JOIN
    Product p ON si.ProductID = p.ProductID
GROUP BY p.Name;

-- ============================================
-- EXPENSE SUMMARY
-- ============================================
SELECT 
    ExpenseType, SUM(Amount) AS TotalExpense
FROM
    Operating_Expense
GROUP BY ExpenseType;
    