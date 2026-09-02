CREATE TABLE cash_transactions (
    cash_transaction_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cash_register_id INT NOT NULL,
    employee_id INT NOT NULL,
    "type" VARCHAR(50) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    balance_before DECIMAL(12,2) NOT NULL,
    balance_after DECIMAL(12,2) NOT NULL,
    description VARCHAR(500),
    reference_id INT,
    reference_type VARCHAR(50),

    CONSTRAINT CK_cash_transactions_amount CHECK (amount > 0),

    CONSTRAINT FK_cash_transactions_cash_registers
        FOREIGN KEY (cash_register_id) REFERENCES cash_registers(cash_register_id),

    CONSTRAINT FK_cash_transactions_employees
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO cash_transactions
(cash_register_id, employee_id, "type", amount, balance_before, balance_after, description, reference_id, reference_type)
VALUES
(1, 3, 'IN', 26500, 10000, 36500, 'Sale payment', 1, 'SALE'),
(1, 2, 'OUT', 3500, 36500, 33000, 'Electricity expense', 1, 'EXPENSE'),
(3, 6, 'IN', 13500, 15000, 28500, 'Sale payment', 2, 'SALE'),
(4, 7, 'IN', 7500, 5000, 12500, 'Sale payment', 3, 'SALE'),
(1, 3, 'OUT', 400, 33000, 32600, 'Customer return refund', 1, 'RETURN');