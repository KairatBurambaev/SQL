DROP DATABASE IF EXISTS db_2;

CREATE DATABASE IF NOT EXISTS db_2;

USE db_2;

-- 1. Создаем таблицу “sales” и заполняем её данными

CREATE TABLE IF NOT EXISTS sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count INT NOT NULL
);

INSERT INTO sales(order_date, count)
VALUES
	(DATE '2023-01-12', 54),
	(DATE '2023-02-23', 96),
	(DATE '2023-03-08', 148),
	(DATE '2023-04-01', 258),
	(DATE '2023-04-05', 359);

/*
2. Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100 - Маленький заказ
от 100 до 300 - Средний заказ
больше 300 - Большой заказ
*/

SELECT 
	id,
    CASE
		WHEN count < 100 THEN "Маленький заказ"
        WHEN count BETWEEN 100 AND 300 THEN "Средний заказ"
        ELSE "Большой заказ"
    END AS "Тип заказа"
FROM sales;

-- 3. Создаем таблицу “orders” и заполняем её данными

CREATE TABLE IF NOT EXISTS orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    seller_id VARCHAR(20),
    amount FLOAT DEFAULT 0.0,
	order_status VARCHAR(20)
);

INSERT INTO orders (seller_id, amount, order_status)
VALUES
('101', 175.00, "OPEN"),
('1545', 45.80, "OPEN"),
('558', 90.80, "CLOSED"),
('44', 85.55, "OPEN"),
('1', 90.50, "RETURNED");

SELECT
	id,
    seller_id,
    amount,
    order_status,
	CASE
		WHEN order_status = "OPEN" THEN "Order is in open"
        WHEN order_status = "CLOSED" THEN "Order is closed"
        WHEN order_status = "CANCELLED" THEN "Order is returned"
        ELSE ""
    END AS full_order_status
FROM orders;

-- 4. Чем NULL отличается от 0? -"0" это значение, константа. а NULL - "Пустое место" - объявленная, но неинициализованная переменная, объект и т.д.