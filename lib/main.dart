import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const TalkinApp());
}

class TalkinApp extends StatelessWidget {
  const TalkinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
