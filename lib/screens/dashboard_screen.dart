import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/excel_provider.dart';
import 'alert_screen.dart';
//import '..services/auth_service.dart';
import 'package:my_flutter_app/services/auth_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    // Load Excel data using the provider.
    // Using Future.microtask ensures the provider is available.
    Future.microtask(() {
      final authService = Provider.of<AuthService>(context, listen: false);

      // 🚨 Redirect to login if user is not authenticated
      if (authService.currentUser == null) {
        Navigator.pushReplacementNamed(context, '/login');
        return;
      }

      // ✅ Load Excel data if authenticated
      Provider.of<ExcelProvider>(context, listen: false).loadDataFromFirebase();
    });

    //Provider.of<ExcelProvider>(context, listen: false).loadExcelData());
  }

  // UI-specific function to check for critical conditions.
  void checkCriticalConditions(BuildContext context, double methaneLevel) {
    if (methaneLevel > 80) {
      Future.delayed(Duration.zero, () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const AlertScreen(message: "Methane Level Critically High!")),
        );
      });
    } else if (methaneLevel < 30) {
      Future.delayed(Duration.zero, () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const AlertScreen(message: "Methane Level Too Low!")),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExcelProvider>(
      builder: (context, excelProvider, child) {
        // Optionally, check critical conditions here.
        checkCriticalConditions(context, excelProvider.methaneLevel);

        return Scaffold(
          appBar: AppBar(title: const Text("Biogas Monitor")),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1.5,
              children: [
                buildParameterCard(
                    "System Status", "Healthy", Icons.health_and_safety),
                buildParameterCard("Temperature",
                    "${excelProvider.temperature}°C", Icons.thermostat),
                buildParameterCard("Oxygen Level",
                    "${excelProvider.oxygenLevel}%", Icons.cloud),
                buildParameterCard(
                    "Humidity", "${excelProvider.humidity}%", Icons.water_drop),
                buildParameterCard(
                    "Methane", "${excelProvider.methaneLevel}%", Icons.air),
                buildParameterCard(
                    "Gas Production",
                    "${excelProvider.gasProduction} m³/h",
                    Icons.local_gas_station),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildParameterCard(String title, String value, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.green),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
