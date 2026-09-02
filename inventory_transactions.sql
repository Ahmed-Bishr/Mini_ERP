CREATE TABLE inventory_transactions (
    inventory_transaction_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    warehouse_id INT NOT NULL,
    product_id INT NOT NULL,
    employee_id INT NOT NULL,
    "type" VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    quantity_before INT NOT NULL,
    quantity_after INT NOT NULL,
    notes VARCHAR(500),

    CONSTRAINT CK_inventory_transactions_quantity CHECK (quantity > 0),
    CONSTRAINT CK_inventory_transactions_before CHECK (quantity_before >= 0),
    CONSTRAINT CK_inventory_transactions_after CHECK (quantity_after >= 0),

    CONSTRAINT FK_inventory_transactions_warehouses
        FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),

    CONSTRAINT FK_inventory_transactions_products
        FOREIGN KEY (product_id) REFERENCES products(product_id),

    CONSTRAINT FK_inventory_transactions_employees
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO inventory_transactions
(warehouse_id, product_id, employee_id, "type", quantity, quantity_before, quantity_after, notes)
VALUES
(1, 1, 4, 'PURCHASE_IN', 5, 7, 12, 'Purchase #1'),
(1, 2, 4, 'PURCHASE_IN', 100, 0, 100, 'Purchase #1'),
(1, 1, 4, 'SALE_OUT', 1, 13, 12, 'Sale #1'),
(1, 2, 4, 'SALE_OUT', 2, 82, 80, 'Sale #1'),
(3, 5, 8, 'SALE_OUT', 2, 27, 25, 'Sale #2'),
(3, 7, 8, 'SALE_OUT', 2, 32, 30, 'Sale #3'),
(1, 2, 4, 'RETURN_IN', 1, 79, 80, 'Return #1');