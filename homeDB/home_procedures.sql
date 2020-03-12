USE new_home;

delimiter //

DROP PROCEDURE IF EXISTS birthday//
CREATE PROCEDURE birthday ()
BEGIN
	SELECT 
		'Поздравьте клиента',
		c.id,
		concat(c.firstname, ' ', c.surname, ' ', c.lastname) AS client,
		p.birthday,
		c.email,
		c.phone 
	FROM clients c
		JOIN new_home.profiles p ON p.client_id = c.id
	WHERE MONTH(p.birthday) = MONTH(now()) AND DAY(p.birthday) = DAY(now());
END//

CALL birthday ()//

delimiter ;


delimiter //

DROP PROCEDURE IF EXISTS rent_apart_free//
CREATE PROCEDURE rent_apart_free (rent_start date, rent_end date)
SELECT *
FROM rent_apart ra 
JOIN rent_prices rp ON rp.rent_apart_id = ra.id
JOIN apartments a ON ra.apart_id = a.id
JOIN rent_orders ro ON ro.rent_apart_id = ra.id 
WHERE ro.rent_till - ro.rent_from <> rent_end - rent_start

-- IF(hello_now >= '6:00:00' AND hello_now <= '11:59:59') THEN
-- 	SELECT 'Доброе утро';
--   ELSEIF (hello_now >= '12:00:00' AND hello_now <= '17:59:59') THEN
-- 	SELECT 'Добрый вечер';
--   ELSE
-- 	SELECT 'Доброй ночи';
--   END IF;
-- END//