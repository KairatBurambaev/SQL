DROP DATABASE IF EXISTS db_3;

CREATE DATABASE IF NOT EXISTS db_3;

USE db_3;

-- 'Персонал'
CREATE TABLE IF NOT EXISTS `staff`
(
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` text,
    `last_name` text,
    `position` text,
    `salary` INT,
    `age` INT
);

INSERT INTO `staff` (first_name, last_name, position, salary, age)
VALUES 
 ('Марсело', 'Маламадре', 'Директор', 400000, 78),
 ('Виктор', 'Сухоруков', 'Заместитель директора', 150000, 44),
 ('Дмитрий', 'Харатьян', 'Охранник', 60000, 43),
 ('Владимир', 'Борисов', 'Менеджер', 48000, 41),
 ('Аднрей', 'Смаев', 'Рабочий', 29000, 24),
 ('Асхаб', 'Тамаев', 'Блогер', 47000, 21),
 ('Хасбик', 'Абдурозиков', 'Инженер', 10000, 22),
 ('Антон', 'Тепляков', 'Рабочий', 24000, 32),
 ('Юрий', 'Долгорукий', 'Царь', 46000, 37),
 ('Анфиса', 'Чехова', 'Рабочий', 15000, 18),
 ('Гарик', 'Мартиросян', 'Рабочий', 16000, 21),

-- Сортировка по возрастанию: 
SELECT *
FROM staff
ORDER BY salary;

-- Сортировка по убыванию:
SELECT *
FROM staff
ORDER BY salary DESC;

-- 5 максимальных заработных плат
SELECT salary
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- Суммарная зарплата по каждой специальности
SELECT 
	position,
    SUM(salary) AS sum_salary
FROM staff
GROUP BY position;

-- Все сотрудники позиции «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT
	COUNT(id) AS count_id
FROM staff
WHERE position = "Рабочий" AND age > 24 AND age <= 49;

-- Количество специальностей
SELECT 
	COUNT(DISTINCT post) AS count_post
FROM staff;

-- Специальности, у которых средний возраст сотрудников меньше 30 лет 
SELECT
	position
FROM staff
GROUP BY position
HAVING AVG(age) < 30;