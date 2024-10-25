DROP DATABASE IF EXISTS lab;
CREATE DATABASE lab;
USE lab;

DROP TABLE IF EXISTS instractor;
CREATE TABLE instractor(
ins_id INT ,
lastname VARCHAR(20) NOT NULL,
firstname VARCHAR(20) NOT NULL,
city VARCHAR(20),
country CHAR(2),
PRIMARY KEY(ins_id)
);

INSERT INTO instractor(ins_id, lastname, firstname, city, country)
VALUES
('1', 'Ahuja', 'Rav', 'Toronto', 'CA'),
('2', 'Chong', 'Raul', 'Toronto', 'CA'),
('3', 'Vasudevan', 'Hima', 'Chicago', 'US');

SELECT *
FROM instractor;

SELECT firstname, lastname, country
FROM instractor
WHERE city = 'Toronto';

UPDATE instractor
SET city = 'Markham'
WHERE ins_id = 1;

DELETE FROM instractor
WHERE ins_id = 2;

SELECT *
FROM instractor;