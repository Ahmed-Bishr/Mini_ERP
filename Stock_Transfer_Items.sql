CREATE TABLE stock_transfer_items (
    stock_transfer_item_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    stock_transfer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,

    CONSTRAINT CK_stock_transfer_items_quantity CHECK (quantity > 0),

    CONSTRAINT FK_stock_transfer_items_transfers
        FOREIGN KEY (stock_transfer_id) REFERENCES stock_transfers(stock_transfer_id),

    CONSTRAINT FK_stock_transfer_items_products
        FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO stock_transfer_items
(stock_transfer_id, product_id, quantity)
VALUES
(1, 2, 10),
(1, 3, 5),
(2, 7, 6),
(2, 10, 2);