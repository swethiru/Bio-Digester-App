import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'graph_screen.dart';
import 'settings_screen.dart';
import 'package:fl_chart/fl_chart.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(), // ✅ Dashboard Screen
    const GraphPage(
      // ✅ Graph Screen
      gasProductionData: [
        FlSpot(0, 10),
        FlSpot(1, 20),
        FlSpot(2, 30),
        FlSpot(3, 50),
        FlSpot(4, 40),
        FlSpot(5, 60),
      ],
    ),
    const SettingsScreen(), // ✅ Settings Screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Graph"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
