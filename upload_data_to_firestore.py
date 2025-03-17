import firebase_admin
from firebase_admin import credentials, firestore
import json

# Initialize Firebase Admin SDK
cred = credentials.Certificate(r"C:\Bio-Digester-App-main\biodigester-cd495-firebase-adminsdk-fbsvc-83e02d68e9.json")  # Add your key file
firebase_admin.initialize_app(cred)
db = firestore.client()

# Load JSON Data
with open("data.json") as json_file:
    data = json.load(json_file)

# Upload Data to Firestore
for i, item in enumerate(data):
    db.collection("sensor_data").document(str(i)).set(item)

print("✅ Data uploaded to Firestore successfully!")
