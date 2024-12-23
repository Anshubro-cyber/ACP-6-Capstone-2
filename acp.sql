CREATE TABLE IF NOT EXISTS customers (
  customer_id TEXT PRIMARY KEY,
  name TEXT,
  address TEXT,
  phone_number TEXT
);

CREATE TABLE IF NOT EXISTS products (
  product_id TEXT PRIMARY KEY,
  product_name TEXT,
  customer_id TEXT,
  price REAL,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE IF NOT EXISTS exports (
  export_id TEXT PRIMARY KEY,
  product_id TEXT,
  country TEXT,
  export_date TEXT,
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (customer_id, name, address, phone_number) VALUES
  ('C1001', 'Aaron Smith', '1234 Elm St', '123-456-7890'),
  ('C1002', 'Alice Turner', '5678 Oak St', '234-567-8901'),
  ('C1003', 'Bob Brown', '9101 Pine St', '345-678-9012'),
  ('C1004', 'Adrian Ford', '1122 Maple St', '456-789-0123'),
  ('C1005', 'George Oliver', '3344 Birch St', '567-890-1234');

INSERT INTO products (product_id, product_name, customer_id, price) VALUES
  ('P1001', 'Laptop', 'C1001', 1500),
  ('P1002', 'Smartphone', 'C1002', 800),
  ('P1003', 'Tablet', 'C1003', 400),
  ('P1004', 'Smartwatch', 'C1004', 250),
  ('P1005', 'Headphones', 'C1005', 150);

INSERT INTO exports (export_id, product_id, country, export_date) VALUES
  ('E1001', 'P1001', 'Germany', '2023-01-15'),
  ('E1002', 'P1002', 'France', '2023-02-20'),
  ('E1003', 'P1003', 'Italy', '2023-03-10'),
  ('E1004', 'P1004', 'Japan', '2023-04-05'),
  ('E1005', 'P1005', 'United Kingdom', '2023-05-25');

SELECT * 
FROM customers
WHERE name LIKE 'A%' 
  AND name LIKE '%or%';

SELECT p.* 
FROM products p
JOIN customers c ON p.customer_id = c.customer_id
WHERE c.name LIKE 'A%' 
  AND c.name LIKE '%or%';

SELECT e.country, p.product_name, c.name AS customer_name
FROM exports e
JOIN products p ON e.product_id = p.product_id
JOIN customers c ON p.customer_id = c.customer_id
WHERE c.name LIKE 'A%' 
  AND c.name LIKE '%or%';
