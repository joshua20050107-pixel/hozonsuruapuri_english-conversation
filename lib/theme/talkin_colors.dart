import 'package:flutter/material.dart';

class TalkinColors {
  // 🌫 背景（少しグレーにして立体感を出す）
  static const LinearGradient titaniumGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF6F7FA), Color(0xFFE3E7EE), Color(0xFFD0D6E0)],
  );

  // 🩶 カード
  static const card = Color(0xFFFAFAFA);

  // ⚫️ テキスト
  static const textPrimary = Color(0xFF111111);
  static const textSecondary = Color.fromARGB(255, 157, 156, 156);

  // 💜 アクセント（変えずに維持）
  static const accent = Color(0xFF5A4FCF);

  // 🪶 枠線
  static const border = Color(0xFFE0E0E0);

  // ☁️ 影
  static final shadow = Colors.black.withOpacity(0.07);

  // 🎨 グラデーション（必要なとき用）
  static final gradients = [
    LinearGradient(
      colors: [Color(0xFFFFFFFF), Color(0xFFFAFAFA)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ];
}
