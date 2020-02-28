-- 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
-- в зависимости от текущего времени суток. С 6:00 до 12:00 
-- функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 
-- функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

delimiter //

DROP PROCEDURE IF EXISTS hello//
CREATE PROCEDURE hello (hello_now VARCHAR(255))
BEGIN
  IF(hello_now >= '6:00:00' AND hello_now <= '11:59:59') THEN
	SELECT 'Доброе утро';
  ELSEIF (hello_now >= '12:00:00' AND hello_now <= '17:59:59') THEN
	SELECT 'Добрый вечер';
  ELSE
	SELECT 'Доброй ночи';
  END IF;
END//

CALL hello(now())//


