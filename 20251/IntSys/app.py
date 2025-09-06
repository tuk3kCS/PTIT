import streamlit as st
import pickle
import numpy as np

# --- Load model ---
filename = "diabetes_best_model.sav"
try:
    loaded_model = pickle.load(open(filename, "rb"))
    model_loaded = True
except Exception as e:
    st.error(f"⚠️ Error loading model: {e}")
    loaded_model = None
    model_loaded = False

# --- Streamlit UI ---
st.set_page_config(page_title="Diabetes Prediction App", layout="centered")

st.title("🧮 Diabetes Prediction")
st.markdown("Enter patient details to predict the likelihood of diabetes.")

# Input fields
st.subheader("Patient Information")

glucose = st.number_input("Glucose (mg/dL)", min_value=0, max_value=200, value=100, step=1)
bmi = st.number_input("BMI (kg/m²)", min_value=0.0, max_value=70.0, value=30.0, step=0.1)
age = st.number_input("Age (years)", min_value=0, max_value=120, value=30, step=1)
pregnancies = st.number_input("Number of Pregnancies", min_value=0, max_value=20, value=1, step=1)
skin_thickness = st.number_input("Skin Thickness (mm)", min_value=0, max_value=100, value=20, step=1)

# Prediction button
if st.button("Predict Diabetes"):
    if not model_loaded:
        st.error("❌ Model not loaded. Please check your .sav file.")
    else:
        try:
            features = np.array([[glucose, bmi, age, pregnancies, skin_thickness]])
            prediction = loaded_model.predict(features)

            if hasattr(loaded_model, "predict_proba"):
                confidence = loaded_model.predict_proba(features)
                confidence_score = round(np.max(confidence) * 100, 2)
            else:
                confidence_score = None

            st.subheader("Prediction Result")
            if prediction[0] == 1:
                st.error("**Outcome: Diabetic** 🔴")
            else:
                st.success("**Outcome: Non-diabetic** 🟢")

            if confidence_score is not None:
                st.info(f"Confidence: **{confidence_score}%**")

        except Exception as e:
            st.error(f"Error during prediction: {e}")
