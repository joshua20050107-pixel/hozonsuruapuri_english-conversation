import 'package:flutter/material.dart';
import '../components/futuristic_header.dart';
import '../components/talk_tabs.dart';
import '../components/talk_card_grid.dart';
import '../theme/talkin_colors.dart';
import '../components/create_talk_modal.dart';

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
            showGeneralDialog(
              context: context,
              barrierColor: Colors.black.withOpacity(0.4),
              barrierDismissible: true,
              barrierLabel: "Dismiss",
              transitionDuration: const Duration(milliseconds: 250),
              pageBuilder: (context, animation1, animation2) {
                return Stack(
                  children: [
                    // 💥 外タップ → 閉じる
                    Positioned.fill(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => Navigator.of(context).pop(),
                        child: const SizedBox(),
                      ),
                    ),

                    // 💎 募集カード（中はunfocusのみ）
                    const Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Material(
                          type: MaterialType.transparency,
                          child: CreateTalkModal(),
                        ),
                      ),
                    ),
                  ],
                );
              },

              // 🎯 弾けるアニメーション（自然で気持ちいい）
              transitionBuilder: (context, anim1, anim2, child) {
                final curved = CurvedAnimation(
                  parent: anim1,
                  curve: Curves.easeOutBack, // 💥 開く時ポンッ
                  reverseCurve: Curves.easeInBack, // 💫 閉じる時もしゅっ
                );

                return FadeTransition(
                  opacity: curved,
                  child: ScaleTransition(
                    scale: Tween<double>(
                      begin: 0.8, // 小さめから
                      end: 1.0, // ポンッと膨らむ
                    ).animate(curved),
                    child: child,
                  ),
                );
              },
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
        color: const Color(0xFF3E65E5).withOpacity(0.95),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
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
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromARGB(255, 255, 215, 53),
          unselectedItemColor: const Color(0xFFD4DAFF),
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
