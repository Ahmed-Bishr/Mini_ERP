CREATE TABLE employees (
    employee_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    branch_id INT NOT NULL,
    role_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100),
    salary DECIMAL(12,2) NOT NULL DEFAULT 0,
    phone VARCHAR(30),
    hire_date DATE,
    password VARCHAR(255) NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'Active',

    CONSTRAINT CK_employees_salary CHECK (salary >= 0),

    CONSTRAINT FK_employees_branches
        FOREIGN KEY (branch_id) REFERENCES branches(branch_id),

    CONSTRAINT FK_employees_roles
        FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

INSERT INTO employees
(branch_id, role_id, name, job_title, salary, phone, hire_date, password, status)
VALUES
(1, 1, 'Ahmed Hossam', 'System Administrator', 18000, '01010000001', '2024-01-15', 'Pass@123', 'Active'),
(1, 2, 'Sara Ali', 'Branch Manager', 22000, '01010000002', '2023-06-10', 'Sara@123', 'Active'),
(1, 3, 'Omar Khaled', 'Cashier', 11000, '01010000003', '2025-02-01', 'Omar@123', 'Active'),
(1, 4, 'Mostafa Adel', 'Warehouse Keeper', 12000, '01010000004', '2024-09-20', 'Mostafa@123', 'Active'),
(2, 2, 'Mona Samir', 'Branch Manager', 23000, '01010000005', '2022-11-01', 'Mona@123', 'Active'),
(2, 3, 'Youssef Tarek', 'Cashier', 11500, '01010000006', '2025-03-12', 'Youssef@123', 'Active'),
(3, 3, 'Karim Nabil', 'Cashier', 11000, '01010000007', '2025-05-05', 'Karim@123', 'Active'),
(2, 4, 'Hassan Fathy', 'Warehouse Keeper', 12500, '01010000008', '2024-08-18', 'Hassan@123', 'Active');