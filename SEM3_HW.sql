
-- TASK #1

CREATE TABLE salespeople(
	snum INT PRIMARY KEY UNIQUE,
	sname varchar(50) NOT NULL,
	city varchar(50) NOT NULL,
	comm DECIMAL(5,2) NOT NULL
);


INSERT INTO salespeople(snum, sname, city, comm)
VALUES
	(1001, "Peel", "London", 0.12),
	(1002, "Serres", "San Jose", 0.13),
	(1004, "Motika", "London", 0.11),
	(1007, "Rifkin", "Barcelona", 0.15),
	(1003, "Axelrod", "New York", 0.10);
    
    
CREATE TABLE customers(
	cnum INT PRIMARY KEY UNIQUE,
	cname varchar(50) NOT NULL,
	city varchar(50) NOT NULL,
	rating INT NOT NULL,
	snum INT,
	FOREIGN KEY (snum)  REFERENCES salespeople (snum)
);

INSERT INTO customers(cnum, cname, city, rating, snum)
VALUES
	(2001, "Hoffman", "London", 100, 1001),
	(2002, "Giovanni", "Rome", 200, 1003),
	(2003, "Liu", "SanJose", 200, 1002),
	(2004, "Grass", "Berlin", 300, 1002),
	(2006, "Clemens", "London", 100, 1001),
	(2008, "Cisneros", "SanJose", 300, 1007),
	(2007, "Pereira", "Rome", 100, 1004);


CREATE TABLE orders(
	onum INT PRIMARY KEY UNIQUE,
	amt DECIMAL(7,2) NOT NULL,
	odate DATE NOT NULL,
	cnum INT,
	snum INT,
	FOREIGN KEY (cnum)  REFERENCES customers (cnum),
	FOREIGN KEY (snum)  REFERENCES salespeople (snum)
);

INSERT INTO orders(onum, amt, odate, cnum, snum)
VALUES
	(3001, 18.69, '1990-03-10', 2008, 1007),
	(3003, 767.19, '1990-10-03', 2001, 1001),
	(3002, 1900.10, '1990-10-03', 2007, 1004),
	(3005, 5160.45, '1990-10-03', 2003, 1002),
	(3006, 1098.16, '1990-10-03', 2008, 1007),
	(3009, 1713.23, '1990-10-04', 2002, 1003),
	(3007, 75.75, '1990-10-04', 2004, 1002),
	(3008, 4723.00, '1990-10-05', 2006, 1001),
	(3010, 1309.95, '1990-10-06', 2004, 1002),
	(3011, 9891.88, '1990-10-06', 2006, 1001);
    
    
-- 1.  Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)

SELECT city, sname, snum, comm
FROM salespeople;

-- 2.	 Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)

SELECT DISTINCT(cname) AS name, rating 
FROM customers
where city = "SanJose";

-- 3.	 Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)

SELECT DISTINCT(snum) 
FROM customers;

-- 4*. 	Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. Используется оператор "LIKE": (“заказчики”) https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html

SELECT * FROM customers WHERE cname LIKE 'G%';

-- 5. 	Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)

SELECT * FROM orders WHERE amt > 1000;

-- 6.	Напишите запрос который выбрал бы наименьшую сумму заказа. (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)

SELECT MIN(amt)
FROM orders;

-- 7. 	Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.

SELECT *
FROM customers
WHERE (rating > 100) AND (city != "Rome");



-- TASK #2
CREATE TABLE `employees` (
  `id` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `specialty` varchar(50) DEFAULT NULL,
  `seniority` int DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `age` int DEFAULT NULL
);

INSERT INTO `hw4`.`employees` (`id`, `name`, `surname`, `specialty`, `seniority`, `salary`, `age`) VALUES ('1', 'Вася', 'Васькин', 'начальник', '40', '100000', '60');
INSERT INTO `hw4`.`employees` (`id`, `name`, `surname`, `specialty`, `seniority`, `salary`, `age`) VALUES ('2', 'Петя', 'Петькин', 'начальник', '8', '70000', '30');
INSERT INTO `hw4`.`employees` (`id`, `name`, `surname`, `specialty`, `seniority`, `salary`, `age`) VALUES ('3', 'Катя', 'Каткина', 'инженер', '2', '70000', '25');
INSERT INTO `hw4`.`employees` (`id`, `name`, `surname`, `specialty`, `seniority`, `salary`, `age`) VALUES ('4', 'Саша', 'Сашкин', 'инженер', '12', '50000', '35');
INSERT INTO `hw4`.`employees` (`id`, `name`, `surname`, `specialty`, `seniority`, `salary`, `age`) VALUES ('5', 'Иван', 'Иванов', 'рабочий', '40', '30000', '59');
INSERT INTO `hw4`.`employees` (`id`, `name`, `surname`, `specialty`, `seniority`, `salary`, `age`) VALUES ('6', 'Петр', 'Петров', 'рабочий', '20', '25000', '40');
INSERT INTO `hw4`.`employees` (`id`, `name`, `surname`, `specialty`, `seniority`, `salary`, `age`) VALUES ('7', 'Сидор', 'Сидоров', 'рабочий', '10', '20000', '35');
INSERT INTO `hw4`.`employees` (`id`, `name`, `surname`, `specialty`, `seniority`, `salary`, `age`) VALUES ('8', 'Антон', 'Антонов', 'рабочий', '8', '19000', '28');
INSERT INTO `hw4`.`employees` (`id`, `name`, `surname`, `specialty`, `seniority`, `salary`, `age`) VALUES ('9', 'Юра', 'Юркин', 'рабочий', '5', '15000', '25');
INSERT INTO `hw4`.`employees` (`id`, `name`, `surname`, `specialty`, `seniority`, `salary`, `age`) VALUES ('10', 'Максим', 'Воронин', 'рабочий', '2', '11000', '22');
INSERT INTO `hw4`.`employees` (`id`, `name`, `surname`, `specialty`, `seniority`, `salary`, `age`) VALUES ('11', 'Юра', 'Галкин', 'рабочий', '3', '12000', '24');
INSERT INTO `hw4`.`employees` (`id`, `name`, `surname`, `specialty`, `seniority`, `salary`, `age`) VALUES ('12', 'Люся', 'Люськина', 'уборщик', '10', '10000', '49');


-- Отсортируйте поле “зарплата” в порядке убывания и возрастания

SELECT * FROM employees
ORDER BY salary;

SELECT * FROM employees
ORDER BY salary DESC;


-- ** Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)


SELECT * FROM (SELECT * FROM employees ORDER BY salary DESC LIMIT 5) AS salary ORDER BY salary;



-- Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000

SELECT specialty, COUNT(*) AS Count
FROM employees
WHERE salary >= 100000
GROUP BY specialty;

