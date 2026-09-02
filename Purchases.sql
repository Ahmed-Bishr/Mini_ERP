CREATE TABLE purchases (
    purchase_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    supplier_id INT NOT NULL,
    warehouse_id INT NOT NULL,
    employee_id INT NOT NULL,
    discount DECIMAL(12,2) NOT NULL DEFAULT 0,
    total DECIMAL(12,2) NOT NULL DEFAULT 0,
    payment_method VARCHAR(50) NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'Completed',

    CONSTRAINT CK_purchases_discount CHECK (discount >= 0),
    CONSTRAINT CK_purchases_total CHECK (total >= 0),

    CONSTRAINT FK_purchases_suppliers
        FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),

    CONSTRAINT FK_purchases_warehouses
        FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),

    CONSTRAINT FK_purchases_employees
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO purchases
(supplier_id, warehouse_id, employee_id, discount, total, payment_method, status)
VALUES
(1, 1, 4, 1000, 146000, 'Bank Transfer', 'Completed'),
(2, 3, 8, 500, 74500, 'Cash', 'Completed'),
(3, 5, 8, 300, 29700, 'Bank Transfer', 'Completed');