-- TC-001 Cash Sale Creation
-- Create test product
INSERT INTO Product
(
    Name,
    Unit,
    CostPrice,
    SellingPrice,
    StockQty
)
VALUES
(
    'Coke',
    'Bottle',
    15,
    20,
    100
);

-- Create Sale
INSERT INTO Sale
(
    SaleDate,
    Total
)
VALUES
(
    NOW(),
    20
);

-- Create Sale Item
INSERT INTO Sale_Item
(
    SaleID,
    ProductID,
    Qty,
    Price
)
VALUES
(
    1,
    1,
    1,
    20
);

-- TC-002 Utang Sale Creation
INSERT INTO Customer(Name)
VALUES
(
    'Tony Stark'
);

-- Create Sale
INSERT INTO Sale
	(
		SaleDate,
		Total
	)
	VALUES
	(
		NOW(),
		100
	);

-- Create Debt
INSERT INTO Customer_Debt
(
    CustomerID,
    SaleID,
    Amount,
    DateCreated,
    DueDate,
    Status
)
VALUES
(
    3,
    2,
    100,
    NOW(),
    CURDATE(),
    'Active'
);

-- TC-003 Prevent Multiple Active Debts
INSERT INTO Customer_Debt
(
    CustomerID,
    SaleID,
    Amount,
    DateCreated,
    DueDate,
    Status
)
VALUES
(
    3,
    2,
    50,
    NOW(),
    CURDATE(),
    'Active'
);

-- TC-004 Full Debt Payment
UPDATE Customer_Debt
SET Status = 'Paid'
WHERE DebtID = 2;

-- TC-005 New Debt After Payment
INSERT INTO Customer_Debt
(
    CustomerID,
    SaleID,
    Amount,
    DateCreated,
    DueDate,
    Status
)
VALUES
(
    3,
    2,
    200,
    NOW(),
    CURDATE(),
    'Active'
);

-- TC-006 Purchase Restocking
-- Create Supplier
INSERT INTO Supplier(Name)
VALUES
(
	'Pepsi Distributor'
);

-- Create Purchase
INSERT INTO Purchase
(
	SupplierID,
    PurchaseDate,
    Total
)
VALUES
(
	3,
    NOW(),
    300
);

-- Add Purchase Item
INSERT INTO Purchase_Item
(
    PurchaseID,
    ProductID,
    Qty,
    CostPrice
)
VALUES
(
    1,
    1,
    50,
    750
);

-- TC-007 Prevent Negative Inventory
INSERT INTO Sale_Item
(
	SaleID,
    ProductID,
    Qty,
    Price
)
VALUES
(
	1,
    1,
    1000,
    20
);

