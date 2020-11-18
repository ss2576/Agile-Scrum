
-- Пусть задан некоторый пользователь. Из всех друзей этого пользователя 
-- найдите человека, который больше всех общался с нашим пользователем.
use vk;
	
SELECT from_user_id, firstname, lastname,
	COUNT(*) AS 'messages_count' FROM messages
	JOIN users ON users.id = messages.from_user_id WHERE to_user_id = 1
	GROUP BY from_user_id
	ORDER BY COUNT(*) DESC LIMIT 1;
	


-- Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..
use vk;

SELECT COUNT(*)FROM likes 
	WHERE media_id IN (SELECT id FROM media 
	WHERE user_id IN (SELECT user_id FROM profiles
	WHERE  YEAR(CURDATE()) - YEAR(birthday) < 10));
	

--  Определить кто больше поставил лайков (всего) - мужчины или женщины?
use vk;

SELECT gender, COUNT(*)FROM 
	(SELECT user_id AS user,(SELECT gender FROM profiles WHERE user_id = user) AS gender FROM likes)
	 AS intermediate GROUP BY gender;