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
      creatorName: 'はるとと言われたい',
      creatorLevel: 'Intermediate',
      level: 'Beginner',
      message: "これからはいいことがあるように願いますよと願うまで ",
      type: 'casual',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: 'https://example.com/profile/haru.png',
    ),
    Talk(
      id: '2',
      creatorName: '進次郎54生4',
      creatorLevel: 'Beginner',
      level: 'Beginner',
      message: "ランダムトーク ",
      type: 'short',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: 'https://example.com/profile/haru.png',
    ),
    Talk(
      id: '3',
      creatorName: '海斗',
      creatorLevel: 'Advanced',
      level: 'Intermediate',
      message: "",
      type: 'casual',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: 'https://example.com/profile/haru.png',
    ),
    Talk(
      id: '4',
      creatorName: 'リナ',
      creatorLevel: 'Intermediate',
      level: 'Anyone',
      message: "アニメの話 ",
      type: 'short',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: 'https://example.com/profile/haru.png',
    ),
    Talk(
      id: '5',
      creatorName: 'はる',
      creatorLevel: 'Intermediate',
      level: 'Beginner',
      message: "これからはいいことがあるように願いますよと願うまで ",
      type: 'casual',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: 'https://example.com/profile/haru.png',
    ),
    Talk(
      id: '6',
      creatorName: 'はる',
      creatorLevel: 'Intermediate',
      level: 'Beginner',
      message: "これからはいいことがあるように願いますよと願うまで ",
      type: 'casual',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: 'https://example.com/profile/haru.png',
    ),
    Talk(
      id: '7',
      creatorName: 'はる',
      creatorLevel: 'Intermediate',
      level: 'Beginner',
      message: "これからはいいことがあるように願いますよと願うまで ",
      type: 'casual',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: 'https://example.com/profile/haru.png',
    ),
    Talk(
      id: '8',
      creatorName: 'はる',
      creatorLevel: 'Intermediate',
      level: 'Beginner',
      message: "これからはいいことがあるように願いますよと願うまで ",
      type: 'casual',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: 'https://example.com/profile/haru.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
      itemCount: talks.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 18,
        childAspectRatio: 0.74,
      ),
      itemBuilder: (context, index) {
        final talk = talks[index];

        return InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () {
            debugPrint("Tapped card: ${talk.creatorName}");
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFE0E3E7), width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ─────────── 上部：アバター＋名前＋レベル ───────────
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.black,
                        backgroundImage: NetworkImage(
                          talk.creatorImageUrl?.isNotEmpty == true
                              ? talk.creatorImageUrl!
                              : 'https://api.dicebear.com/9.x/identicon/png?seed=${talk.creatorName}',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                talk.creatorName,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // ─────────── 中央：メッセージ ───────────
                  if (talk.message.trim().isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Text(
                      talk.message,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF444444),
                        height: 1.45,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],

                  const Spacer(),

                  // ─────────── 区切り線 ───────────
                  const Divider(
                    color: Color(0xFFE5E7EB),
                    thickness: 0.8,
                    height: 18,
                  ),

                  // ─────────── 下部：募集レベル＋Join ───────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Level:',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3F4F6),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              displayLevel(talk.level),
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFF6366F1),
                        ),
                        child: Text(
                          "Join",
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
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
