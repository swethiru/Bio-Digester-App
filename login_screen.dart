import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart'; // ✅ Import UserProvider

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Controllers to get user input
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome Back",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Please sign in to continue",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),

              // ✅ Email Field
              const Text("Email", style: TextStyle(fontSize: 16)),
              TextField(
                controller: emailController, // ✅ Get email input
                decoration: const InputDecoration(
                  hintText: "Enter your email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              // ✅ Password Field
              const Text("Password", style: TextStyle(fontSize: 16)),
              TextField(
                controller: passwordController, // ✅ Get password input
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Enter your password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // ✅ Sign In Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _handleLogin(
                        context, emailController.text, passwordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text("Sign In",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),

              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don’t have an account?"),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/createAccount'),
                    child: const Text("Sign Up",
                        style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ Function to Handle Login
  void _handleLogin(BuildContext context, String email, String password) {
    // ✅ Hardcoded User Data (Replace with actual database check later)
    Map<String, dynamic> userDatabase = {
      "michaeljohn@gmail.com": {
        "fullName": "Michael John",
        "position": "Senior Plant Manager",
        "email": "michaeljohn@gmail.com",
        "phone": "9685438990",
        "department": "Production",
        "location": "Plant B",
      },
      "newuser@example.com": {
        "fullName": "New User",
        "position": "Plant Operator",
        "email": "newuser@example.com",
        "phone": "1234567890",
        "department": "Operations",
        "location": "Plant C",
      },
    };

    // ✅ Check if user exists
    if (userDatabase.containsKey(email)) {
      var user = userDatabase[email];

      // ✅ Update UserProvider with logged-in user details
      Provider.of<UserProvider>(context, listen: false).updateUser(
        user["fullName"],
        user["position"],
        user["email"],
        user["phone"],
        user["department"],
        user["location"],
      );

      // ✅ Navigate to Dashboard
      Navigator.pushNamed(context, '/main_screen');
    } else {
      //🚨 Show error if user not found
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid email or password")),
      );
    }
  }
}
