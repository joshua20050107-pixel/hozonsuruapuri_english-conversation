import 'package:flutter/material.dart';
import '../character/animated_character.dart';
import '../character/speech_bubble.dart';

class FuturisticHeader extends StatelessWidget {
  const FuturisticHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: SizedBox(
        width: double.infinity,
        height: 100, // 高さを少し詰める
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // 🤖 キャラ
            const Positioned(
              left: 0,
              bottom: 0,
              child: SizedBox(
                width: 80,
                height: 110,
                child: AnimatedCharacter(),
              ),
            ),

            // 💬 吹き出し（キャラ横で膨らむように調整）
            const Positioned(
              left: 115, // ← 以前より +14 移動。キャラと被らない距離
              top: 2, // ← 少し下げて、キャラの口と高さを合わせる
              child: SpeechBubble(text: 'whta you wanna talk about?'),
            ),
          ],
        ),
      ),
    );
  }
}
