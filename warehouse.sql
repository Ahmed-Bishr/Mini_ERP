CREATE TABLE warehouses (
    warehouse_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    branch_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    status VARCHAR(30) NOT NULL DEFAULT 'Active',

    CONSTRAINT UQ_warehouses_branch_name UNIQUE (branch_id, name),

    CONSTRAINT FK_warehouses_branches
        FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);



INSERT INTO warehouses (branch_id, name, address, status) VALUES
(1, 'Alex Main Warehouse', 'Borg El Arab, Alexandria', 'Active'),
(1, 'Alex Backup Warehouse', 'Amreya, Alexandria', 'Active'),
(2, 'Cairo Main Warehouse', 'Obour City, Cairo', 'Active'),
(2, 'Cairo Secondary Warehouse', 'Nasr City, Cairo', 'Active'),
(3, 'Giza Main Warehouse', '6th of October, Giza', 'Active');