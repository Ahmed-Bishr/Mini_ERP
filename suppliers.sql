CREATE TABLE suppliers (
    supplier_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    address VARCHAR(255)
);


INSERT INTO suppliers (name, address) VALUES
('TechSource Egypt', 'Alexandria, Egypt'),
('Nile Distribution', 'Cairo, Egypt'),
('Cairo IT Supply', 'Nasr City, Cairo'),
('Delta Electronics', 'Tanta, Egypt');