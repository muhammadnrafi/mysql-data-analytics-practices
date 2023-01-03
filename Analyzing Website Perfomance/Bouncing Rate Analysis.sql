USE mavenfuzzyfactory;
-- TUGAS INI MENENTUKAN TOTAL KLIK PADA LANDING PAGE 
-- LANGKAH LANGKAH
-- STEP 1: FIND THE FIRST WEBSITE_PAGEVIEW_ID FOR RELEVANT SESSIONS
-- STEP 2: IDENTIFY THE LANDING PAGE OF EACH SESSION
-- STEP 3: COUNTING PAGEVIEWS FOR EACH SESSION, TO IDENTIFY "BOUNCES"
-- STEP 4: SUMMARIZING TOTAL SESSIONS AND BOUNCED SESIIONS, BY LP

/*
SELECT *
FROM website_pageviews
WHERE created_at BETWEEN  '2014-01-01' AND '2014-02-01'
*/

-- FINDING THE MINIMUM WEBSITE PAGEVIEW ID ASSOCIATED WITH EACH SESSION WE CARE ABOUT
-- /*
SELECT
	website_pageviews.website_session_id,
    MIN(website_pageviews.website_pageview_id) AS min_pageview_id
FROM website_pageviews
	INNER JOIN website_sessions
		ON website_sessions.website_session_id = website_pageviews.website_session_id
        AND website_sessions.created_at BETWEEN '2014-01-01' AND '2014-02-01'
GROUP BY
	website_pageviews.website_session_id; 
-- */
    
 -- /*
CREATE TEMPORARY TABLE first_pageviews_demo
SELECT
	website_pageviews.website_session_id,
    MIN(website_pageviews.website_pageview_id) AS min_pageview_id
FROM website_pageviews
	INNER JOIN website_sessions
		ON website_sessions.website_session_id = website_pageviews.website_session_id
        AND website_sessions.created_at BETWEEN '2014-01-01' AND '2014-02-01'
GROUP BY
	website_pageviews.website_session_id;
    
-- SELECT * FROM first_pageviews_demo;
-- */

-- /*
CREATE TEMPORARY TABLE sessions_w_landing_page_demo
SELECT
	first_pageviews_demo.website_session_id,
    website_pageviews.pageview_url AS landing_page
FROM first_pageviews_demo
	LEFT JOIN website_pageviews
		ON website_pageviews.website_pageview_id = first_pageviews_demo.min_pageview_id; -- website pageview is the landing page view

-- SELECT * FROM sessions_w_landing_page_demo; 
-- */

-- /*
CREATE TEMPORARY TABLE bounced_sessions_only
SELECT
	sessions_w_landing_page_demo.website_session_id,
    sessions_w_landing_page_demo.landing_page,
    COUNT(website_pageviews.website_pageview_id) AS count_of_pages_viewed
FROM sessions_w_landing_page_demo
LEFT JOIN website_pageviews
	ON website_pageviews.website_session_id = sessions_w_landing_page_demo.website_session_id
GROUP BY 
	sessions_w_landing_page_demo.website_session_id,
    sessions_w_landing_page_demo.landing_page
HAVING COUNT(website_pageviews.website_pageview_id) = 1;

SELECT * FROM bounced_sessions_only;
-- */

-- /*
SELECT
	sessions_w_landing_page_demo.landing_page,
    sessions_w_landing_page_demo.website_session_id,
    bounced_sessions_only.website_session_id AS bounced_website_session_id
FROM sessions_w_landing_page_demo
	LEFT JOIN bounced_sessions_only
		ON sessions_w_landing_page_demo.website_session_id = bounced_sessions_only.website_session_id
ORDER BY
	sessions_w_landing_page_demo.website_session_id;
-- */

-- /*
SELECT
	sessions_w_landing_page_demo.landing_page,
    COUNT(DISTINCT sessions_w_landing_page_demo.website_session_id) AS sessions,
    COUNT(DISTINCT bounced_sessions_only.website_session_id) AS bounced_session,
    COUNT(DISTINCT bounced_sessions_only.website_session_id)/COUNT(DISTINCT sessions_w_landing_page_demo.website_session_id) AS bounce_rate
FROM sessions_w_landing_page_demo
	LEFT JOIN bounced_sessions_only
		ON sessions_w_landing_page_demo.website_session_id = bounced_sessions_only.website_session_id
GROUP BY
	sessions_w_landing_page_demo.landing_page;
-- */
