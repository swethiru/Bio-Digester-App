import 'package:flutter/material.dart';

class DataHistoryScreen extends StatelessWidget {
  const DataHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data History")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildHistoryItem("Temperature", "37.5°C", Icons.thermostat),
          buildHistoryItem("Oxygen Level", "21.2%", Icons.cloud),
          buildHistoryItem("Humidity", "45%", Icons.water_drop),
          buildHistoryItem("Methane", "65%", Icons.air),
          buildHistoryItem(
              "Gas Production", "60 m³/h", Icons.local_gas_station),
        ],
      ),
    );
  }

  Widget buildHistoryItem(String title, String value, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 3,
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}
