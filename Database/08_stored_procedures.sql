USE sari_sari_store_db;

-- =====================================================
-- STORED PROCEDURES
-- Handles common business operations
-- =====================================================
DROP PROCEDURE IF EXISTS CreateCashSale;

DELIMITER //

CREATE PROCEDURE CreateCashSale(
	IN p_total DECIMAL(10,2)
)
BEGIN
	INSERT INTO Sale(SaleDate, Total)
    VALUES(Now(), p_Total);
    
END //

DELIMITER ;


DROP PROCEDURE IF EXISTS CreateUtangSale;

DELIMITER //

CREATE PROCEDURE CreateUtangSale(
	IN p_customer_id INT,
    IN p_total DECIMAL(10,2)
)
BEGIN
	DECLARE new_sale_id INT;
    
    -- Create sale first
    INSERT INTO Sale(SaleDate, Total)
    VALUES(NOW(), p_total);
    
    SET new_sale_id = LAST_INSERT_ID();
    
    -- Create debt automatically
    INSERT INTO Customer_Debt(
		CustomerID,
        SaleID,
        Amount,
        DateCreated,
        DueDate,
        Status
	)
    VALUES(
		p_customer_id,
        new_sale_id,
        p_total,
        NOW(),
        CURDATE(),
        'Active'
	);
END //

DELIMITER ;


DROP PROCEDURE IF EXISTS CheckCustomerDebt;

DELIMITER //

CREATE PROCEDURE CheckCustomerDebt(
	IN p_customer_id INT
)
BEGIN

SELECT
	Customer.Name,
    Customer_Debt.Amount,
    Customer_Debt.Status
    
FROM customer
JOIN Customer_Debt ON Customer.CustomerID = Customer.Debt.CustomerID
    
WHERE Customer.CustomerID = p_customer_id
AND Status = 'Active';

END //

DELIMITER ;


DROP PROCEDURE IF EXISTS PayCustomerDebt;

DELIMITER //

CREATE PROCEDURE PayCustomerDebt(
	IN p_debt_id INT
)
BEGIN

UPDATE Customer_Debt
SET Status = 'Paid'
WHERE DebtID = p_debt_id;

END //

DELIMITER ;


DROP PROCEDURE IF EXISTS CreatePurchase;

DELIMITER //

CREATE PROCEDURE CreatePurchase(
	IN p_supplier_id INT,
    IN p_total DECIMAL(10,2)
)
BEGIN

INSERT INTO Purchase(
	SupplierID,
    PurchaseDate,
    Total
)
VALUES(
	p_supplier_id,
    NOW(),
    p_total
);

END //

DELIMITER ;

