import 'package:flutter/material.dart';

class TalkinColors {
  // 🎨 グラデーションパレット（透明感・光の層あり）
  static final gradients = [
    // 🟣 Lavender（上品なツヤあり紫）
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF6C5FD3), // ベース
        Color.lerp(Color(0xFF6C5FD3), Colors.white, 0.22)!, // 光の反射
        Color(0xFF9387F5), // 下に抜ける透明層
      ],
      stops: [0.0, 0.5, 1.0],
    ),

    // 🔵 Blue（爽やかで光沢のある青）
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF5C8BE5),
        Color.lerp(Color(0xFF5C8BE5), Colors.white, 0.25)!,
        Color(0xFF7AB3F8),
      ],
      stops: [0.0, 0.45, 1.0],
    ),

    // 🟡 Soft Gold（淡いゴールドにツヤを）
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFF4D877),
        Color.lerp(Color(0xFFF4D877), Colors.white, 0.28)!,
        Color(0xFFFFECA7),
      ],
      stops: [0.0, 0.5, 1.0],
    ),

    // 💚 Mint（透明感と清涼感を強調）
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF80C7B6),
        Color.lerp(Color(0xFF80C7B6), Colors.white, 0.3)!,
        Color(0xFFA2E3D4),
      ],
      stops: [0.0, 0.45, 1.0],
    ),

    // 🧡 Coral Beige（柔らかく光を反射するトーン）
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFE7AD94),
        Color.lerp(Color(0xFFE7AD94), Colors.white, 0.25)!,
        Color(0xFFF4C4AC),
      ],
      stops: [0.0, 0.5, 1.0],
    ),
  ];
}
