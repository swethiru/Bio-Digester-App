/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
                    //onPressed: () => Navigator.pushNamed(context, '/signup'),
                    onPressed: () async {
                      final authService =
                          Provider.of<AuthService>(context, listen: false);
                      UserCredential? userCredential = await authService.signIn(
                        emailController.text,
                        passwordController.text,
                      );

                      if (userCredential != null) {
                        Navigator.pushReplacementNamed(context,
                            '/dashboard'); // ✅ Navigate to dashboard on success
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  "Login failed. Please check your credentials."),
                              backgroundColor: Colors.red),
                        );
                      }
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.blue),
                    ),
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
 /* void _handleLogin(BuildContext context, String email, String password) {
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
*/




}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart'; // ✅ Import UserProvider

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Login Screen")),
    );
  }

  void _handleLogin(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // ✅ Get Firebase user
      User? user = userCredential.user;
      if (user != null) {
        // ✅ Update UserProvider with Firebase user details
        Provider.of<UserProvider>(context, listen: false).updateUser(
          user.displayName ??
              "User", // Use Firebase's displayName or a default value
          "Unknown Position", // Replace with actual data if stored in Firebase
          user.email ?? "No Email",
          "Unknown Phone", // Replace with actual data if stored in Firebase
          "Unknown Department",
          "Unknown Location",
        );

        // ✅ Navigate to Dashboard
        Navigator.pushNamed(context, '/main_screen');
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = "An error occurred. Please try again.";
      if (e.code == 'invalid-email') {
        errorMessage = "Invalid email format.";
      } else if (e.code == 'user-not-found') {
        errorMessage = "No user found for this email.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Incorrect password.";
      }

      // 🚨 Show error message using a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }
}
*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart'; // ✅ Import UserProvider

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Enter your email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              // ✅ Password Field
              const Text("Password", style: TextStyle(fontSize: 16)),
              TextField(
                controller: passwordController,
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.blue),
                    ),
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
  void _handleLogin(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        Provider.of<UserProvider>(context, listen: false).updateUser(
          user.displayName ?? "User",
          "Unknown Position",
          user.email ?? "No Email",
          "Unknown Phone",
          "Unknown Department",
          "Unknown Location",
        );

        Navigator.pushNamed(context, '/main_screen');
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = "An error occurred. Please try again.";
      if (e.code == 'invalid-email') {
        errorMessage = "Invalid email format.";
      } else if (e.code == 'user-not-found') {
        errorMessage = "No user found for this email.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Incorrect password.";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }
}
