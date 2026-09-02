CREATE TABLE inventory (
    warehouse_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    minimum_quantity INT NOT NULL DEFAULT 0,

    CONSTRAINT PK_inventory PRIMARY KEY (warehouse_id, product_id),

    CONSTRAINT CK_inventory_quantity CHECK (quantity >= 0),
    CONSTRAINT CK_inventory_minimum_quantity CHECK (minimum_quantity >= 0),

    CONSTRAINT FK_inventory_warehouses
        FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),

    CONSTRAINT FK_inventory_products
        FOREIGN KEY (product_id) REFERENCES products(product_id)
);



INSERT INTO inventory
(warehouse_id, product_id, quantity, minimum_quantity)
VALUES
(1, 1, 12, 3),
(1, 2, 80, 15),
(1, 3, 45, 10),
(1, 4, 15, 3),
(1, 5, 20, 5),
(1, 6, 30, 5),
(2, 2, 20, 5),
(2, 7, 18, 4),
(3, 1, 8, 2),
(3, 3, 35, 8),
(3, 5, 25, 5),
(3, 7, 30, 6),
(3, 8, 12, 3),
(3, 9, 10, 3),
(4, 6, 15, 3),
(4, 10, 14, 3),
(5, 2, 25, 5),
(5, 4, 8, 2),
(5, 7, 12, 3),
(5, 10, 10, 2);