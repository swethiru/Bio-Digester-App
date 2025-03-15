import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  void signUp() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      var user = await authService.signUp(email, password);
      if (user != null) {
        print("User Signed Up: ${user.user!.email}");
      } else {
        print("Sign Up Failed!");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final authService =
                    Provider.of<AuthService>(context, listen: false);
                UserCredential? user = await authService.registerUser(
                    emailController.text, passwordController.text);

                if (user != null) {
                  Navigator.pushReplacementNamed(
                      context, '/dashboard'); // ✅ Navigate on success
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text("Sign up failed"),
                        backgroundColor: Colors.red),
                  );
                }
              },
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
