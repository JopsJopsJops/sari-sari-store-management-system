USE sari_sari_store_db;

-- ============================================
-- VIEW 1: ACTIVE CUSTOMER DEBTS
-- Dashboard widget:
-- "Customers with unpaid utang"
-- ============================================
DROP VIEW IF EXISTS vw_active_customer_debt;

CREATE VIEW vw_active_customer_debt AS
    SELECT 
        cd.DebtID,
        c.Name AS CustomerName,
        cd.Amount,
        cd.DateCreated,
        cd.DueDate,
        cd.Status
    FROM
        Customer_Debt cd
            JOIN
        Customer c ON cd.CustomerID = c.CustomerID
    WHERE
        cd.Status = 'Active';

-- ============================================
-- INVENTORY STATUS
-- ============================================
DROP VIEW IF EXISTS vw_inventory_status;

CREATE VIEW vw_inventory_status AS
    SELECT 
        ProductID,
        Name,
        Unit,
        SellingPrice,
        StockQty,
        CASE
            WHEN StockQty <= 10 THEN 'LOW STOCK'
            ELSE 'OK'
        END AS StockStatus
    FROM
        Product;

-- ============================================
-- SALES SUMMARY
-- ============================================
DROP VIEW IF EXISTS vw_sales_summary;

CREATE VIEW vw_sales_summary AS
    SELECT 
        SaleID, SaleDate, Total
    FROM
        Sale;

-- ============================================
-- SALE DETAILS REPORT
-- ============================================
DROP VIEW IF EXISTS vw_sale_details;

CREATE VIEW vw_sale_details AS
    SELECT 
        s.SaleID,
        s.SaleDate,
        p.Name AS ProductName,
        si.Qty,
        si.Price,
        (si.Qty * si.Price) AS SubTotal
    FROM
        Sale s
            JOIN
        Sale_Item si ON s.SaleID = si.SaleID
            JOIN
        Product p ON si.ProductID = p.ProductID;

-- ============================================
-- PROFIT REPORT
-- ============================================
DROP VIEW IF EXISTS vw_profit_report;

CREATE VIEW vw_profit_report AS
    SELECT 
        p.Name AS ProductName,
        SUM(si.Qty) AS TotalSold,
        SUM((si.Price - p.CostPrice) * si.Qty) AS EstimatedProfit
    FROM
        Sale_Item si
            JOIN
        Product p ON si.ProductID = p.ProductID
    GROUP BY p.Name;