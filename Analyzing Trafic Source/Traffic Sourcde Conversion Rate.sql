USE mavenfuzzyfactory;

SELECT 
	COUNT(DISTINCT(website_sessions.website_session_id)) AS sessions,
    COUNT(DISTINCT(orders.order_id)) AS number_order,
    COUNT(DISTINCT(orders.order_id))/COUNT(DISTINCT(website_sessions.website_session_id)) AS CVR
FROM website_sessions
	LEFT JOIN orders
		ON orders.website_session_id=website_sessions.website_session_id
WHERE website_sessions.created_at < '2012-04-14'
AND utm_source = 'gsearch'
AND utm_campaign = 'nonbrand';

SELECT * FROM orders;