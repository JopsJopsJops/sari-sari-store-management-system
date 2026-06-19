USE sari_sari_store_db;

-- =============================================
-- TRIGGERS
-- Automatically enforce system rules
-- =============================================

DROP TRIGGER IF EXISTS before_create_debt;

DELIMITER //

CREATE TRIGGER before_create_debt
BEFORE INSERT ON Customer_Debt
FOR EACH ROW
BEGIN

	DECLARE debt_count INT;
    
    SELECT COUNT(*)
    INTO debt_count
    FROM Customer_Debt
    WHERE CustomerID = NEW.CustomerID
    AND Status = 'Active';
    
    IF debt_count > 0 THEN
    
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'Customer still has unpaid debt';
        
	END IF;
    
END //

DELIMITER ;


DROP TRIGGER IF EXISTS after_sale_item_insert;

DELIMITER //

CREATE TRIGGER after_sale_item_insert
AFTER INSERT ON Sale_Item
FOR EACH ROW
BEGIN

UPDATE Product
SET StockQty = StockQty - NEW.Qty

WHERE ProductID = NEW.ProductID;

END //

DELIMITER ;


DROP TRIGGER IF EXISTS after_purchase_item_insert;

DELIMITER //

CREATE TRIGGER after_purchase_item_insert
AFTER INSERT ON Purchase_Item
FOR EACH ROW
BEGIN

UPDATE Product
SET StockQty = StockQty + NEW.Qty

WHERE ProductID = NEW.ProductID;

END //

DELIMITER ;


DROP TRIGGER IF EXISTS before_debt_status;

DELIMITER //

CREATE TRIGGER before_debt_status
BEFORE INSERT ON Customer_Debt
FOR EACH ROW
BEGIN

IF NEW.Status IS NULL THEN
SET NEW.Status = 'Active';

END IF;

END //

DELIMITER ;

DROP TRIGGER IF EXISTS before_sale_item_insert;

DELIMITER //

CREATE TRIGGER before_sale_item_insert
BEFORE INSERT ON Sale_Item
FOR EACH ROW
BEGIN
	DECLARE current_stock INT;
    
    SELECT StockQty
    INTO current_stock
    FROM Product
    WHERE ProductID = NEW.ProductID;
    
    IF current_stock < NEW.Qty THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 
        'Insufficient stock available';
        
	END IF;
    
END //
DELIMITER ;

