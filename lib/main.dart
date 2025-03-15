import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/create_account_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/graph_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/main_screen.dart';
import 'screens/user_settings_screen.dart';
import 'providers/user_provider.dart'; // ✅ Import UserProvider
import 'providers/excel_provider.dart';
import 'screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/auth_service.dart';
import 'firebase_options.dart';
/*void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
      ChangeNotifierProvider(
          create: (context) => ExcelProvider()), // ✅ Provide User Data Globally
    ], child: const MyApp()),
  );
}*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // ✅ Initialize Firebase

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ExcelProvider()),
        Provider(create: (context) => AuthService()), // ✅ Provide AuthService
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // Set the first screen
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/createAccount': (context) => const CreateAccountScreen(),
        '/main_screen': (context) => const MainScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/graph': (context) => const GraphPage(
              gasProductionData: [
                FlSpot(0, 10),
                FlSpot(1, 20),
                FlSpot(2, 30),
                FlSpot(3, 50),
                FlSpot(4, 40),
                FlSpot(5, 60),
              ],
            ),
        '/settings': (context) => const SettingsScreen(),
        '/userSettings': (context) => const UserSettingsScreen(),
      },
    );
  }
}
