-- What is the total number of courses present on Udemy
SELECT count(*) AS total_number_of_courses 
FROM online_edu.dbo.udemy_courses;

-- What is the number of courses by subject and waht is the average price of courses for each subject?
SELECT subject, count(*) AS courses_by_subject_number, avg(price) AS avg_price$
FROM online_edu.dbo.udemy_courses
GROUP BY subject
ORDER BY courses_by_subject_number DESC; 

-- What is the number of courses by level and waht is the average price of courses for each level?
SELECT level, count(*) AS courses_by_level_number, avg(price) AS avg_price$
FROM online_edu.dbo.udemy_courses
GROUP BY level
ORDER BY courses_by_level_number DESC;

--What is the percentage of free courses for each subject and level?
SELECT subject, level, count(*) AS number_of_free_courses
FROM online_edu.dbo.udemy_courses
GROUP BY subject,level
ORDER BY subject,number_of_free_courses DESC;

--What is the percentage of free courses according to the subject?
WITH free_courses (subject,level, number_of_free_courses)
AS
(
    SELECT subject, level, COUNT(*)
    FROM online_edu.dbo.udemy_courses
    GROUP BY subject, level
)
SELECT subject, level,ROUND(number_of_free_courses*100.0/(SELECT COUNT(*) FROM online_edu.dbo.udemy_courses),2) AS percentage_of_free
FROM free_courses
ORDER BY subject,percentage_of_free DESC;


--What are top-5 courses with the biggest number of subscribers and reviews?
SELECT TOP 5 course_title,subject, num_reviews
FROM online_edu.dbo.udemy_courses
ORDER BY num_reviews DESC;

SELECT TOP 5 course_title,subject, num_subscribers
FROM online_edu.dbo.udemy_courses
ORDER BY num_subscribers DESC;

SELECT subject, SUM(num_subscribers) AS total_subscribers
FROM online_edu.dbo.udemy_courses
GROUP BY subject
ORDER BY total_subscribers DESC;

SELECT level, SUM(num_subscribers) AS total_subscribers
FROM online_edu.dbo.udemy_courses
GROUP BY level
ORDER BY total_subscribers DESC;

--What is average duration of free and paid courses by subject?
--for free courses:
SELECT subject, ROUND(AVG(content_duration_hours),2) AS avg_duration
FROM online_edu.dbo.udemy_courses
WHERE course_id IN (SELECT course_id
					FROM online_edu.dbo.udemy_courses
					WHERE is_paid = 'FALSE')
GROUP BY subject
ORDER BY avg_duration DESC;
--for paid courses:
SELECT subject, ROUND(AVG(content_duration_hours),2) AS avg_duration
FROM online_edu.dbo.udemy_courses
WHERE course_id IN (SELECT course_id
					FROM online_edu.dbo.udemy_courses
					WHERE is_paid = 'TRUE')
GROUP BY subject
ORDER BY avg_duration DESC;

--What is the max price for each subject and level?
SELECT DISTINCT subject, level, AVG(price) OVER (PARTITION BY subject, level) AS max_price$
FROM online_edu.dbo.udemy_courses
WHERE is_paid = 'TRUE'
ORDER BY max_price$ DESC;

--What is connection between course duration and price?
SELECT subject, AVG(price) AS avg_price, ROUND(AVG(content_duration_hours),2) AS avg_duration
FROM online_edu.dbo.udemy_courses
WHERE is_paid = 'TRUE'
GROUP BY subject
ORDER BY avg_duration DESC;

--What is average number of lectures for free and paid courses by subject and level?
SELECT 
    o.subject, 
    o.level, 
    AVG(CASE WHEN o.is_paid = 'TRUE' THEN o.num_lectures ELSE NULL END) AS num_lectures_paid,
    AVG(CASE WHEN o.is_paid = 'FALSE' THEN o.num_lectures ELSE NULL END) AS num_lectures_free
FROM 
    online_edu.dbo.udemy_courses o
LEFT JOIN 
    online_edu.dbo.udemy_courses f
ON 
    o.subject = f.subject AND o.level = f.level AND f.is_paid = 'FALSE'
GROUP BY 
    o.subject, o.level;






						



