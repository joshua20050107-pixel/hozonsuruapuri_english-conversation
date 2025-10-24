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

  // 🎨 サブグラデーション（カードやボタンの背景に）
  static final gradients = [
    LinearGradient(
      colors: [
        Color(0xFF6E7FF3), // 青紫
        Color(0xFF9BA8FF), // 淡いブルー
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ];
}
