CREATE TABLE returns (
    return_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    sale_id INT NOT NULL,
    employee_id INT NOT NULL,
    reason VARCHAR(500),
    total DECIMAL(12,2) NOT NULL DEFAULT 0,
    status VARCHAR(30) NOT NULL DEFAULT 'Completed',

    CONSTRAINT CK_returns_total CHECK (total >= 0),

    CONSTRAINT FK_returns_sales
        FOREIGN KEY (sale_id) REFERENCES sales(sale_id),

    CONSTRAINT FK_returns_employees
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO returns
(sale_id, employee_id, reason, total, status)
VALUES
(1, 3, 'Customer returned one mouse', 400, 'Completed'),
(4, 3, 'Receipt printer was defective', 4200, 'Completed');