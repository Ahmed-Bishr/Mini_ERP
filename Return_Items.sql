CREATE TABLE return_items (
    return_item_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    return_id INT NOT NULL,
    sale_item_id INT NOT NULL,
    quantity INT NOT NULL,

    CONSTRAINT CK_return_items_quantity CHECK (quantity > 0),

    CONSTRAINT FK_return_items_returns
        FOREIGN KEY (return_id) REFERENCES returns(return_id),

    CONSTRAINT FK_return_items_sale_items
        FOREIGN KEY (sale_item_id) REFERENCES sale_items(sale_item_id)
);

INSERT INTO return_items
(return_id, sale_item_id, quantity)
VALUES
(1, 2, 1),
(2, 8, 1);