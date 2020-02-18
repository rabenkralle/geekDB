USE vk;

-- 1. Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.


SELECT 
	count(*) AS cnt,
	from_user_id
FROM messages
WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY cnt desc;


-- 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..

SELECT 
	count(*)
FROM likes
WHERE 	(SELECT birthday FROM profiles WHERE user_id = 
		(SELECT id FROM users WHERE id = likes.user_id)) >= now() - INTERVAL 10 YEAR
;


-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT 
	count(user_id) AS cnt,
	user_id,
	(SELECT gender FROM profiles WHERE user_id =
		(SELECT id FROM users WHERE id = likes.user_id)) AS gndr
FROM likes
GROUP BY gndr
HAVING cnt
;