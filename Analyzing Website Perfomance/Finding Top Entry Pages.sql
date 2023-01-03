USE mavenfuzzyfactory;

CREATE TEMPORARY TABLE first_page_view
SELECT
	website_session_id,
    MIN(website_pageview_id) AS first_pv
FROM website_pageviews
WHERE created_at < '2012-06-12'
GROUP BY website_session_id;

SELECT
	website_pageviews.pageview_url AS landing_page,
	COUNT(DISTINCT first_page_view.website_session_id) AS sessions_hitting_page
FROM first_page_view
	LEFT JOIN website_pageviews 
		ON first_page_view.website_session_id = website_pageviews.website_session_id
GROUP BY website_pageviews.pageview_url
ORDER BY sessions_hitting_page DESC;