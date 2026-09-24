import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Thoda aur yellowish/creamy warm tone
    const Color milkyYellowTone = Color(0xFFEBD9CE);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'CircularStd',
        scaffoldBackgroundColor: const Color(0xFF121212),
        
        // Global TextTheme set kar diya hai taaki har jagah automatic apply ho
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: milkyYellowTone),
          bodyMedium: TextStyle(color: milkyYellowTone),
          bodySmall: TextStyle(color: milkyYellowTone),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}