import 'package:flutter/material.dart';
import 'alert_screen.dart'; // ✅ Import Alert Screen

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double methaneLevel = 85; // Example value, replace with real data

    // 🚨 Check for critical conditions & show alert if needed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkCriticalConditions(context, methaneLevel);
    });

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
            buildParameterCard("Temperature", "37.5°C", Icons.thermostat),
            buildParameterCard("Oxygen Level", "21.2%", Icons.cloud),
            buildParameterCard("Humidity", "45%", Icons.water_drop),
            buildParameterCard("Methane", "65%", Icons.air),
            buildParameterCard(
                "Gas Production", "60 m³/h", Icons.local_gas_station),
          ],
        ),
      ),
    );
  }

  // 🚨 Function to check for alerts & navigate to AlertScreen
  void checkCriticalConditions(BuildContext context, double methaneLevel) {
    if (methaneLevel > 80) {
      Future.delayed(Duration.zero, () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  AlertScreen(message: "Methane Level Critically High!")),
        );
      });
    } else if (methaneLevel < 30) {
      Future.delayed(Duration.zero, () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  AlertScreen(message: "Methane Level Too Low!")),
        );
      });
    }
  }

// ✅ Widget for displaying system parameters
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
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'alert_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double methaneLevel = 40; // Example value, replace with real data

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration.zero, () => checkCriticalConditions(context, methaneLevel));
  }

  @override
  Widget build(BuildContext context) {
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
            buildParameterCard("Temperature", "37.5°C", Icons.thermostat),
            buildParameterCard("Oxygen Level", "21.2%", Icons.cloud),
            buildParameterCard("Humidity", "45%", Icons.water_drop),
            buildParameterCard("Methane", "25%", Icons.air),
            buildParameterCard(
                "Gas Production", "60 m³/h", Icons.local_gas_station),
          ],
        ),
      ),
    );
  }

  // 🚨 Function to check for alerts & navigate to AlertScreen
  void checkCriticalConditions(BuildContext context, double methaneLevel) {
    if (methaneLevel < 70) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AlertScreen(message: "Methane Level Critically High!")),
      );
    } else if (methaneLevel < 30) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AlertScreen(message: "Methane Level Too Low!")),
      );
    }
  }
}

// ✅ Widget to create parameter cards
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
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    ),
  );
}*/
/*
import 'package:flutter/material.dart';
import 'alert_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double methaneLevel = 40; // Default value (replace with actual data)
  bool _alertShown = false; // ✅ Prevent multiple alerts

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Biogas Monitor")),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.5,
                children: [
                  buildParameterCard(
                      "System Status", "Healthy", Icons.health_and_safety),
                  buildParameterCard("Temperature", "37.5°C", Icons.thermostat),
                  buildParameterCard("Oxygen Level", "21.2%", Icons.cloud),
                  buildParameterCard("Humidity", "45%", Icons.water_drop),
                  buildParameterCard("Methane", "$methaneLevel%",
                      Icons.air), // ✅ Dynamic value
                  buildParameterCard(
                      "Gas Production", "60 m³/h", Icons.local_gas_station),
                ],
              ),
            ),
          ),
          // ✅ Button to simulate methane level change (for testing)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text("Set Methane Level: $methaneLevel%",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Slider(
                  value: methaneLevel,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label: "$methaneLevel%",
                  onChanged: (newValue) {
                    setState(() {
                      methaneLevel = newValue;
                      checkCriticalConditions(context, methaneLevel);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🚨 Function to check for alerts (only when condition is met)
  void checkCriticalConditions(BuildContext context, double methaneLevel) {
    if (methaneLevel > 80 || methaneLevel < 30) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AlertScreen(
            message: methaneLevel > 80
                ? "Methane Level Critically High!"
                : "Methane Level Too Low!",
          ),
        ),
      ); // ✅ Reset alert after dismissing
    }
    ;
  }
}

// ✅ Widget to create parameter cards
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
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    ),
  );
}
*/
/*
import 'package:flutter/material.dart';
import 'alert_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double methaneLevel = 40; // ✅ Initially set to 40

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Biogas Monitor")),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.5,
                children: [
                  buildParameterCard(
                      "System Status", "Healthy", Icons.health_and_safety),
                  buildParameterCard("Temperature", "37.5°C", Icons.thermostat),
                  buildParameterCard("Oxygen Level", "21.2%", Icons.cloud),
                  buildParameterCard("Humidity", "45%", Icons.water_drop),
                  buildParameterCard("Methane", "$methaneLevel%",
                      Icons.air), // ✅ Dynamic Methane Level
                  buildParameterCard(
                      "Gas Production", "60 m³/h", Icons.local_gas_station),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🚨 Check for Alerts When Methane Level Changes
  void checkCriticalConditions(BuildContext context, double methaneLevel) {
    if (methaneLevel > 80 || methaneLevel < 30) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AlertScreen(
            message: methaneLevel > 80
                ? "Methane Level Critically High!"
                : "Methane Level Too Low!",
          ),
        ),
      );
    }
  }
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
*/