CREATE TABLE stock_transfers (
    stock_transfer_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    from_warehouse_id INT NOT NULL,
    to_warehouse_id INT NOT NULL,
    employee_id INT NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'Pending',

    CONSTRAINT CK_stock_transfers_different_warehouses
        CHECK (from_warehouse_id <> to_warehouse_id),

    CONSTRAINT FK_stock_transfers_from_warehouse
        FOREIGN KEY (from_warehouse_id) REFERENCES warehouses(warehouse_id),

    CONSTRAINT FK_stock_transfers_to_warehouse
        FOREIGN KEY (to_warehouse_id) REFERENCES warehouses(warehouse_id),

    CONSTRAINT FK_stock_transfers_employees
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO stock_transfers
(from_warehouse_id, to_warehouse_id, employee_id, status)
VALUES
(1, 3, 4, 'Completed'),
(3, 5, 8, 'Completed');