CREATE TABLE products (
    product_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    category VARCHAR(100),
    barcode VARCHAR(100) NOT NULL UNIQUE,
    purchase_price DECIMAL(12,2) NOT NULL DEFAULT 0,
    selling_price DECIMAL(12,2) NOT NULL DEFAULT 0,

    CONSTRAINT CK_products_purchase_price CHECK (purchase_price >= 0),
    CONSTRAINT CK_products_selling_price CHECK (selling_price >= 0)
);


INSERT INTO products
(name, category, barcode, purchase_price, selling_price)
VALUES
('Laptop Lenovo V15', 'Computers', '100000001', 23000, 26000),
('Wireless Mouse', 'Accessories', '100000002', 250, 400),
('Mechanical Keyboard', 'Accessories', '100000003', 650, 950),
('Laser Printer', 'Printers', '100000004', 4500, 5800),
('24 Inch Monitor', 'Monitors', '100000005', 5200, 6500),
('1TB SSD', 'Storage', '100000006', 2100, 2800),
('Wi-Fi Router', 'Networking', '100000007', 1600, 2200),
('Barcode Scanner', 'POS Equipment', '100000008', 1800, 2500),
('Receipt Printer', 'POS Equipment', '100000009', 3000, 4200),
('1000VA UPS', 'Power', '100000010', 2400, 3200);