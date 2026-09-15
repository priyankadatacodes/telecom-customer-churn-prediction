
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

from sklearn.metrics import (
    accuracy_score,
    precision_score,
    recall_score,
    f1_score,
    roc_auc_score,
    roc_curve,
    confusion_matrix,
    classification_report
)

# Add your trained models here.
# If your model variable names are different, replace log_reg and rf_model
# with the names you used in your notebook.

models = {
    "Logistic Regression": log_reg,
    "Random Forest": rf_model,
}

# Compare the performance of both models

rows = []

for name, model in models.items():
    y_pred = model.predict(X_test)
    y_prob = model.predict_proba(X_test)[:, 1]

    rows.append({
        "Model": name,
        "Accuracy": round(accuracy_score(y_test, y_pred), 3),
        "Precision": round(precision_score(y_test, y_pred), 3),
        "Recall": round(recall_score(y_test, y_pred), 3),
        "F1-Score": round(f1_score(y_test, y_pred), 3),
        "ROC-AUC": round(roc_auc_score(y_test, y_prob), 3),
    })

metrics_df = pd.DataFrame(rows)

# Display the results
print(metrics_df.to_markdown(index=False))

# Save the results so you can use them in your README
metrics_df.to_csv("notebook/model_metrics.csv", index=False)

# Create a confusion matrix for the Random Forest model

best_name = "Random Forest"
best_model = rf_model

y_pred_best = best_model.predict(X_test)

cm = confusion_matrix(y_test, y_pred_best)

plt.figure(figsize=(5, 4))

sns.heatmap(
    cm,
    annot=True,
    fmt="d",
    cmap="Purples",
    xticklabels=["No Churn", "Churn"],
    yticklabels=["No Churn", "Churn"]
)

plt.title(f"Confusion Matrix — {best_name}")
plt.ylabel("Actual")
plt.xlabel("Predicted")
plt.tight_layout()

# Save the confusion matrix image
plt.savefig("dashboard/confusion_matrix.png", dpi=150)

plt.show()

# Print a detailed performance report for the Random Forest model

print(
    classification_report(
        y_test,
        y_pred_best,
        target_names=["No Churn", "Churn"]
    )
)

# Create ROC curves for both models

plt.figure(figsize=(6, 5))

for name, model in models.items():

    y_prob = model.predict_proba(X_test)[:, 1]

    fpr, tpr, _ = roc_curve(y_test, y_prob)

    auc = roc_auc_score(y_test, y_prob)

    plt.plot(
        fpr,
        tpr,
        label=f"{name} (AUC = {auc:.3f})"
    )

# Add a reference line
plt.plot(
    [0, 1],
    [0, 1],
    linestyle="--",
    color="grey"
)

plt.xlabel("False Positive Rate")
plt.ylabel("True Positive Rate")
plt.title("ROC Curve Comparison")
plt.legend()
plt.tight_layout()

# Save the ROC curve image
plt.savefig("dashboard/roc_curve.png", dpi=150)

plt.show()

# Show the most important features used by the Random Forest model

importances = pd.Series(
    rf_model.feature_importances_,
    index=X_train.columns
)

top_features = importances.sort_values(
    ascending=False
).head(10)

plt.figure(figsize=(7, 5))

top_features.sort_values().plot(
    kind="barh",
    color="#6a3fbf"
)

plt.title("Top 10 Churn Drivers — Random Forest Feature Importance")
plt.xlabel("Importance")
plt.tight_layout()

# Save the feature importance chart
plt.savefig("dashboard/feature_importance.png", dpi=150)

plt.show()

# Print the top 10 features
print(top_features)
