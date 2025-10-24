import 'package:flutter/material.dart';
import '../models/talk_model.dart';
import '../theme/talkin_colors.dart';
import 'package:google_fonts/google_fonts.dart';

LinearGradient getGradientForIndex(int index) {
  final row = index ~/ 2;
  final gradientIndex = (row + index) % TalkinColors.gradients.length;
  return TalkinColors.gradients[gradientIndex];
}

String displayLevel(String level) {
  switch (level) {
    case 'Beginner':
      return '初級';
    case 'Intermediate':
      return '中級';
    case 'Advanced':
      return '上級';
    case 'Anyone':
      return '誰でも';
    default:
      return level;
  }
}

class TalkCardGrid extends StatelessWidget {
  TalkCardGrid({super.key});

  final List<Talk> talks = [
    Talk(
      id: '1',
      creatorName: 'リョウ',
      creatorLevel: 'Intermediate',
      level: 'Beginner',
      message: "これからはいいことがあるように願いますよと願うまで ",
      type: 'casual',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: '',
    ),
    Talk(
      id: '2',
      creatorName: '進次郎54生4',
      creatorLevel: 'Beginner',
      level: 'Beginner',
      message: "ランダムトーク ",
      type: 'short',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: '',
    ),
    Talk(
      id: '3',
      creatorName: '海斗',
      creatorLevel: 'Advanced',
      level: 'Intermediate',
      message: "",
      type: 'casual',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: '',
    ),
    Talk(
      id: '4',
      creatorName: 'リナ',
      creatorLevel: 'Intermediate',
      level: 'Anyone',
      message: "アニメの話 ",
      type: 'short',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: '',
    ),
    Talk(
      id: '5',
      creatorName: 'はる',
      creatorLevel: 'Intermediate',
      level: 'Beginner',
      message: "これからはいいことがあるように願いますよと願うまで ",
      type: 'casual',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: '',
    ),
    Talk(
      id: '6',
      creatorName: 'はる',
      creatorLevel: 'Intermediate',
      level: 'Beginner',
      message: "これからはいいことがあるように願いますよと願うまで ",
      type: 'casual',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: "",
    ),
    Talk(
      id: '7',
      creatorName: 'はる',
      creatorLevel: 'Intermediate',
      level: 'Beginner',
      message: "これからはいいことがあるように願いますよと願うまで ",
      type: 'casual',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: '',
    ),
    Talk(
      id: '8',
      creatorName: 'はる',
      creatorLevel: 'Intermediate',
      level: 'Beginner',
      message: "これからはいいことがあるように願いますよと願うまで ",
      type: 'casual',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
      itemCount: talks.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 18,
        childAspectRatio: 0.77,
      ),
      itemBuilder: (context, index) {
        final talk = talks[index];
        debugPrint('Avatar exists: ${talk.creatorImageUrl}');

        return InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () {
            debugPrint("Tapped card: ${talk.creatorName}");
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            decoration: BoxDecoration(
              gradient: getGradientForIndex(index), // ← 背景グラデーションを追加
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  offset: const Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ─────────── 名前 ───────────
                  CircleAvatar(
                    radius: 26,
                    backgroundImage:
                        talk.creatorImageUrl != null &&
                            talk.creatorImageUrl!.isNotEmpty
                        ? NetworkImage(talk.creatorImageUrl!)
                        : const AssetImage('assets/images/default_avatar.png')
                              as ImageProvider,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    talk.creatorName,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    talk.message.isNotEmpty
                        ? talk.message
                        : (talk.type == 'short'
                              ? "Talk about anime 🎬"
                              : "Daily chat ☕"),
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),

                  // ─────────── Joinボタン ───────────
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      "Join",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
