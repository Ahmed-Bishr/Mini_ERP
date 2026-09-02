CREATE TABLE sale_items (
    sale_item_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    sale_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(12,2) NOT NULL,
    discount DECIMAL(12,2) NOT NULL DEFAULT 0,

    CONSTRAINT CK_sale_items_quantity CHECK (quantity > 0),
    CONSTRAINT CK_sale_items_unit_price CHECK (unit_price >= 0),
    CONSTRAINT CK_sale_items_discount CHECK (discount >= 0),

    CONSTRAINT FK_sale_items_sales
        FOREIGN KEY (sale_id) REFERENCES sales(sale_id),

    CONSTRAINT FK_sale_items_products
        FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO sale_items
(sale_id, product_id, quantity, unit_price, discount)
VALUES
(1, 1, 1, 26000, 300),
(1, 2, 2, 400, 0),
(2, 5, 2, 6500, 400),
(2, 3, 1, 950, 50),
(3, 7, 2, 2200, 100),
(3, 10, 1, 3200, 0),
(4, 4, 1, 5800, 0),
(4, 9, 1, 4200, 0);