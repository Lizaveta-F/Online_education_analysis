# Online_education_analysis
In this analitics I explore  the online education platform Udemy with SQL code. The code is designed to provide insights into course popularity, prices and complexity. This analysis can help better understand the trends and patterns of online education on Udemy. 

This dataset contains 3.642 records of courses from 4 subjects (Business Finance, Graphic Design, Musical Instruments and Web Design) taken from Udemy.
Original sourse of data is taken from Kaggle: https://www.kaggle.com/datasets/andrewmvd/udemy-courses?select=udemy_courses.csv.


###For this data analysis I have to:
1) Clean the data: with the help of Excel or PowerQuery I remove any duplicates, missing values, or irrelevant data.
2) Import data into SQL: I used SQL SErver Management Studio to create a new SQL database online_courses and import the cleaned data into it. 
3) Analyze the data using SQL. With the help of aggregation functions, filtering, CTE and joins I analyzed the data to get the insights of complexity, popularity, 
cost and correlation between different factors like duration of courses and price. (The SQL code is attached to the repository)
4) Create visualizations in Tableau: for this I imported the data from csv file with cleaned dataset into Tableau Public and created visualizations
to explore the data. 




###Through the analysis, I have arrived at some intriguing conclusions:
1) Udemy has a large and diverse course offering, with courses in a wide range of topics, including IT, business, design, and personal development.
2) The most popular courses on Udemy tend to be in technical fields such as web development, data science, and machine learning.
3) Course prices on Udemy vary widely up till 220$ for the course, with some courses being offered for free (8,4%) while others cost several hundred dollars(91,6%).
4) The courses that is designed for All level preparation have the biggest duration while expert level courses have the lowest one.
5) Analyzing correlation between price of the course and number of subscribers:
the p-value is greater than 0.05, which means that the observed relationship between the number of subscribers and the course price could be due to chance.
The model shows that 60.2% of the variability in the number of subscribers can be explained by the course price.
So I can conclude, that there is no significant relationship between the number of subscribers and the course price, indicating that course 
price may not be the only factor that determines the number of subscribers.



###Tableau vizz: https://public.tableau.com/app/profile/lizaveta3622/viz/OnlineeducationonUdemy/

