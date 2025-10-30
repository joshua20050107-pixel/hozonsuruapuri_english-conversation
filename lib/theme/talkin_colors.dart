import 'package:flutter/material.dart';

/// ----------------------
/// 🎨 Talkin共通テーマカラー
/// ----------------------
class TalkinColors {
  // 🌌 メイングラデーション（ホーム画面など）
  static const LinearGradient titaniumGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF753DD5), Color(0xFF5861E8), Color(0xFF2D55C0)],
  );

  // ⚪️ テキストカラー
  static const textPrimary = Color(0xFF1A1A1A);
  static const textSecondary = Color(0xFF7C7B8B);

  // 💜 アクセント
  static const accent = Color(0xFF6C5FD3);
  static const accentNeon = Color(0xFFFFD84D);

  // 🪶 枠線・影
  static const border = Color(0xFFE8E6F2);
  static final shadow = Colors.black.withOpacity(0.08);

  // 🎨 カードなどで使うサブグラデーション群
  static final gradients = TalkinPalettes.dreamPop;

  // 🌱 特定画面専用カラー群
  static const growth = GrowthColors();
}

/// ----------------------
/// 🌱 Growth画面専用カラー
/// ----------------------
class GrowthColors {
  const GrowthColors();

  static const LinearGradient growthGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFB57CFF), // 明るいパープル — 成長の光
      Color(0xFF6F8BFF), // 澄んだ青紫 — 浄化感・上昇感
      Color(0xFF4FA9FF), // 輝くライトブルー — ゴールの光
    ],
  );
}

/// ----------------------
/// 💎 サブパレット集（カードなど）
class TalkinPalettes {
  static const dreamPop = [
    LinearGradient(
      colors: [Color(0xFF58CC02), Color(0xFF4CAF00)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [Color(0xFFFFE44D), Color(0xFFFFD93D)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [Color(0xFF8EE7FF), Color(0xFF5FD1FF)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [Color(0xFFFFB347), Color(0xFFFF9447)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [Color(0xFFFFC1CC), Color(0xFFFF9EBB)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [Color(0xFFD2B6FF), Color(0xFFBB9BFF)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [Color(0xFF5C9EFF), Color(0xFF407BFF)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [Color(0xFFCBD3E1), Color(0xFFB5BECE)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ];
}
