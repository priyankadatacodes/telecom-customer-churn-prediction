# **Customer Churn Prediction for Telecom**
*End-to-End Machine Learning Project*

---

## **Overview**

Customer churn threatens growth in telecom and other subscription-driven industries. Early identification of customers likely to leave is crucial to retaining revenue and market share.  
This portfolio project presents a robust pipeline for churn prediction: from raw data to actionable business solutions.

---

## **Business Objective**

- Predict which customers are likely to churn, and when.
- Uncover key factors influencing customer attrition.
- Deliver actionable retention strategies for decision-makers.
- Quantify the revenue impact of improved retention.

---

## **Project Workflow**

### **1. Data Collection**
- Source: [Telco Customer Churn dataset](https://www.kaggle.com/blastchar/telco-customer-churn)
- Size: 7,043 customers, 21 features
- Loaded using pandas

---

### **2. Data Cleaning (Python)**
- Handled missing values, converted `TotalCharges` to numeric
- Created target feature: `Churn_flag` (1=Yes, 0=No)
- Removed duplicates
- Exported cleaned data as `clean_churn.csv`

---

### **3. SQL Database Creation**
- MySQL database (`churn_db`) created via SQLAlchemy
- Imported cleaned churn data (`pandas.to_sql`)
- SQL queries for churn pattern analysis

---

### **4. Exploratory Data Analysis**
- Visualized churn distribution, feature relationships, and outliers
- Insights extracted:
  - Month-to-month contracts & electronic check users have highest churn
  - Fiber optic internet linked to elevated churn
  - <12-month tenure and senior citizens more likely to churn

---

### **5. Feature Engineering**
- Categorical and numerical feature separation
- Input matrix `X` and target vector `y` design
- Prepared columns for encoding/scaling

---

### **6. Preprocessing & Model Training**
- OneHotEncoded categorical features, StandardScaled numerical features
- 70/30 stratified train-test split
- ML models trained and benchmarked:
  - Logistic Regression (ROC-AUC ≈ 0.84)
  - Random Forest

---

### **7. Business Insights & Retention Strategy**
- Top churn drivers: contract type, payment method, internet service, tenure, charges
- Actionable churn probabilities:
  - ≥0.70: Retention Call
  - 0.40–0.70: Email Coupon
  - <0.40: Monitor Only

---

### **8. ROI Estimation**
- Calculated uplift for retaining high-risk customers (≥0.7 churn probability)
- Retention scenarios (1%–10%) modeled
- Estimated annual savings at 5% uplift: **~₹5,441**

---

## **Technologies Used**
- Python: Pandas, NumPy, Matplotlib, Seaborn, Scikit-learn
- SQL: MySQL, SQLAlchemy
- Jupyter Notebook

---

## **Key Results**
- Dataset: 7,043 records, churn rate ≈ 26%
- Best model: Logistic Regression (ROC-AUC ≈ 0.84)
- High-risk segment: ~25% of customers
- Business impact: Retaining top 5% at-risk yields annual savings of ~₹5,441

---

## **Conclusion**

This portfolio project exemplifies a complete, production-ready machine learning framework for customer churn in telecom.  
The pipeline transforms raw data into actionable intelligence and business value—ready for MNC adoption and real-world impact.

---
