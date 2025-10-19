import 'package:flutter/material.dart';
import '../models/talk_model.dart';
import '../theme/talkin_colors.dart';

Color getColorForIndex(int index) {
  final row = index ~/ 2;
  final colorIndex = (row + index) % TalkinColors.palette.length;
  return TalkinColors.palette[colorIndex];
}

class TalkCardGrid extends StatelessWidget {
  const TalkCardGrid({super.key});

  final List<Talk> talks = const [
    Talk(
      id: '1',
      hostName: 'はる',
      hostLevel: '中級',
      targetLevel: '初級',
      description: "英語で料理しよう 🍳",
    ),
    Talk(
      id: '2',
      hostName: 'メイ',
      hostLevel: '初級',
      targetLevel: '初級',
      description: "ランダムトーク ☕",
    ),
    Talk(
      id: '3',
      hostName: '海斗',
      hostLevel: '上級',
      targetLevel: '中級',
      description: "週末の予定 🌇",
    ),
    Talk(
      id: '4',
      hostName: 'リナ',
      hostLevel: '中級',
      targetLevel: '中級',
      description: "アニメの話 🎬",
    ),
    Talk(
      id: '5',
      hostName: '蓮',
      hostLevel: '初級',
      targetLevel: '初級',
      description: "勉強トーク 📚",
    ),
    Talk(
      id: '6',
      hostName: '結衣',
      hostLevel: '中級',
      targetLevel: '上級',
      description: "日常会話 🌞",
    ),
    Talk(
      id: '7',
      hostName: '太郎',
      hostLevel: '上級',
      targetLevel: '中級',
      description: "未来の夢 🚀",
    ),
    Talk(
      id: '8',
      hostName: 'ナナ',
      hostLevel: '初級',
      targetLevel: '中級',
      description: "音楽トーク 🎧",
    ),
    Talk(
      id: '9',
      hostName: '翔',
      hostLevel: '中級',
      targetLevel: '上級',
      description: "食べ物トーク 🍜",
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
        mainAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        final talk = talks[index];
        final color = getColorForIndex(index);

        return Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🧑 ランダムなDiceBearアバター（名前ベース）
              CircleAvatar(
                radius: 26,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  'https://api.dicebear.com/9.x/bottts/svg?seed=${talk.hostName}',
                ),
              ),

              const SizedBox(height: 8),
              Text(
                talk.hostName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  talk.description,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '${talk.hostLevel} → ${talk.targetLevel}',
                style: const TextStyle(fontSize: 11, color: Colors.black87),
              ),
              const SizedBox(height: 10),
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
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
