import 'package:flutter/material.dart';
import 'login_screen.dart'; // ✅ Import LoginScreen

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Biogas Monitor",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Monitor and optimize your biogas process easily.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 30),

            // ✅ FIXED: Changed `login_screen()` → `LoginScreen()`
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen())),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("Get Started", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
