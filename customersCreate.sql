CREATE TABLE customers (
    customer_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(30)
);

INSERT INTO customers (name, phone) VALUES
('Mohamed Salah', '01020000001'),
('Nour Ahmed', '01020000002'),
('Mahmoud Ibrahim', '01020000003'),
('Aya Mostafa', '01020000004'),
('Hany Samir', '01020000005'),
('Mariam Adel', '01020000006');