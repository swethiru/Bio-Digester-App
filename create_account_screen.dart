import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Account")), // ✅ Added AppBar
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Create Account",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Please fill in your details to register",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),

              // Full Name Field
              const Text("Full Name", style: TextStyle(fontSize: 16)),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Enter your full name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              // Email Field
              const Text("Email", style: TextStyle(fontSize: 16)),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              // Password Field
              const Text("Password", style: TextStyle(fontSize: 16)),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              /*Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text("Sign Up",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 15),
              */
              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text("Sign Up",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 15),

              // Sign In Navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    child: const Text("Sign In",
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
}

/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart'; // ✅ Import UserProvider

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Controllers to get user input
    TextEditingController fullNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    // ✅ Temporary user database (Replace with actual database logic later)
    Map<String, dynamic> userDatabase = {};

    return Scaffold(
      appBar: AppBar(title: const Text("Create Account")),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Create Account",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Please fill in your details to register",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),

              // Full Name Field
              const Text("Full Name", style: TextStyle(fontSize: 16)),
              TextField(
                controller: fullNameController,
                decoration: const InputDecoration(
                  hintText: "Enter your full name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              // Email Field
              const Text("Email", style: TextStyle(fontSize: 16)),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Enter your email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              // Password Field
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

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    String fullName = fullNameController.text.trim();
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();

                    if (fullName.isNotEmpty &&
                        email.isNotEmpty &&
                        password.isNotEmpty) {
                      // ✅ Create new user
                      Map<String, dynamic> newUser = {
                        "fullName": fullName,
                        "position": "Plant Operator",
                        "email": email,
                        "phone": "1234567890",
                        "department": "Operations",
                        "location": "Plant C",
                      };

                      // ✅ Add new user to temporary database
                      userDatabase[email] = newUser;

                      // ✅ Update UserProvider with new user details
                      Provider.of<UserProvider>(context, listen: false)
                          .updateUser(
                        newUser["fullName"],
                        newUser["position"],
                        newUser["email"],
                        newUser["phone"],
                        newUser["department"],
                        newUser["location"],
                      );

                      // ✅ Navigate directly to Dashboard
                      Navigator.pushNamed(context, '/dashboard');
                    } else {
                      // 🚨 Show error if fields are empty
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Please fill in all fields")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text("Sign Up",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 15),

              // Sign In Navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    child: const Text("Sign In",
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
}
*/

