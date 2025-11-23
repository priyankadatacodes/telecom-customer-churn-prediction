## Customer Churn SQL Project

USE customer_db;
SHOW TABLES;
SELECT 
    *
FROM
    churn_data;

#Basic Customer Insights

-- Q1. Find total number of customers

SELECT 
    COUNT(*) AS Total_Customers
FROM
    churn_data;


-- Q2. Find total churned vs non-churned customers

SELECT 
    Churn, COUNT(*) AS Total_Customers
FROM
    churn_data
GROUP BY Churn;


-- Q3. Find churn percentage

SELECT 
    ROUND(SUM(CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS Churn_Percentage
FROM
    churn_data;


-- Q4. Count customers by gender

SELECT 
    gender, COUNT(*) AS Count
FROM
    churn_data
GROUP BY gender;


-- Q5. Count churn by gender

SELECT 
    gender, Churn, COUNT(*) AS Count
FROM
    churn_data
GROUP BY gender , Churn;

#Customer Demographics & Tenure

-- Q6. Find average tenure of customers

SELECT 
    ROUND(AVG(tenure), 2) AS AvgTenure
FROM
    churn_data;


-- Q7. Find maximum and minimum monthly charges

SELECT 
    MAX(MonthlyCharges) AS MaxCharges,
    MIN(MonthlyCharges) AS MinCharges
FROM
    churn_data;


-- Q8. Find top 5 customers with highest monthly charges

SELECT 
    customerID, MonthlyCharges
FROM
    churn_data
ORDER BY MonthlyCharges DESC
LIMIT 5;


-- Q9. Find churn by tenure range

SELECT 
    CASE 
        WHEN tenure <= 12 THEN '0-1 Year'
        WHEN tenure BETWEEN 13 AND 24 THEN '1-2 Years'
        WHEN tenure BETWEEN 25 AND 36 THEN '2-3 Years'
        ELSE '3+ Years'
    END AS Tenure_Bucket,
    Churn, COUNT(*) AS Count
FROM churn_data
GROUP BY Tenure_Bucket, Churn;


-- Q10. Find churn distribution across detailed tenure ranges

SELECT 
    CASE 
        WHEN tenure < 6 THEN '0-6 Months'
        WHEN tenure BETWEEN 6 AND 12 THEN '6-12 Months'
        WHEN tenure BETWEEN 13 AND 24 THEN '1-2 Years'
        WHEN tenure BETWEEN 25 AND 36 THEN '2-3 Years'
        WHEN tenure BETWEEN 37 AND 48 THEN '3-4 Years'
        WHEN tenure BETWEEN 49 AND 60 THEN '4-5 Years'
        ELSE '5+ Years'
    END AS Tenure_Bucket,
    Churn, COUNT(*) AS Count
FROM churn_data
GROUP BY Tenure_Bucket, Churn;


-- Q11. Compare churn rate of customers with tenure < 12 months vs > 12 months

SELECT 
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        ELSE '12+ Months'
    END AS Tenure_Group,
    ROUND(SUM(CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS ChurnRate
FROM
    churn_data
GROUP BY Tenure_Group;


-- Q12. Find churn trend by tenure buckets (rolling window)

SELECT tenure, 
       SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) 
       OVER (ORDER BY tenure ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS RollingChurn
FROM churn_data;

#Services & Contracts

-- Q13. Find total customers by contract type

SELECT 
    Contract, COUNT(*) AS Count
FROM
    churn_data
GROUP BY Contract;


-- Q14. Find churn count by contract type

SELECT 
    Contract, Churn, COUNT(*) AS Count
FROM
    churn_data
GROUP BY Contract , Churn;


-- Q15. Find average charges by contract type

SELECT 
    Contract, ROUND(AVG(MonthlyCharges), 2) AS AvgMonthlyCharges
FROM
    churn_data
GROUP BY Contract;


-- Q16. Find retention rate by contract type

SELECT 
    Contract,
    ROUND(SUM(CASE
                WHEN Churn = 'No' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS RetentionRate
FROM
    churn_data
GROUP BY Contract;


-- Q17. Find total revenue contribution by contract type

SELECT 
    Contract, ROUND(SUM(MonthlyCharges), 2) AS TotalRevenue
FROM
    churn_data
GROUP BY Contract
ORDER BY TotalRevenue DESC;


-- Q18. Find churn count grouped by gender and contract type

SELECT 
    gender, Contract, Churn, COUNT(*) AS Count
FROM
    churn_data
GROUP BY gender , Contract , Churn;



#Payment & Billing

-- Q19. Find churn by payment method

SELECT 
    PaymentMethod, Churn, COUNT(*) AS Count
FROM
    churn_data
GROUP BY PaymentMethod , Churn;


-- Q20. Find top 3 payment methods with highest churn rate

SELECT 
    PaymentMethod,
    ROUND(SUM(CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS ChurnRate
FROM
    churn_data
GROUP BY PaymentMethod
ORDER BY ChurnRate DESC
LIMIT 3;


-- Q21. Find churn count by paperless billing

SELECT 
    PaperlessBilling, Churn, COUNT(*) AS Count
FROM
    churn_data
GROUP BY PaperlessBilling , Churn;

#Revenue & Charges

-- Q22. Find average monthly charges by churn status

SELECT 
    Churn, ROUND(AVG(MonthlyCharges), 2) AS AvgCharges
FROM
    churn_data
GROUP BY Churn;


-- Q23. Find total revenue (sum of monthly charges)

SELECT 
    ROUND(SUM(MonthlyCharges), 2) AS TotalRevenue
FROM
    churn_data;


-- Q24. Find average monthly charges difference between churned vs non-churned customers

SELECT 
    (SELECT 
            AVG(MonthlyCharges)
        FROM
            churn_data
        WHERE
            Churn = 'Yes') - (SELECT 
            AVG(MonthlyCharges)
        FROM
            churn_data
        WHERE
            Churn = 'No') AS AvgChargeDiff;

#Services Usage by Churn

-- Q25. Find churn by internet service type

SELECT 
    InternetService, Churn, COUNT(*) AS Count
FROM
    churn_data
GROUP BY InternetService , Churn;


-- Q26. Find churn probability by internet service type

SELECT 
    InternetService,
    ROUND(SUM(CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS ChurnRate
FROM
    churn_data
GROUP BY InternetService;


-- Q27. Find churn by multiple lines usage

SELECT 
    MultipleLines, Churn, COUNT(*) AS Count
FROM
    churn_data
GROUP BY MultipleLines , Churn;


-- Q28. Find churn by phone service availability

SELECT 
    PhoneService, Churn, COUNT(*) AS Count
FROM
    churn_data
GROUP BY PhoneService , Churn;


-- Q29. Find churn by device protection service

SELECT 
    DeviceProtection, Churn, COUNT(*) AS Count
FROM
    churn_data
GROUP BY DeviceProtection , Churn;


-- Q30. Find churn by tech support availability

SELECT 
    TechSupport, Churn, COUNT(*) AS Count
FROM
    churn_data
GROUP BY TechSupport , Churn;


-- Q31. Find churn by online backup usage

SELECT 
    OnlineBackup, Churn, COUNT(*) AS Count
FROM
    churn_data
GROUP BY OnlineBackup , Churn;


-- Q32. Find churn by streaming TV usage

SELECT 
    StreamingTV, Churn, COUNT(*) AS Count
FROM
    churn_data
GROUP BY StreamingTV , Churn;


-- Q33. Find churn by streaming movies usage

SELECT 
    StreamingMovies, Churn, COUNT(*) AS Count
FROM
    churn_data
GROUP BY StreamingMovies , Churn;


-- Q34. Find churned customers who had both streaming TV and movies

SELECT 
    customerID, StreamingTV, StreamingMovies
FROM
    churn_data
WHERE
    Churn = 'Yes' AND StreamingTV = 'Yes'
        AND StreamingMovies = 'Yes';


-- Q35. Find most common service combination among churned customers

SELECT 
    InternetService,
    StreamingTV,
    StreamingMovies,
    COUNT(*) AS Count
FROM
    churn_data
WHERE
    Churn = 'Yes'
GROUP BY InternetService , StreamingTV , StreamingMovies
ORDER BY Count DESC
LIMIT 1;

#Customer Demographics

-- Q36. Find number of senior citizens who churned

SELECT 
    SeniorCitizen, Churn, COUNT(*) AS Count
FROM
    churn_data
GROUP BY SeniorCitizen , Churn;


-- Q37. Find churn distribution by age group (senior citizen or not)

SELECT 
    CASE
        WHEN SeniorCitizen = 1 THEN 'Senior'
        ELSE 'Non-Senior'
    END AS AgeGroup,
    Churn,
    COUNT(*) AS Count
FROM
    churn_data
GROUP BY AgeGroup , Churn;


-- Q38. Find churn by dependents

SELECT 
    Dependents, Churn, COUNT(*) AS Count
FROM
    churn_data
GROUP BY Dependents , Churn;


-- Q39. Find churn count by partner status

SELECT 
    Partner, Churn, COUNT(*) AS Count
FROM
    churn_data
GROUP BY Partner , Churn;

#Advanced & Analytical Queries

-- Q40. Find churn rate by gender in percentage

SELECT 
    gender,
    ROUND(SUM(CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS ChurnRate
FROM
    churn_data
GROUP BY gender;


-- Q41. Find correlation proxy: average tenure vs churn for each gender

SELECT 
    gender, Churn, ROUND(AVG(tenure), 2) AS AvgTenure
FROM
    churn_data
GROUP BY gender , Churn;


-- Q42. Find average tenure by gender

SELECT 
    gender, ROUND(AVG(tenure), 2) AS AvgTenure
FROM
    churn_data
GROUP BY gender;


-- Q43. Find percentage of customers with multiple services (phone + internet)

SELECT 
    ROUND(SUM(CASE
                WHEN
                    PhoneService = 'Yes'
                        AND InternetService <> 'No'
                THEN
                    1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS MultiService_Percentage
FROM
    churn_data;