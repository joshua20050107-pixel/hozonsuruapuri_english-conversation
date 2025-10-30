import 'package:flutter/material.dart';
import '../components/futuristic_header.dart';
import '../components/talk_tabs.dart';
import '../components/talk_card_grid.dart';
import '../theme/talkin_colors.dart';
import '../components/create_talk_modal.dart';
import '../screens/growth_screen.dart'; // ← これを追加！

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🧱 メイン構造（タブ切り替え対応）
      body: [
        // 0️⃣ Homeタブ
        Stack(
          children: [
            // 背景
            Container(
              decoration: const BoxDecoration(
                gradient: TalkinColors.titaniumGradient,
              ),
            ),

            // コンテンツ
            SafeArea(
              bottom: false,
              child: Column(
                children: [
                  SizedBox(height: 2),
                  FuturisticHeader(),
                  SizedBox(height: 2),
                  TalkTabs(),
                  SizedBox(height: 6),
                  Expanded(child: TalkCardGrid()),
                ],
              ),
            ),

            // 💜 Home専用の「＋」ボタン（位置を完全再現）
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: FloatingActionButton(
                  backgroundColor: TalkinColors.accent,
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
                            Positioned.fill(
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () => Navigator.of(context).pop(),
                                child: const SizedBox(),
                              ),
                            ),
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
                      transitionBuilder: (context, anim1, anim2, child) {
                        final curved = CurvedAnimation(
                          parent: anim1,
                          curve: Curves.easeOutBack,
                          reverseCurve: Curves.easeInBack,
                        );
                        return FadeTransition(
                          opacity: curved,
                          child: ScaleTransition(
                            scale: Tween<double>(
                              begin: 0.8,
                              end: 1.0,
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
            ),
          ],
        ),

        // 1️⃣ Growthタブ
        const GrowthScreen(),

        // 2️⃣ Profileタブ
        const Center(child: Text("Profile Page")),
      ][_selectedIndex],

      // 🌙 下ナビバー
      bottomNavigationBar: _BottomNav(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

/// ─────────────────────────────
/// ボトムナビ（色・影・統一感を調整）
/// ─────────────────────────────
class _BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const _BottomNav({required this.currentIndex, required this.onTap});

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
          currentIndex: currentIndex,
          onTap: onTap,
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
