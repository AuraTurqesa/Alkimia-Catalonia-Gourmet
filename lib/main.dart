import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const CataloniaGourmetApp());
}

class CataloniaGourmetApp extends StatelessWidget {
  const CataloniaGourmetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalonia Gourmet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
    );
  }
}