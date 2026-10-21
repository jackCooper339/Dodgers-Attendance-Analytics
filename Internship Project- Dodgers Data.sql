 --Business Question #1- Which opponents attracted the highest average attendence?
 Select opponent, Avg(attend) AS average_attendance
 From DodgersData
 Group By Opponent 
 Order by average_attendance DESC;
 -- Findings:
 --Games against the Angels had the highest average attendance
-- at approximately 49,777 fans, followed closely by the Mets and Nationals.
 -- Business Insight: 
-- Opponent appears to play a role in fan demand and could be considered
-- when planning marketing and promotional efforts.
 
 -- Business Question #2- Which days of the week had the highest average attendance? 
 Select day_of_week, avg(attend) as average_attendance
 From DodgersData
 Group by day_of_week
 Order by average_attendance DESC;
-- Findings:
-- Tuesday games had the highest average attendance at approximately
-- 47,741 fans, while Monday games had the lowest at approximately 34,966.

-- Business Insight:
-- Attendance varied significantly by day of the week, suggesting that
-- game scheduling may influence fan turnout and should be considered
-- when planning ticket sales and marketing strategies.


--Business Question #3-Do promotional games have higher average attendance than non-promotional games?
SELECT
    CASE
        WHEN bobblehead = 'YES'
          OR fireworks = 'YES'
          OR shirt = 'YES'
          OR cap = 'YES'
        THEN 'Promotion'
        ELSE 'No Promotion'
    END AS promotion_status,
    ROUND(AVG(attend), 0) AS average_attendance,
    COUNT(*) AS total_games
FROM DodgersData
GROUP BY promotion_status
ORDER BY average_attendance DESC;
-- Findings:
-- Games with promotions averaged 45,866 attendees across 30 games,
-- compared to 38,201 attendees across 51 games without promotions.
-- Promotional games had approximately 20.1% higher average attendance.

-- Business Insight:
-- Promotional games were associated with higher fan attendance,
-- suggesting that giveaways and special events could be effective
-- marketing strategies for increasing turnout. Teams could use
-- these findings to guide future promotional planning.


-- Business Question #4: Which type of promotion attracted the highest average attendance?
SELECT
    'Bobblehead' AS promotion_type,
    ROUND(AVG(attend), 0) AS average_attendance,
    COUNT(*) AS total_games
FROM DodgersData
WHERE bobblehead = 'YES'

UNION ALL

SELECT
    'Fireworks',
    ROUND(AVG(attend), 0),
    COUNT(*)
FROM DodgersData
WHERE fireworks = 'YES'

UNION ALL

SELECT
    'Shirt',
    ROUND(AVG(attend), 0),
    COUNT(*)
FROM DodgersData
WHERE shirt = 'YES'

UNION ALL

SELECT
    'Cap',
    ROUND(AVG(attend), 0),
    COUNT(*)
FROM DodgersData
WHERE cap = 'YES'

ORDER BY average_attendance DESC;
-- Findings: 
--Bobblehead promotions had the highest average attendance at
--53,145 fans across 11 games, followed by shirt giveaways at
-- 46,644 and fireworks at 41,078. Cap giveaways had the lowest
-- average attendance at 38,190 fans.

-- Business Insight:
-- Bobblehead giveaways were associated with the strongest fan
-- turnout, suggesting that collectible merchandise could be
-- an effective marketing strategy. Teams could prioritize
-- similar promotions to attract fans and potentially increase
-- ticket sales, while evaluating costs and other factors.

-- Business Question #5:
-- How does average attendance change throughout the season by month?
SELECT
    month,
    ROUND(AVG(attend), 0) AS average_attendance,
    COUNT(*) AS total_games
FROM DodgersData
GROUP BY month
ORDER BY
    CASE month
        WHEN 'APR' THEN 1
        WHEN 'MAY' THEN 2
        WHEN 'JUN' THEN 3
        WHEN 'JUL' THEN 4
        WHEN 'AUG' THEN 5
        WHEN 'SEP' THEN 6
        WHEN 'OCT' THEN 7
    END;
	-- Findings:
-- June had the highest average attendance at 47,940 fans
-- across 9 games, followed by July at 43,884 and August
-- at 42,752. October had the lowest average attendance
-- at 36,704 fans, but only included 3 home games.

-- Business Insight:
-- Attendance fluctuated throughout the season, with stronger
-- turnout during the summer months, especially June and July.
-- Teams could use these trends to plan marketing campaigns
-- and target lower-attendance months with promotions or
-- special offers to potentially increase ticket sales.

-- Business Question #6:
-- Do weekend games attract more fans than weekday games?
SELECT
    CASE
        WHEN day_of_week IN ('Saturday', 'Sunday')
        THEN 'Weekend'
        ELSE 'Weekday'
    END AS game_type,
    ROUND(AVG(attend), 0) AS average_attendance,
    COUNT(*) AS total_games
FROM DodgersData
GROUP BY game_type
ORDER BY average_attendance DESC;
-- Findings:
-- Weekend games averaged 42,671 attendees across 26 games,
-- compared to 40,269 attendees across 55 weekday games.
-- Weekend games had approximately 6% higher average attendance.

-- Business Insight:
-- Weekend games were associated with slightly higher fan
-- attendance, suggesting that weekends may attract stronger
-- demand. Teams could focus additional marketing efforts
-- on weekday games to help increase attendance and potentially
-- improve ticket sales.




