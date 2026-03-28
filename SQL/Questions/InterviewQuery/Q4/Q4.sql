/*
DDL:
CREATE TABLE IF NOT EXISTS events (
 user_id INT, 
 created_at TIMESTAMP,
 action VARCHAR(20),
 platform VARCHAR(20)
);

INSERT INTO events (user_id, created_at, action, platform) VALUES
(59, '2020-12-21 08:15:30', 'post_cancel', 'iphone'),
(84, '2020-12-21 14:22:45', 'like', 'android'),
(21, '2020-12-21 19:05:12', 'like', 'web'),
(47, '2020-10-31 07:30:00', 'email_opened', 'iphone'),
(100, '2020-11-01 09:45:20', 'email_opened', 'android'),
(45, '2020-11-03 11:10:55', 'post_submit', 'web'),
(44, '2020-11-05 16:33:18', 'like', 'iphone'),
(38, '2020-11-07 06:50:42', 'like', 'android'),
(45, '2020-11-08 13:25:09', 'like', 'web'),
(16, '2020-11-08 22:40:33', 'post_submit', 'iphone'),
(17, '2020-11-09 10:15:00', 'like', 'android'),
(41, '2020-11-11 15:55:27', 'post_cancel', 'ipad'),
(34, '2020-11-12 08:05:44', 'email_opened', 'iphone'),
(78, '2020-11-12 20:30:16', 'like', 'android'),
(17, '2020-11-13 12:45:58', 'like', 'web'),
(4, '2020-11-13 17:20:03', 'email_opened', 'iphone'),
(25, '2020-11-14 09:10:37', 'like', 'android'),
(71, '2020-11-15 14:55:22', 'post_enter', 'web'),
(3, '2020-11-15 21:40:11', 'like', 'iphone'),
(19, '2020-11-16 07:25:48', 'like', 'android'),
(23, '2020-11-17 11:50:05', 'post_enter', 'ipad'),
(4, '2020-11-19 16:15:39', 'post_cancel', 'iphone'),
(26, '2020-11-20 08:35:52', 'post_enter', 'android'),
(21, '2020-11-22 13:00:14', 'like', 'web'),
(47, '2020-11-23 18:45:26', 'email_opened', 'iphone'),
(100, '2020-11-25 06:20:41', 'email_opened', 'android'),
(45, '2020-11-25 10:55:08', 'post_submit', 'iphone'),
(44, '2020-11-25 15:30:33', 'unsubscribe', 'iphone'),
(38, '2020-11-25 19:05:57', 'post_opened', 'android'),
(45, '2020-11-25 23:40:19', 'like', 'web'),
(16, '2020-11-26 07:15:44', 'post_submit', 'iphone'),
(17, '2020-11-26 12:50:02', 'like', 'android'),
(59, '2020-11-26 17:25:36', 'post_cancel', 'iphone'),
(84, '2020-11-26 21:00:15', 'email_opened', 'iphone'),
(21, '2020-11-27 06:35:28', 'unsubscribe', 'ipad'),
(47, '2020-11-27 11:10:53', 'like', 'web'),
(100, '2020-11-27 15:45:07', 'email_opened', 'iphone'),
(45, '2020-11-27 20:20:41', 'feed_viewed', 'ipad'),
(44, '2020-11-27 23:55:16', 'post_enter', 'web'),
(38, '2020-11-28 09:30:49', 'unsubscribe', 'iphone'),
(45, '2020-11-29 14:05:23', 'post_cancel', 'android');
*/
WITH cte_cnt_actions AS (
SELECT 
 action, COUNT(*) AS cnt
FROM events 
WHERE (EXTRACT(YEAR from created_at) = 2020
AND LOWER(platform) IN ('iphone', 'ipad'))
GROUP BY 1),
cte_rnk_actions AS (
SELECT action, DENSE_RANK() OVER(ORDER BY cnt) AS ranks
FROM cte_cnt_actions)
SELECT 
  action,
  ranks
FROM cte_rnk_actions
WHERE ranks <6;