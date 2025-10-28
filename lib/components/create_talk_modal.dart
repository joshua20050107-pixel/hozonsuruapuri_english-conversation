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
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: TalkinColors.titaniumGradient,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.transparent, width: 0), // ← 白縁を完全無効化
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05), // ← 少し弱めにする
              offset: const Offset(0, 4),
              blurRadius: 12, // ← 前より小さく
              spreadRadius: 0, // ← 外に広がらない
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge, // ← はみ出し描画を防止
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              color: Colors.white.withOpacity(0.0), // ← 完全透明
              child: SingleChildScrollView(
                // 👇ここ以下はそのまま
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 14),

                    // ─────────── タイトル ───────────
                    Text(
                      'トークタイプ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: TalkinColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // ─────────── トグル ───────────
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ─────────── Free Talk ───────────
                          Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  setState(() => _selectedType = 'casual'),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 180),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _selectedType == 'casual'
                                      ? const Color(
                                          0xFF9E8FFF,
                                        ) // 💜 少し深い青紫で光を抑える
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
                          const SizedBox(width: 8),

                          // ─────────── Short Talk ───────────
                          Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  setState(() => _selectedType = 'short'),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 180),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _selectedType == 'short'
                                      ? const Color(
                                          0xFF9E8FFF,
                                        ) // 💜 少し深い青紫で光を抑える
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
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ─────────── レベル選択 ───────────
                    Text(
                      '求める相手のレベル',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: TalkinColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: TalkinColors.border),
                        color: Colors.white.withOpacity(0.8),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedLevel,
                          items: ['Beginner', 'Intermediate', 'Advanced']
                              .map(
                                (level) => DropdownMenuItem(
                                  value: level,
                                  child: Text(level),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedLevel = value!;
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ─────────── 募集メッセージ ───────────
                    Text(
                      '募集メッセージ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: TalkinColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: '例: Let’s talk about movies 🎬',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: TalkinColors.border),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: TalkinColors.accent,
                            width: 1.5,
                          ),
                        ),
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

                    const SizedBox(height: 20),

                    // ─────────── 投稿ボタン ───────────
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _createTalk,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TalkinColors.accent,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                        ),
                        child: const Text(
                          '募集を作成',
                          style: TextStyle(fontSize: 16, color: Colors.white),
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
    );
  }
}
