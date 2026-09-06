CREATE TABLE cash_registers (
    cash_register_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    branch_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'Active',

    CONSTRAINT UQ_cash_registers_branch_name UNIQUE (branch_id, name),

    CONSTRAINT FK_cash_registers_branches
        FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

INSERT INTO cash_registers (branch_id, name, status) VALUES
(1, 'Alex Main Cash', 'Active'),
(1, 'Alex Cash 2', 'Active'),
(2, 'Cairo Main Cash', 'Active'),
(3, 'Giza Main Cash', 'Active');

ALTER TABLE cash_registers
    DROP CONSTRAINT FK_cash_registers_branches,
    ADD CONSTRAINT FK_cash_registers_branches
        FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE;