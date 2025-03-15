import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  final String message;

  const AlertScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ALERT"), backgroundColor: Colors.red),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.warning, color: Colors.red, size: 80),
              const SizedBox(height: 10),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              const SizedBox(height: 20),

              // View Solutions Button
              ElevatedButton(
                onPressed: () {
                  // Future: Add solution screen navigation
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("View Solutions"),
              ),
              const SizedBox(height: 10),

              // Dismiss Button
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Dismiss", style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
