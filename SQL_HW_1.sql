-- 1)Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными. 

CREATE DATABASE IF NOT EXISTS db_1;

USE db_1;

CREATE TABLE IF NOT EXISTS `hw1`.`telephon` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `PhoneName` VARCHAR(45) NOT NULL,
  `Mark` VARCHAR(45) NULL,
  `Count` DOUBLE NULL,
  `Price` DOUBLE NULL,
  PRIMARY KEY (`Id`));
  
INSERT telephone(PhoneName, Mark, Count, Price) 
VALUES 
('Reno Z', 'OPPO', 10, 30000),
('5700 ExpressMusic', 'Nokia', 1, 10000000),
('z3250', 'Motorola', 2, 12000),
('Iphone 5s', 'Apple', 7, 25000),
('Galaxy s19', 'Samsung', 4, 45000);

-- 2)Вывести название, производителя и цену для товаров, количество которых превышает 2 
SELECT PhonetName, Mark, Price
FROM telephone
WHERE ProductCount > 2; 

-- 3)Выведите весь ассортимент товаров марки “Samsung”
SELECT *
FROM telephone
WHERE Mark = 'Samsung';