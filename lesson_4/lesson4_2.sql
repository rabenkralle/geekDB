USE vk;


-- 2. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке

SELECT distinct firstname
FROM users;


-- 3. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
-- Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)

UPDATE profiles 
SET 
	is_active = 0
WHERE 
	birthday >= now() - INTERVAL 18 YEAR;
	

-- 4. Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней)

INSERT INTO `messages` (`from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('2', '3', 'Quasi rerum neque rerum sed est atque. Voluptas architecto asperiores quidem perspiciatis.', '2022-09-02 20:30:02');
INSERT INTO `messages` (`from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('2', '4', 'Quasi rerum neque rerum sed est atque. Voluptas architecto asperiores quidem perspiciatis.', '2023-09-02 20:30:02');
INSERT INTO `messages` (`from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('2', '5', 'Quasi rerum neque rerum sed est atque. Voluptas architecto asperiores quidem perspiciatis.', '2027-09-02 20:30:02');

DELETE FROM messages 
WHERE created_at >= now()
;
