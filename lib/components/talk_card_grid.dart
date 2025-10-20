import 'package:flutter/material.dart';
import '../models/talk_model.dart';
import '../theme/talkin_colors.dart';
import 'package:google_fonts/google_fonts.dart';

LinearGradient getGradientForIndex(int index) {
  final row = index ~/ 2;
  final gradientIndex = (row + index) % TalkinColors.gradients.length;
  return TalkinColors.gradients[gradientIndex];
}

// 🔹 英語レベルを日本語で表示
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
      creatorName: 'はる',
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
      creatorName: 'リナ',
      creatorLevel: 'Intermediate',
      level: 'Anyone',
      message: "アニメの話 ",
      type: 'short',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: 'https://example.com/profile/haru.png',
    ),
    Talk(
      id: '6',
      creatorName: 'リナ',
      creatorLevel: 'Intermediate',
      level: 'Anyone',
      message: "アニメの話 ",
      type: 'short',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: 'https://example.com/profile/haru.png',
    ),
    Talk(
      id: '7',
      creatorName: 'リナ',
      creatorLevel: 'Intermediate',
      level: 'Anyone',
      message: "アニメの話 ",
      type: 'short',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: 'https://example.com/profile/haru.png',
    ),
    Talk(
      id: '8',
      creatorName: 'リナ',
      creatorLevel: 'Intermediate',
      level: 'Anyone',
      message: "アニメの話 ",
      type: 'short',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: 'https://example.com/profile/haru.png',
    ),
    Talk(
      id: '9',
      creatorName: 'リナ',
      creatorLevel: 'Intermediate',
      level: 'Anyone',
      message: "アニメの話 ",
      type: 'short',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: 'https://example.com/profile/haru.png',
    ),
    Talk(
      id: '10',
      creatorName: 'リナ',
      creatorLevel: 'Intermediate',
      level: 'Anyone',
      message: "アニメの話 ",
      type: 'short',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: 'https://example.com/profile/haru.png',
    ),
    Talk(
      id: '11',
      creatorName: 'リナ',
      creatorLevel: 'Intermediate',
      level: 'Anyone',
      message: "アニメの話 ",
      type: 'short',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: 'https://example.com/profile/haru.png',
    ),
    Talk(
      id: '12',
      creatorName: 'リナ',
      creatorLevel: 'Intermediate',
      level: 'Anyone',
      message: "アニメの話 ",
      type: 'short',
      createdAt: DateTime(2025, 1, 1),
      creatorImageUrl: 'https://example.com/profile/haru.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      itemCount: talks.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 18,
        childAspectRatio: 0.74,
      ),
      itemBuilder: (context, index) {
        final talk = talks[index];
        final gradient = getGradientForIndex(index); // ← ここで呼ぶ

        return Container(
          decoration: BoxDecoration(
            gradient: gradient, // ← グラデーション適用
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🧑 アバター
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                    talk.creatorImageUrl?.isNotEmpty == true
                        ? talk.creatorImageUrl!
                        : 'https://api.dicebear.com/9.x/identicon/png?seed=${talk.creatorName}',
                  ),
                ),
                const SizedBox(height: 8),

                // 🧾 名前＋レベル
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      talk.creatorName,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.black87,
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '[${displayLevel(talk.creatorLevel)}]',
                      style: GoogleFonts.mPlus1p(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF505050).withOpacity(0.68),
                        letterSpacing: 0.15,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // 💬 メッセージ
                if (talk.message.trim().isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 140),
                      child: Text(
                        talk.message,
                        style: GoogleFonts.mPlusRounded1c(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF212121),
                          height: 1.45,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                else
                  const SizedBox(height: 5),

                const SizedBox(height: 6),

                // 🎯 募集対象レベル
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '募集：',
                      style: GoogleFonts.mPlus1p(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF3F3F3F).withOpacity(0.86),
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFFF176), Color(0xFFFFD54F)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        displayLevel(talk.level),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: talk.message.trim().isEmpty ? 20 : 11),

                // 🚀 参加ボタン
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "参加する",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
