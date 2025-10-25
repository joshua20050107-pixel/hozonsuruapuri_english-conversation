import 'package:flutter/material.dart';

class TalkinColors {
  // 🌌 背景：未来的ネオングラデーション（淡い紫〜白〜青）
  static const LinearGradient titaniumGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF753DD5), // ネオン紫
      Color(0xFF5861E8), // 青紫
      Color(0xFF2D55C0), // 深青
    ],
  );

  // ⚪️ テキスト：温かみ＋未来感を共存
  static const textPrimary = Color(0xFF1A1A1A); // 濃いグレー（黒より柔らかい）
  static const textSecondary = Color(0xFF7C7B8B); // 淡いパープルグレー

  // 💜 アクセント（Talkinの象徴カラー）
  static const accent = Color(0xFF6C5FD3); // 既存維持（完璧）

  // ⚡️ サブアクセント（ネオンっぽい黄）
  static const accentNeon = Color(0xFFFFD84D); // 吹き出しなどに使用予定

  // 🪶 枠線：透明寄りで立体感を出す
  static const border = Color(0xFFE8E6F2);

  // ☁️ 影：柔らかく浮かせる
  static final shadow = Colors.black.withOpacity(0.08);

  // 🎨 サブグラデーション（カードの背景に）

  static final gradients = TalkinPalettes.dreamPop;
}

// 🎨 --- 他テーマセット（試験用） ---
class TalkinPalettes {
  // 🌈 Dream Pop
  // 🌈 Dream Pop (Optimized)
  static const dreamPop = [
    // 💜 パープル系：背景と馴染みつつ少し光る
    LinearGradient(colors: [Color(0xFFBBA9FF), Color(0xFFA590FF)]),

    // 🩵 スカイブルー系：安心感と清潔感
    LinearGradient(colors: [Color(0xFF97D2FF), Color(0xFF7FCBFF)]),

    // 💛 イエロー：差し色、注目カードに最適
    LinearGradient(
      colors: [
        Color.fromARGB(255, 252, 217, 80),
        Color.fromARGB(255, 251, 204, 36),
      ],
    ),

    // ❤️ コーラルピンク：優しさと活気を両立
    LinearGradient(colors: [Color(0xFFFFA6B0), Color(0xFFFF8F9E)]),

    // 💚 ミントグリーン：落ち着き＋新鮮さ
    LinearGradient(colors: [Color(0xFFB8F3D1), Color(0xFF9FEEC1)]),

    // ⚪️ グレー：中間調、空白エリアを自然に繋ぐ
    LinearGradient(colors: [Color(0xFFE3E3EB), Color(0xFFD1D1DA)]),

    // 🔵 ディープブルー：アクセント（上級者・特別カード向け）
    LinearGradient(colors: [Color(0xFF5A6CFF), Color(0xFF4355FF)]),
  ];

  // 💜 Cyber Pastel
  static const cyberPastel = [
    LinearGradient(colors: [Color(0xFFA48AFF), Color(0xFF8D70F9)]),
    LinearGradient(colors: [Color(0xFFB1E4FF), Color(0xFF94D9FF)]),
    LinearGradient(colors: [Color(0xFFFFC7E3), Color(0xFFFFA7D8)]),
    LinearGradient(colors: [Color(0xFFFFF3B0), Color(0xFFFFE97A)]),
    LinearGradient(colors: [Color(0xFFDADCE0), Color(0xFFC6C8CC)]),
    LinearGradient(colors: [Color(0xFFE0B7F4), Color(0xFFD19FF1)]),
    LinearGradient(colors: [Color(0xFFA6F6D9), Color(0xFF87EFC5)]),
  ];

  // 🔥 Vivid Calm
  static const vividCalm = [
    LinearGradient(colors: [Color(0xFF7B6EF6), Color(0xFF6354E8)]),
    LinearGradient(colors: [Color(0xFF9ED8FF), Color(0xFF7CC6FA)]),
    LinearGradient(colors: [Color(0xFFA8E6CF), Color(0xFF8AD8B8)]),
    LinearGradient(colors: [Color(0xFFFEE191), Color(0xFFFCD668)]),
    LinearGradient(colors: [Color(0xFFFFB3BA), Color(0xFFFF8FA3)]),
    LinearGradient(colors: [Color(0xFFE0E0E0), Color(0xFFCACACA)]),
    LinearGradient(colors: [Color(0xFF4765FF), Color(0xFF274BFF)]),
  ];
}
