USE mavenfuzzyfactory;

SELECT
    MIN(DATE(created_at)) AS start_date,
    COUNT(DISTINCT CASE WHEN device_type = 'desktop' THEN website_session_id ELSE NULL END) AS dtop_session,
    COUNT(DISTINCT CASE WHEN device_type = 'mobile' THEN website_session_id ELSE NULL END) AS mob_session
FROM website_sessions
WHERE utm_source = 'gsearch' AND utm_campaign='nonbrand' AND created_at < '2012-06-09' AND created_at > '2012-04-15'
GROUP BY YEAR(created_at), WEEK(created_at);

