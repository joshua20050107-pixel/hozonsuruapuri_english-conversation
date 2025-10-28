import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: TalkinApp()));
}

class TalkinApp extends StatelessWidget {
  const TalkinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Talkin',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F9FA), // 🩶 Turo風の背景（白〜薄灰）
        textTheme: GoogleFonts.interTextTheme(
          // 🔤 Interフォント（世界標準）
          Theme.of(context).textTheme,
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF5A4FCF), // 💜 落ち着いた紫（アクセント）
          secondary: Color(0xFF111111), // 🖤 テキストなどに使う自然な黒
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
