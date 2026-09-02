CREATE TABLE expenses (
    expense_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    branch_id INT NOT NULL,
    cash_register_id INT NOT NULL,
    employee_id INT NOT NULL,
    category VARCHAR(100) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    description VARCHAR(500),

    CONSTRAINT CK_expenses_amount CHECK (amount > 0),

    CONSTRAINT FK_expenses_branches
        FOREIGN KEY (branch_id) REFERENCES branches(branch_id),

    CONSTRAINT FK_expenses_cash_registers
        FOREIGN KEY (cash_register_id) REFERENCES cash_registers(cash_register_id),

    CONSTRAINT FK_expenses_employees
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO expenses
(branch_id, cash_register_id, employee_id, category, amount, description)
VALUES
(1, 1, 2, 'Electricity', 3500, 'Monthly electricity bill'),
(1, 1, 2, 'Maintenance', 1200, 'Printer maintenance'),
(2, 3, 5, 'Internet', 1800, 'Business internet subscription'),
(3, 4, 7, 'Office Supplies', 950, 'Paper and office supplies');