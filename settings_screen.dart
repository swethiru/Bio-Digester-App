import 'package:flutter/material.dart';
import 'data_history_screen.dart'; // ✅ Import the DataHistoryScreen file

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("Language"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Future: Add Language Selection
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Notifications"),
            trailing: Switch(value: true, onChanged: (value) {}),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text("Data History"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DataHistoryScreen())); // ✅ FIXED
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Log Out"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Future: Add Logout Functionality
            },
          ),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("User Account Settings"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
            Navigator.pushNamed(context, '/userSettings'); // ✅ Navigate to User Settings
            },
          ),

        ],
      ),
    );
  }
}
