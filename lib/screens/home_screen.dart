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
        color: const Color(
          0xFF3E65E5,
        ).withOpacity(0.95), // titaniumGradient の最下段に合わせる
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10, // ← 8 → 10 に変更
            offset: Offset(0, -2),
          ),
        ],
      ),

      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),

        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed, // ✅【変更④】固定型でアイコン揺れ防止
          selectedItemColor: const Color(0xFFE8E8FF), // ← DAD7FF → E8E8FF
          unselectedItemColor: const Color(0xFFD4DAFF), // ← BFC8FF → D4DAFF
          // ✅【変更⑥】テキスト太さ調整（視認性アップ）
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),

          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: "Growth",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
