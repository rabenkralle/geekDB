USE shop;

-- 1. Подсчитайте средний возраст пользователей в таблице users

SELECT
  FLOOR(avg((TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25))
FROM
  users;
--   
-- 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.


SELECT 
	date_format(date(concat_ws('-', YEAR(now()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS birthday,
	count(*) AS total
FROM users
GROUP BY birthday
ORDER BY total;


-- 3. (по желанию) Подсчитайте произведение чисел в столбце таблицы


DROP TABLE IF EXISTS summ;
CREATE TABLE summ(
value INT UNSIGNED
);
 
INSERT INTO summ(value) VALUES ('1'), ('2'), ('3'), ('4'), ('5');

SELECT exp(SUM(log(value))) 
FROM summ 
;