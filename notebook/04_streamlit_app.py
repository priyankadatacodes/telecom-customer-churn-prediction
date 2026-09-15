```python
import streamlit as st
import pandas as pd
import joblib

# Set the page title and icon
st.set_page_config(
    page_title="Telecom Churn Predictor",
    page_icon="📉"
)

st.title("📉 Telecom Customer Churn Predictor")
st.caption("Enter a customer's profile to estimate their churn risk.")

# Load the trained Random Forest model
model = joblib.load("model/random_forest_churn.pkl")

# Load the column names that were used while training the model
model_columns = joblib.load("model/model_columns.pkl")


col1, col2 = st.columns(2)

with col1:
    gender = st.selectbox("Gender", ["Female", "Male"])
    senior = st.selectbox("Senior Citizen", ["No", "Yes"])
    partner = st.selectbox("Has Partner", ["No", "Yes"])
    dependents = st.selectbox("Has Dependents", ["No", "Yes"])
    tenure = st.slider("Tenure (months)", 0, 72, 12)
    contract = st.selectbox(
        "Contract",
        ["Month-to-month", "One year", "Two year"]
    )

with col2:
    internet_service = st.selectbox(
        "Internet Service",
        ["DSL", "Fiber optic", "No"]
    )

    payment_method = st.selectbox(
        "Payment Method",
        [
            "Electronic check",
            "Mailed check",
            "Bank transfer (automatic)",
            "Credit card (automatic)"
        ],
    )

    paperless = st.selectbox(
        "Paperless Billing",
        ["No", "Yes"]
    )

    monthly_charges = st.number_input(
        "Monthly Charges ($)",
        0.0,
        200.0,
        70.0,
        step=1.0
    )

    total_charges = st.number_input(
        "Total Charges ($)",
        0.0,
        10000.0,
        float(monthly_charges * max(tenure, 1)),
        step=10.0
    )


# Create a DataFrame from the customer's information
raw_input = pd.DataFrame([{
    "gender": gender,
    "SeniorCitizen": 1 if senior == "Yes" else 0,
    "Partner": partner,
    "Dependents": dependents,
    "tenure": tenure,
    "Contract": contract,
    "InternetService": internet_service,
    "PaymentMethod": payment_method,
    "PaperlessBilling": paperless,
    "MonthlyCharges": monthly_charges,
    "TotalCharges": total_charges,
}])


def encode_input(df: pd.DataFrame, columns: list) -> pd.DataFrame:
    """
    Convert categorical values into dummy variables
    and make sure the input has the same columns as the training data.
    """

    encoded = pd.get_dummies(df)

    # Add any missing columns and keep the columns in the same order
    # as the data used to train the model.
    encoded = encoded.reindex(
        columns=columns,
        fill_value=0
    )

    return encoded


# Make a prediction when the user clicks the button
if st.button("Predict Churn Risk", type="primary"):

    # Convert the customer's information into the format
    # expected by the trained model.
    X_input = encode_input(
        raw_input,
        model_columns
    )

    # Get the probability that the customer will churn
    prob = model.predict_proba(X_input)[0][1]

    st.metric(
        "Churn Probability",
        f"{prob:.1%}"
    )

    # Show a different message based on the predicted risk
    if prob >= 0.7:
        st.error(
            "🔴 High risk — recommend immediate retention offer"
        )

    elif prob >= 0.4:
        st.warning(
            "🟡 Medium risk — consider proactive check-in"
        )

    else:
        st.success("🟢 Low risk")


st.divider()

st.caption(
    "Model: Random Forest · Trained on the Kaggle "
    "Telco Customer Churn dataset (7,043 customers)"
)
```
