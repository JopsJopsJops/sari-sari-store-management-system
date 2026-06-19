# Sari-Sari Store Management System

## Overview

A database-driven management system for small sari-sari stores.

The system helps store owners track:

- Sales
- Inventory
- Purchases
- Suppliers
- Customer debts (utang)
- Expenses

## Technologies

- MySQL
- MySQL Workbench

## Features

### Sales
- Create cash sales
- Create utang sales
- Automatic inventory deduction

### Inventory
- Track stock
- Restocking
- Inventory adjustments

### Debt Management
- Record customer debt
- Prevent multiple active debts
- Full payment only

## Database Design

Entities:

- Product
- Sale
- Sale Item
- Purchase
- Purchase Item
- Supplier
- Customer
- Customer Debt
- Operating Expense

## Business Rules

- Customers can only have one active debt
- Partial debt payment is not allowed
- Stock cannot go below zero
- Debt is automatically created from utang sales

## Design Decisions

### Customer Table

Customer information is only stored for utang tracking.

Reason:
Small sari-sari stores usually know their customers personally.
Customer analytics and loyalty features are outside project scope.


### Receipt Printing

Excluded.

Reason:
Target users usually do not use printed receipts.
Transaction history acts as the audit record.