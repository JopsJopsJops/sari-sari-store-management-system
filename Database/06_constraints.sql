USE sari_sari_store_db;

-- ============================================
-- DATA INTEGRITY CONSTRAINTS
-- Prevent duplicate master records
-- ============================================

-- Prevent duplicate products
ALTER TABLE Product
ADD CONSTRAINT unique_product_name UNIQUE(Name);

-- Prevent duplicate customers
-- Customer records are only used for utang tracking
ALTER TABLE Customer
ADD CONSTRAINT unique_customer_name UNIQUE(Name);

-- Prevent duplicate suppliers
ALTER TABLE Supplier
ADD CONSTRAINT unique_supplier_name UNIQUE(Name);
