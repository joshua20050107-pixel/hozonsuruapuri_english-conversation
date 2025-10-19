import 'package:flutter/material.dart';
import '../components/futuristic_header.dart';
import '../components/talk_tabs.dart';
import '../components/talk_card_grid.dart';

// ...imports 省略

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF962FBF), // 紫
              Color(0xFF4F5BD5), // 青紫
            ],
          ),
        ),

        child: SafeArea(
          // 下側の安全領域はナビの分だけ無効化（Gridエリアを広げる）
          bottom: false,
          child: Column(
            children: const [
              SizedBox(height: 2), // ← 12 → 6 に圧縮
              FuturisticHeader(),
              SizedBox(height: 2), // ← 20 → 8 に圧縮
              TalkTabs(),
              SizedBox(height: 6), // ← 16 → 8 に圧縮
              Expanded(child: TalkCardGrid()), // ← Gridに最大の高さを渡す
            ],
          ),
        ),
      ),
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
          colors: [Color(0xFF4C3FD9), Color(0xFF8F79FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Color(0xFFFFD84D),
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
