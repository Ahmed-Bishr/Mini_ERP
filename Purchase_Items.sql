CREATE TABLE purchase_items (
    purchase_item_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    purchase_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    purchase_price DECIMAL(12,2) NOT NULL,

    CONSTRAINT CK_purchase_items_quantity CHECK (quantity > 0),
    CONSTRAINT CK_purchase_items_price CHECK (purchase_price >= 0),

    CONSTRAINT FK_purchase_items_purchases
        FOREIGN KEY (purchase_id) REFERENCES purchases(purchase_id),

    CONSTRAINT FK_purchase_items_products
        FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO purchase_items
(purchase_id, product_id, quantity, purchase_price)
VALUES
(1, 1, 5, 23000),
(1, 2, 100, 250),
(1, 3, 10, 650),
(2, 5, 10, 5200),
(2, 7, 10, 1600),
(2, 8, 4, 1800),
(3, 4, 4, 4500),
(3, 10, 5, 2400);