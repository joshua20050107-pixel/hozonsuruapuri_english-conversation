import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/talk_provider.dart' as talk;
import '../providers/user_provider.dart';
import '../models/talk_model.dart';
import '../theme/talkin_colors.dart';

class CreateTalkModal extends ConsumerStatefulWidget {
  const CreateTalkModal({super.key});

  @override
  ConsumerState<CreateTalkModal> createState() => _CreateTalkModalState();
}

class _CreateTalkModalState extends ConsumerState<CreateTalkModal> {
  String _selectedType = 'casual';
  String _selectedLevel = 'Beginner';
  final TextEditingController _messageController = TextEditingController();

  void _createTalk() {
    final userName = ref.read(userNameProvider);
    final userLevel = ref.read(userLevelProvider);

    final newTalk = Talk(
      id: const Uuid().v4(),
      creatorName: userName,
      creatorLevel: userLevel,
      message: _messageController.text.trim(),
      level: _selectedLevel,
      type: _selectedType,
      createdAt: DateTime.now(),
    );

    talk.addTalk(ref, newTalk);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // 👇 このGestureDetectorの位置をContainerの**外**から**中（decorationの直下）**に移動
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: TalkinColors.titaniumGradient,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 4),
              blurRadius: 12,
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: GestureDetector(
              // ← ✨ここに移動
              behavior: HitTestBehavior.deferToChild, // ← 子要素の見える範囲のみ反応
              onTap: () => FocusScope.of(context).unfocus(),

              child: Container(
                color: Colors.white.withOpacity(0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 14),
                      // ... ここ以下は今のまま

                      // ─────────── トークタイプ ───────────
                      Text(
                        'トークタイプ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: TalkinColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: const EdgeInsets.all(4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Free Talk
                            Expanded(
                              child: Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10),

                                  splashFactory: InkRipple.splashFactory,
                                  splashColor: Colors.white.withOpacity(0.15),
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    FocusScope.of(
                                      context,
                                    ).unfocus(); // ← メッセージ入力のキャンセル
                                    setState(() => _selectedType = 'casual');
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 180),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: _selectedType == 'casual'
                                          ? const Color(0xFF9E8FFF)
                                          : const Color(
                                              0xFF483D9E,
                                            ).withOpacity(0.3),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Free Talk',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(
                                            _selectedType == 'casual' ? 1 : 0.7,
                                          ),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),

                            // Short Talk（同じ構造で下をコピペし、_selectedTypeを'short'に変更）
                            Expanded(
                              child: Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  splashFactory: InkRipple.splashFactory,
                                  splashColor: Colors.white.withOpacity(0.15),
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    setState(() => _selectedType = 'short');
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 180),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: _selectedType == 'short'
                                          ? const Color(0xFF9E8FFF)
                                          : const Color(
                                              0xFF483D9E,
                                            ).withOpacity(0.3),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Short Talk',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(
                                            _selectedType == 'short' ? 1 : 0.7,
                                          ),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 18),

                      // ─────────── 会話のレベル ───────────
                      Text(
                        '会話のレベル',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: TalkinColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 6),

                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 2.2,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        children: [
                          for (final level in [
                            'Beginner',
                            'Intermediate',
                            'Advanced',
                            'Anyone',
                          ])
                            Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                splashFactory: InkRipple.splashFactory,
                                splashColor: Colors.white.withOpacity(
                                  0.2,
                                ), // 波紋の明るさ
                                highlightColor: Colors.transparent,

                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  setState(() => _selectedLevel = level);
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 180),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: _selectedLevel == level
                                        ? const Color(0xFF9E8FFF)
                                        : const Color(
                                            0xFF483D9E,
                                          ).withOpacity(0.3),
                                  ),
                                  child: Center(
                                    child: Text(
                                      level,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white.withOpacity(
                                          _selectedLevel == level ? 1 : 0.7,
                                        ),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 18),

                      // ─────────── 募集メッセージ ───────────
                      Text(
                        '募集メッセージ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: TalkinColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.15),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 4,
                        ),
                        child: TextField(
                          controller: _messageController,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                          decoration: const InputDecoration(
                            hintText: '例: Let’s talk about movies 🎬',
                            hintStyle: TextStyle(color: Colors.white70),
                            border: InputBorder.none,
                          ),
                          maxLines: 2,
                          maxLength: 40,
                          buildCounter:
                              (
                                _, {
                                required currentLength,
                                required isFocused,
                                maxLength,
                              }) => null,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // ─────────── 投稿ボタン ───────────
                      // ─────────── 投稿ボタン ───────────
                      SizedBox(
                        width: double.infinity,
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            // ▼ rippleは消して、押下時だけ白い薄膜で“ふわっと”発光
                            splashFactory: NoSplash.splashFactory,
                            overlayColor: MaterialStateProperty.resolveWith((
                              states,
                            ) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.white.withOpacity(
                                  0.4,
                                ); // ← 発光の強さ（好みで調整）
                              }
                              return null; // 通常時は何も被せない
                            }),
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              // 押下の瞬間に軽く発光を描画させる時間を確保
                              await Future.delayed(
                                const Duration(milliseconds: 150),
                              );
                              _createTalk(); // ← Navigator.pop() はこの中で呼ばれる
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                color: TalkinColors.accent, // ← 元の背景色そのまま
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 14),
                                child: Center(
                                  child: Text(
                                    '募集を作成',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
