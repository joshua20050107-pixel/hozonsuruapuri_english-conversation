import 'package:flutter/material.dart';
import '../models/talk_model.dart';
import '../theme/talkin_colors.dart';

Color getColorForIndex(int index) {
  final row = index ~/ 2;
  final colorIndex = (row + index) % TalkinColors.palette.length;
  return TalkinColors.palette[colorIndex];
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
      message: "これからはいいことがあるように願いますよ ",
      type: 'casual',
      createdAt: DateTime(2025, 1, 1),
    ),
    Talk(
      id: '2',
      creatorName: '進次郎54生4',
      creatorLevel: 'Beginner',
      level: 'Beginner',
      message: "ランダムトーク ",
      type: 'short',
      createdAt: DateTime(2025, 1, 1),
    ),
    Talk(
      id: '3',
      creatorName: '海斗',
      creatorLevel: 'Advanced',
      level: 'Intermediate',
      message: "",
      type: 'casual',
      createdAt: DateTime(2025, 1, 1),
    ),
    Talk(
      id: '4',
      creatorName: 'リナ',
      creatorLevel: 'Intermediate',
      level: 'Anyone',
      message: "アニメの話 ",
      type: 'short',
      createdAt: DateTime(2025, 1, 1),
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
        mainAxisSpacing: 18, // ← 少し間隔広げた
        childAspectRatio: 0.75, // ← 0.93 → 0.85 に変更してカードを縦にゆったり
      ),
      itemBuilder: (context, index) {
        final talk = talks[index];
        final color = getColorForIndex(index);

        return Container(
          decoration: BoxDecoration(
            color: color,
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
                    'https://api.dicebear.com/9.x/bottts/png?seed=${talk.creatorName}',
                  ),
                ),
                const SizedBox(height: 8),

                // 🧾 名前＋レベル
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      talk.creatorName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '[${displayLevel(talk.creatorLevel)}]',
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // 💬 メッセージ
                // 💬 メッセージ（空なら非表示）
                // 💬 メッセージ（空かどうかで間隔を調整）
                if (talk.message.trim().isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 140,
                      ), // ← 横幅制限で崩れ防止
                      child: Text(
                        talk.message,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF212121),
                          height: 1.3,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                else
                  const SizedBox(height: 5), // ← メッセージがない時は間隔を広げる
                // 通常の下余白
                const SizedBox(height: 6),

                // 🎯 募集対象レベル
                // 🎯 募集対象レベル
                // 🎯 募集対象レベル（グラデーションタグver）
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '募集：',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
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
                          colors: [
                            Color(0xFFFFF176),
                            Color(0xFFFFD54F),
                          ], // 柔らかい黄グラデ
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

                SizedBox(height: talk.message.trim().isEmpty ? 23 : 11),

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
