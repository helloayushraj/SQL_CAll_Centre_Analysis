
/* CALL_CENTRE_ANALYSIS_OCTOBER_2020_REPORT */


SELECT * FROM call_center;



--1. Total no. of Calls

SELECT
     COUNT(id) AS total_no_of_calls
FROM call_center;

--2. Total Call Duration in Minutes

SELECT 
      SUM(call_duration_in_minutes) AS total_call_duration_in_min
FROM call_center;

--3. Total Call Duration in Hrs

SELECT 
      SUM(call_duration_in_minutes)/60 AS total_call_duration_in_Hr
FROM call_center;

--4. Avg Call Duration in Min

SELECT 
       CAST(AVG(CAST (call_duration_in_minutes AS DECIMAL(10,2))) AS DECIMAL(10,2))  AS total_call_duration_in_min
FROM call_center;

--5. Response Time Percentage

SELECT
       CAST(CAST(COUNT(id) AS DECIMAL (10,2))*100/(SELECT COUNT(id) FROM call_center) AS DECIMAL (10,2)) AS response_time_prctg
FROM call_center 
WHERE Response_Time in('Above SLA','Within SLA')

--6. Total Calls by Day

SELECT 
      DATENAME(dw,call_timestamp) AS day_name,
	  COUNT(id) AS no_of_calls
FROM call_center
GROUP BY  DATENAME(dw,call_timestamp) 
ORDER BY  no_of_calls DESC;

--7. Top Reasons for Call

SELECT 
		Reason,
		COUNT(id) AS no_of_calls
FROM call_center
GROUP BY  Reason
ORDER BY  COUNT(id) DESC;

--8. Total Calls by Channel

SELECT 
		Channel,
		COUNT(id) AS no_of_calls
FROM call_center
GROUP BY Channel
ORDER BY no_of_calls DESC


--9. Total Calls by Sentiment

SELECT
     Sentiment,
	 COUNT(id) AS no_of_calls
FROM call_center
GROUP BY  Sentiment
ORDER BY  no_of_calls DESC;

--10. Total Calls by Call_Centre

SELECT
      Call_Centres_City,
	  COUNT(id) AS no_of_calls
FROM call_center
GROUP BY Call_Centres_City
ORDER BY no_of_calls DESC;

--11. Total Calls by State

SELECT
      State,
	  COUNT(id) AS no_of_calls
FROM call_center
GROUP BY State
ORDER BY no_of_calls DESC;

-- -------------------------------------------------------------------------------------------------------------------




