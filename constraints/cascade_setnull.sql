CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) UNIQUE,
    name VARCHAR(100)
);

-- Cascade - when the parent record is deleted, the child records are also deleted
-- DELETE CASCADE - when the parent record is deleted, the child records are also deleted
-- UPDATE CASCADE - when the parent record is updated, the child FK id records are also updated
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Set null - when the parent record is deleted, the child records are set to null
-- DELETE SET NULL - when the parent record is deleted, the child records are set to null
-- UPDATE SET NULL - when the parent record is updated, the child FK id records are set to null
CREATE TABLE order_items (
    order_id INT NULL,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE
    SET
        NULL ON UPDATE
    SET
        NULL
);