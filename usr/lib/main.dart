import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/about_screen.dart';
import 'screens/leadership_registration_screen.dart';

void main() {
  runApp(const YDNEAApp());
}

class YDNEAApp extends StatelessWidget {
  const YDNEAApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youth and Development Network in East Africa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF03A9F4), // Light Blue
          primary: const Color(0xFF0288D1),
          secondary: const Color(0xFF81D4FA),
          surface: Colors.white,
          background: const Color(0xFFF5F9FF), // Very light blue/white bg
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F9FF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF0288D1),
          elevation: 2,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0288D1),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/about': (context) => const AboutScreen(),
        '/leadership/register': (context) => const LeadershipRegistrationScreen(),
      },
    );
  }
}
