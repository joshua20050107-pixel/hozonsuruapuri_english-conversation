import 'package:flutter/material.dart';
import '../theme/talkin_colors.dart';
import '../character/meditating_character.dart';

class GrowthScreen extends StatelessWidget {
  const GrowthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int totalTalks = 12;
    int streak = 5;
    int level = totalTalks ~/ 3;
    int exp = totalTalks % 3;
    double progress = exp / 3;
    int monthlyTalks = 4;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: TalkinColors.titaniumGradient,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🧘 吹き出しを含むヘッダーを外に出す
              const _HeaderSection(),

              // 👇 残りの部分だけ Padding 内に入れる
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),

                      // 🌿 統計カード
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _StatCard(
                            icon: Icons.all_inclusive,
                            label: 'All-Time',
                            value: '$totalTalks',
                          ),
                          _StatCard(
                            icon: Icons.calendar_today_outlined,
                            label: 'Monthly',
                            value: '$monthlyTalks',
                          ),
                          _StatCard(
                            icon: Icons.local_fire_department_outlined,
                            label: 'Streak🔥',
                            value: '$streak',
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      // 🧩 レベル表示
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Lv. $level',
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w800,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 20),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: TweenAnimationBuilder<double>(
                                tween: Tween<double>(
                                  begin: 0,
                                  end: (progress + 0.4).clamp(0.0, 1.0),
                                ),
                                duration: const Duration(milliseconds: 1200),
                                curve: Curves.easeOutCubic,
                                builder: (context, value, _) {
                                  return LinearProgressIndicator(
                                    value: value,
                                    minHeight: 12,
                                    backgroundColor: Colors.white.withOpacity(
                                      0.4,
                                    ),
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                          Color(0xFF7C5CFF),
                                        ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'あと ${3 - exp} トークでレベルアップ',
                              style: const TextStyle(
                                color: Colors.black45,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      // 📊 グラフカード
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const Center(
                            child: Text(
                              '📊 グラフ（後で実装）',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ────────────────────────────────
// 🧘 Header: キャラ + セリフ
class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.5, bottom: 21),
      child: FloatingWrapper(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🧘 キャラ
            Transform.translate(
              offset: const Offset(3, 14),
              child: Transform.scale(
                scale: 1.17,
                child: const SizedBox(
                  width: 100,
                  height: 100,
                  child: MeditatingCharacter(),
                ),
              ),
            ),

            const SizedBox(width: 18),

            // 💬 吹き出しを独立してゆらす
            FloatingWrapper(
              offset: 1.5, // ← 動きを小さく
              duration: const Duration(seconds: 3),
              child: Transform.translate(
                offset: const Offset(-7, 20), // ← キャラより速く
                child: // 💬 吹き出し
                Flexible(
                  child: Align(
                    alignment: Alignment.centerLeft, // ← 左寄せで自然に
                    child: FloatingWrapper(
                      offset: 1.5,
                      duration: const Duration(seconds: 3),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 260,
                          minHeight: 85,
                          // ← 吹き出しの最大幅を固定（調整OK）
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                              ),
                              BoxShadow(
                                color: Colors.white.withOpacity(0.7),
                                blurRadius: 10,
                                offset: const Offset(0, -1),
                              ),
                            ],
                          ),
                          child: const Text(
                            'Stay calm, stay consistent 🌿',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              height: 1.3,
                              shadows: [
                                Shadow(
                                  color: Colors.black26,
                                  blurRadius: 6,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ), // ← 吹き出しFloatingWrapper閉じ
          ],
        ), // ← Row閉じ
      ), // ← 外側FloatingWrapper閉じ
    ); // ← Padding閉じ
  }
}

// ────────────────────────────────
// ステータスカード
// ────────────────────────────────
class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 85,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFF6B5BFF), size: 26),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class FloatingWrapper extends StatefulWidget {
  final Widget child;
  final double offset;
  final Duration duration;

  const FloatingWrapper({
    super.key,
    required this.child,
    this.offset = 3.0,
    this.duration = const Duration(seconds: 4),
  });

  @override
  State<FloatingWrapper> createState() => _FloatingWrapperState();
}

class _FloatingWrapperState extends State<FloatingWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final double t = _controller.value;
        final double offsetY = 3 * (1 - (t * 2 - 1).abs()); // ゆっくり上下
        final double scale = 1.0 + 0.01 * (1 - (t * 2 - 1).abs()); // 呼吸感
        return Transform.translate(
          offset: Offset(0, -offsetY),
          child: Transform.scale(scale: scale, child: child),
        );
      },
      child: widget.child,
    );
  }
}
