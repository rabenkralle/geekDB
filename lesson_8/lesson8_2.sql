-- 1. Создайте двух пользователей которые имеют доступ к базе данных shop. 
-- Первому пользователю shop_read должны быть доступны только запросы на чтение данных, 
-- второму пользователю shop — любые операции в пределах базы данных shop.

GRANT SELECT ON shop.* TO 'shop_read'@'localhost' identified WITH sha256_password BY 'Passw0rd!';
GRANT ALL ON shop.* TO 'shop'@'localhost' identified WITH sha256_password BY 'Passw0rd!';
