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

class TalkinPalettes {
  static const dreamPop = [
    // 🟢 1. Duo Green — 主役・安心・行動促進
    LinearGradient(
      colors: [Color(0xFF58CC02), Color(0xFF4CAF00)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),

    // 💛 2. Sunny Yellow — 楽観・フレンドリー・初心者歓迎
    LinearGradient(
      colors: [Color(0xFFFFE44D), Color(0xFFFFD93D)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),

    // 🩵 3. Sky Blue — 知的・清潔・誠実
    LinearGradient(
      colors: [Color(0xFF8EE7FF), Color(0xFF5FD1FF)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),

    // 🧡 4. Orange Joy — 活発・モチベーション・前進
    LinearGradient(
      colors: [Color(0xFFFFB347), Color(0xFFFF9447)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),

    // 💗 5. Pink Play — 感情・可愛さ・社交的
    LinearGradient(
      colors: [Color(0xFFFFC1CC), Color(0xFFFF9EBB)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),

    // 💜 6. Lavender Fun — やさしさ・安心・バランス
    LinearGradient(
      colors: [Color(0xFFD2B6FF), Color(0xFFBB9BFF)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),

    // 💙 7. Deep Blue — 信頼・集中・上級感
    LinearGradient(
      colors: [Color(0xFF5C9EFF), Color(0xFF407BFF)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),

    // ⚪️ 8. Neutral Gray — 休止・空白・自然な中間
    LinearGradient(
      colors: [Color(0xFFCBD3E1), Color(0xFFB5BECE)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ];
}
