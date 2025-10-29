import 'package:flutter/material.dart';
import '../models/talk_model.dart';
import '../theme/talkin_colors.dart';
import 'package:google_fonts/google_fonts.dart';

LinearGradient getGradientForIndex(int index) {
  final column = index % 2; // 列番号（2列前提）
  final row = index ~/ 2;
  final gradientIndex =
      (index * 3 + row + column) % TalkinColors.gradients.length;
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
      message: "　",
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
    Talk(
      id: '9',
      creatorName: '進次郎54生4',
      creatorLevel: 'Beginner',
      level: 'Beginner',
      message: "ランダムトーク ",
      type: 'short',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: '',
    ),
    Talk(
      id: '10',
      creatorName: '進次郎54生4',
      creatorLevel: 'Beginner',
      level: 'Beginner',
      message: "ランダムトーク ",
      type: 'short',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: '',
    ),
    Talk(
      id: '11',
      creatorName: '進次郎54生4',
      creatorLevel: 'Beginner',
      level: 'Beginner',
      message: "ランダムトーク ",
      type: 'short',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: '',
    ),
    Talk(
      id: '12',
      creatorName: '進次郎54生4',
      creatorLevel: 'Beginner',
      level: 'Beginner',
      message: "ランダムトーク ",
      type: 'short',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
      itemCount: talks.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 0.79,
      ),
      itemBuilder: (context, index) {
        final talk = talks[index];
        debugPrint('Avatar exists: ${talk.creatorImageUrl}');

        return InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () {
            debugPrint("Tapped card: ${talk.creatorName}");
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            decoration: BoxDecoration(
              gradient: getGradientForIndex(index), // ← 背景グラデーションを追加
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  offset: const Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 13),
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
                      color: const Color.fromARGB(255, 255, 255, 255),
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
                      color: const Color.fromARGB(
                        255,
                        255,
                        255,
                        255,
                      ).withOpacity(0.9),
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),

                  // ─────────── Joinボタン ───────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // 🟢 Levelタグ（左側）
                      // 🟣 コンパクトな Level タグ
                      Container(
                        width: 70, // ← 固定幅（お好みで微調整）
                        height: 28, // ← 縦も軽く固定すると見た目安定
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.65),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.scaleDown, // ← テキストを収める
                          child: Text(
                            'Level: ${displayLevel(talk.level)}',
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF3C3C3C),
                              height: 1.1,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                      ),

                      // 🤍 Joinボタン（右側）
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 11,
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
