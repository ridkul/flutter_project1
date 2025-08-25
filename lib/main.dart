import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/home_screen.dart'; // WelcomeScreen
import 'screens/main_navigation.dart'; // Bottom navigation controller

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const BagBagCarsApp(title: '',));
}

class BagBagCarsApp extends StatelessWidget {
  const BagBagCarsApp({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BagBagCars',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      // Start with Welcome Screen (signup/login)
      home: const WelcomeScreen(),
      // Define routes
      routes: {
        '/mainNav': (context) => const MainNavigation(), // Bottom nav
      },
    );
  }
}
