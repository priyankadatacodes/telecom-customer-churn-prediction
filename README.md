# Telecom Customer Churn Prediction — End-to-End Project (2025)

> A complete end-to-end data science analysis project to predict telecom customer churn using  
> Python, SQL (MySQL), Machine Learning and an interactive Streamlit app.

---

## Project Overview
Customer churn is a major challenge in subscription-based businesses like telecom.  
- Clean and transform customer churn data
- Create a SQL database from clean data  using SQLAlchemy
- Analyze churn behavior with SQL queries + Python EDA
- Train ML models to predict churn
- Derive business insights & estimate ROI
- Deploy an interactive Streamlit app

---

## Tech Stack
- **Languages:** Python, SQL  
- **Libraries:** pandas, numpy, matplotlib, seaborn, scikit-learn, SQLAlchemy  
- **Database:** MySQL  
- **Frameworks:** Jupyter Notebook, Streamlit  
- **Tools:** Git, GitHub

---

## Project Workflow

### 1. Data Collection
- Dataset: [Telco Customer Churn](https://www.kaggle.com/blastchar/telco-customer-churn)
- 7043 customers, 21 features  
- Loaded with pandas for preprocessing

---

### 2. Data Cleaning (Python)
- Converted `TotalCharges` to numeric and handled missing values
- Created binary target column `Churn_flag`
- Removed duplicate records
- Saved clean version as `clean_churn.csv`

---

### 3. SQL Database Creation (MySQL + SQLAlchemy)
- Used **SQLAlchemy** to create a **MySQL** database `churn_db`
- Loaded the cleaned data as a table using `pandas.to_sql()`
- Executed SQL queries to analyze churn

