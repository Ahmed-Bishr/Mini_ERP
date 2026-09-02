CREATE TABLE sales (
    sale_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    branch_id INT NOT NULL,
    employee_id INT NOT NULL,
    customer_id INT NULL,
    cash_register_id INT NOT NULL,
    discount DECIMAL(12,2) NOT NULL DEFAULT 0,
    tax DECIMAL(12,2) NOT NULL DEFAULT 0,
    total DECIMAL(12,2) NOT NULL DEFAULT 0,
    payment_method VARCHAR(50) NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'Completed',

    CONSTRAINT CK_sales_discount CHECK (discount >= 0),
    CONSTRAINT CK_sales_tax CHECK (tax >= 0),
    CONSTRAINT CK_sales_total CHECK (total >= 0),

    CONSTRAINT FK_sales_branches
        FOREIGN KEY (branch_id) REFERENCES branches(branch_id),

    CONSTRAINT FK_sales_employees
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id),

    CONSTRAINT FK_sales_customers
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id),

    CONSTRAINT FK_sales_cash_registers
        FOREIGN KEY (cash_register_id) REFERENCES cash_registers(cash_register_id)
);

INSERT INTO sales
(branch_id, employee_id, customer_id, cash_register_id, discount, tax, total, payment_method, status)
VALUES
(1, 3, 1, 1, 300, 0, 26500, 'Cash', 'Completed'),
(2, 6, 2, 3, 450, 0, 13500, 'Card', 'Completed'),
(3, 7, 3, 4, 100, 0, 7500, 'Cash', 'Completed'),
(1, 3, 4, 1, 0, 0, 10000, 'Card', 'Completed');