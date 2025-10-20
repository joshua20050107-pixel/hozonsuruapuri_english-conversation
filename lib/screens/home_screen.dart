import 'package:flutter/material.dart';
import '../components/futuristic_header.dart';
import '../components/talk_tabs.dart';
import '../components/talk_card_grid.dart';
import 'create_talk_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✨ FABを中央に浮かせる
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 90.0), // ← 上に少し浮かせる
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF4F5BD5),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CreateTalkScreen()),
            );
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),

      body: Stack(
        children: [
          // 🎨 背景グラデーション（Soft Professional）
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFEBEDF9), // 上：白寄りラベンダーグレー
                  Color(0xFFD9E1F5), // 中：青みグレー
                  Color(0xFFC8D8F0), // 下：淡いブルー
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
          ),

          // ☀️ 光レイヤー（右上からの柔らかい反射）
          Positioned(
            top: -100,
            right: -80,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Colors.white.withOpacity(0.45), Colors.transparent],
                  radius: 0.9,
                ),
              ),
            ),
          ),

          // 🧩 コンテンツ
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
/// ボトムナビ
/// ─────────────────────────────
class _BottomNav extends StatelessWidget {
  const _BottomNav();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF4C3FD9), // 左：紫寄りの深色
            Color(0xFF8F79FF), // 右：柔らかいラベンダー
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Color(0xFFFFD84D), // ゴールド
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Growth"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
