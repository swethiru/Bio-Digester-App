import pandas as pd
import json

# Load Excel file
df = pd.read_excel(r"C:\Bio-Digester-App-main\assets\data1.xlsx")  # Change file name accordingly

# Convert to JSON format
json_data = df.to_json(orient="records")

# Save as a JSON file
with open("data.json", "w") as json_file:
    json_file.write(json_data)

print("✅ Excel converted to JSON successfully!")
