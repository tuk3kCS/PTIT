from flask import Flask, request, render_template_string
import joblib
import numpy as np
import tensorflow as tf

MODEL_PATH = "saved_model_diabetes/best_model.h5"
SCALER_PATH = "saved_model_diabetes/scaler.pkl"

model = tf.keras.models.load_model(MODEL_PATH, compile=False)
scaler = joblib.load(SCALER_PATH)

app = Flask(__name__)

HTML = """
<!doctype html>
<title>Diabetes Prediction</title>
<h2>Predict Diabetes Regression Output</h2>

<form method="POST" action="/predict">
<label>Pregnancies: </label><input name="Pregnancies" required><br>
<label>Glucose: </label><input name="Glucose" required><br>
<label>BloodPressure: </label><input name="BloodPressure" required><br>
<label>SkinThickness: </label><input name="SkinThickness" required><br>
<label>Insulin: </label><input name="Insulin" required><br>
<label>BMI: </label><input name="BMI" required><br>
<label>DiabetesPedigreeFunction: </label><input name="DiabetesPedigreeFunction" required><br>
<label>Age: </label><input name="Age" required><br>

<br>
<input type="submit" value="Predict">
</form>

{% if pred is not none %}
    <h3>Prediction: {{ pred }}</h3>
{% endif %}
"""

@app.route("/", methods=["GET"])
def home():
    return render_template_string(HTML, pred=None)

@app.route("/predict", methods=["POST"])
def predict():
    try:
        xs = []
        for name in ['Pregnancies', 'Glucose', 'BloodPressure', 'SkinThickness', 'Insulin', 'BMI', 'DiabetesPedigreeFunction', 'Age']:
            value = float(request.form.get(name))
            xs.append(value)

        arr = np.array(xs).reshape(1, -1)
        arr_scaled = scaler.transform(arr)
        pred = model.predict(arr_scaled).ravel()[0]
        return render_template_string(HTML, pred=float(pred))

    except Exception as e:
        return f"Error: {e}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
