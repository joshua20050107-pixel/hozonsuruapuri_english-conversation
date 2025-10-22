import 'package:flutter/material.dart';
import '../components/futuristic_header.dart';
import '../components/talk_tabs.dart';
import '../components/talk_card_grid.dart';
import '../theme/talkin_colors.dart';
import 'create_talk_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ⚡ FAB配置（中央固定）
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 105.0),
        child: FloatingActionButton(
          backgroundColor: TalkinColors.accent, // 💜 紫を主役に
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CreateTalkScreen()),
            );
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),

      // 🧱 メイン構造
      body: Stack(
        children: [
          // 🎨 背景をTalkinColorsから取得（グラデーションなし）
          Container(
            decoration: const BoxDecoration(
              gradient: TalkinColors.titaniumGradient,
            ),
          ),

          // 🧩 コンテンツ本体
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                const SizedBox(height: 2),
                const FuturisticHeader(),
                const SizedBox(height: 2),
                const TalkTabs(),
                const SizedBox(height: 6),
                Expanded(child: TalkCardGrid()),
              ],
            ),
          ),
        ],
      ),

      // 🌙 下ナビバー
      bottomNavigationBar: const _BottomNav(),
    );
  }
}

/// ─────────────────────────────
/// ボトムナビ（色・影・統一感を調整）
/// ─────────────────────────────
class _BottomNav extends StatelessWidget {
  const _BottomNav();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TalkinColors.card, // 🩶 カードと統一した白系
        boxShadow: [
          BoxShadow(
            color: TalkinColors.shadow,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: TalkinColors.accent, // 💜 テーマ紫
        unselectedItemColor: const Color(0xFFB5B5B5), // グレー
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Growth"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
