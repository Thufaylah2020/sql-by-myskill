CREATE DATABASE kopiudin;
USE kopiudin;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    gender ENUM('Male','Female'),
    city VARCHAR(50),
    member_status ENUM('Member','Non-Member')
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE stores (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50)
);
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100),
    position VARCHAR(50),
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);
CREATE TABLE sales (
    sales_id INT AUTO_INCREMENT PRIMARY KEY,
    sales_date DATE,
    customer_id INT,
    product_id INT,
    employee_id INT,
    quantity INT,
    total_price DECIMAL(10,2),

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
INSERT INTO stores (store_name, city)
VALUES
('Coffee Jakarta','Jakarta'),
('Coffee Bandung','Bandung'),
('Coffee Surabaya','Surabaya');
INSERT INTO employees(employee_name,position,store_id)
VALUES
('Andi','Cashier',1),
('Budi','Cashier',2),
('Citra','Cashier',3),
('Dina','Supervisor',1),
('Eko','Supervisor',2);
INSERT INTO products(product_name,category,price)
VALUES
('Espresso','Coffee',25000),
('Americano','Coffee',30000),
('Latte','Coffee',35000),
('Cappuccino','Coffee',38000),
('Mocha','Coffee',40000),
('Caramel Latte','Coffee',42000),
('Matcha Latte','Non Coffee',38000),
('Chocolate','Non Coffee',35000),
('Croissant','Food',28000),
('Cheesecake','Food',45000);
INSERT INTO customers(customer_name,gender,city,member_status)
VALUES
('Ahmad','Male','Jakarta','Member'),
('Bunga','Female','Bandung','Member'),
('Cindy','Female','Surabaya','Non-Member'),
('Doni','Male','Jakarta','Member'),
('Eva','Female','Bandung','Member'),
('Fajar','Male','Bekasi','Non-Member'),
('Gina','Female','Bogor','Member'),
('Hendra','Male','Depok','Member'),
('Indah','Female','Jakarta','Non-Member'),
('Joko','Male','Bandung','Member');
INSERT INTO sales
(sales_date,customer_id,product_id,employee_id,quantity,total_price)
VALUES
('2023-01-05',1,3,1,2,70000),
('2023-01-07',2,1,2,1,25000),
('2023-02-10',3,5,3,1,40000),
('2023-04-18',4,4,1,2,76000),
('2023-06-22',5,6,2,1,42000),

('2024-01-08',6,2,2,2,60000),
('2024-02-11',7,3,1,1,35000),
('2024-03-15',8,7,3,2,76000),
('2024-06-30',9,10,1,1,45000),
('2024-08-14',10,5,2,3,120000),

('2025-01-05',1,1,1,2,50000),
('2025-02-18',2,6,2,2,84000),
('2025-03-20',3,9,3,1,28000),
('2025-05-11',4,4,1,2,76000),
('2025-07-09',5,3,2,1,35000);
SELECT
SUM(total_price) AS Total_Revenue
FROM sales;
SELECT
YEAR(sales_date) AS Tahun,
SUM(total_price) AS Revenue
FROM sales
GROUP BY YEAR(sales_date)
ORDER BY Tahun;
SELECT
p.product_name,
SUM(s.quantity) AS Total_Sold
FROM sales s
JOIN products p
ON s.product_id=p.product_id
GROUP BY p.product_name
ORDER BY Total_Sold DESC;
SELECT
st.city,
SUM(s.total_price) Revenue
FROM sales s
JOIN employees e
ON s.employee_id=e.employee_id
JOIN stores st
ON e.store_id=st.store_id
GROUP BY st.city;
SELECT
c.customer_name,
SUM(s.total_price) AS Total_Belanja
FROM sales s
JOIN customers c
ON s.customer_id=c.customer_id
GROUP BY c.customer_name
ORDER BY Total_Belanja DESC;
SELECT
YEAR(sales_date) AS Tahun,
MONTH(sales_date) AS Bulan,
SUM(total_price) AS Revenue
FROM sales
GROUP BY YEAR(sales_date), MONTH(sales_date)
ORDER BY Tahun, Bulan;
SELECT
c.member_status,
SUM(s.total_price) AS Revenue
FROM sales s
JOIN customers c
ON s.customer_id=c.customer_id
GROUP BY c.member_status;
SELECT
p.product_name,
SUM(s.total_price) AS Revenue
FROM sales s
JOIN products p
ON s.product_id=p.product_id
GROUP BY p.product_name
ORDER BY Revenue DESC
LIMIT 5;