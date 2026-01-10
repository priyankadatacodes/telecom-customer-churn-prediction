# **Customer Churn Prediction for Telecom**
**End-to-End Machine Learning & Analytics Project (Python → SQL)**

---

## **Executive Summary**

Customer churn is one of the biggest threats to growth in **telecom and subscription-based businesses**.  
This project builds an **end-to-end churn prediction pipeline** that identifies customers likely to leave, explains **why they churn**, and estimates the **financial impact of retention strategies**.

The project combines **Python for analysis and modeling**, **SQL for structured analysis**, and **business-driven insights** to move from raw data to **actionable retention decisions**.

---

## **Why I Built This Project**

Retaining existing customers is far more cost-effective than acquiring new ones.  
However, many businesses struggle to:
- Identify customers who are about to churn  
- Understand what drives churn  
- Quantify the ROI of retention actions  

I built this project to demonstrate how **data analytics and machine learning** can support **proactive customer retention**, not just reporting churn rates.

This mirrors a real-world analyst role supporting **growth, marketing, and customer success teams**.

---

## **Business Context**

Telecom companies operate on:
- Recurring subscription revenue  
- Long-term customer relationships  
- High competition and low switching costs  

A churn rate of ~**26%** indicates:
- Revenue leakage  
- High replacement cost  
- Reduced customer lifetime value (CLV)  

The business needs to **predict churn early** and focus retention efforts where they matter most.

---

## **Problem Statement**

Analyze telecom customer data to:
- Predict which customers are likely to churn  
- Identify key churn drivers  
- Segment customers by churn risk  
- Quantify the revenue impact of retention strategies  

---

## **Business Objectives**

- Predict customer churn accurately  
- Understand behavioral and contract-related churn drivers  
- Enable targeted retention actions  
- Estimate ROI from improved retention  
- Support decision-making with data-backed insights  

---

## **Dataset Overview**

- **Source:** Telco Customer Churn Dataset (Kaggle)  
- **Link:** https://www.kaggle.com/blastchar/telco-customer-churn  
- **Total Records:** **7,043 customers**  
- **Features:** **21**  
- **Target Variable:** Churn (Yes / No)  
- **Churn Rate:** ~**26%**

---

## **End-to-End Project Workflow**

---

### **1. Data Collection**
- Loaded raw churn dataset using **pandas**
- Verified schema and data consistency

---

### **2. Data Cleaning (Python)**
- Handled missing values  
- Converted `TotalCharges` to numeric  
- Created binary target variable:
  - **Churn_flag = 1 (Yes), 0 (No)**
- Removed duplicate records  
- Exported clean dataset as `clean_churn.csv`

---

### **3. SQL Database Creation**
- Created **MySQL database (`churn_db`)**
- Imported cleaned data using **SQLAlchemy**
- Used SQL queries for churn pattern analysis

---

### **4. Exploratory Data Analysis (EDA)**

Key findings:
- **Month-to-month contracts** show the highest churn  
- **Electronic check** payment users churn more  
- **Fiber optic** internet customers have elevated churn  
- Customers with **<12 months tenure** are more likely to churn  
- **Senior citizens** show higher churn risk  

---

### **5. Feature Engineering**
- Separated categorical and numerical features  
- Designed input matrix **X** and target vector **y**  
- Prepared features for encoding and scaling  

---

### **6. Preprocessing & Model Training**
- One-Hot Encoding for categorical variables  
- Standard Scaling for numerical features  
- **70/30 stratified train-test split**

**Models Trained:**
- **Logistic Regression** (Best Model)  
- Random Forest  

**Best Performance:**
- **Logistic Regression ROC-AUC ≈ 0.84**

---

## **Churn Risk Segmentation & Business Strategy**

Using churn probabilities, customers were segmented into action buckets:

- **Churn Probability ≥ 0.70** → Immediate retention call  
- **0.40 – 0.70** → Email coupon / targeted offer  
- **< 0.40** → Monitor only  

This converts model output into **clear business actions**.

---

## **ROI Estimation**

To quantify business value:
- Modeled retention uplift scenarios (**1%–10%**)  
- Focused on high-risk customers (≥ 0.70 churn probability)

**Estimated Impact:**
- Retaining just **5% of high-risk customers**  
- Annual savings ≈ **₹5,441**

This shows how even small retention improvements can deliver measurable ROI.

---

## **Key Results**

- **Dataset Size:** 7,043 customers  
- **Churn Rate:** ~**26%**  
- **Best Model:** Logistic Regression  
- **ROC-AUC:** **~0.84**  
- **High-Risk Segment:** ~**25%** of customers  
- **Annual Savings (5% uplift):** **~₹5,441**

---

## **Business Impact**

- Enables early identification of churn risk  
- Supports targeted retention instead of mass campaigns  
- Reduces revenue leakage  
- Improves customer lifetime value  
- Aligns analytics with business outcomes  

---

## **Final Takeaway**

Customer churn can be reduced significantly when **prediction, explanation, and business action** work together.  
This project demonstrates how a **data analyst / ML pipeline** can transform raw telecom data into **actionable retention strategies with measurable financial impact**.

---

## **Technologies Used**

- **Python:** Pandas, NumPy, Matplotlib, Seaborn, Scikit-learn  
- **SQL:** MySQL, SQLAlchemy  
- **Environment:** Jupyter Notebook  

---

## **Author**

**Priyanka Lakra**  
**Aspiring Data Analyst | Python | SQL | Churn Analytics | Machine Learning**
