import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../character/speech_bubble.dart';
import '../character/phrases_jp.dart';

class RandomSpeechBubble extends StatefulWidget {
  const RandomSpeechBubble({super.key});

  @override
  State<RandomSpeechBubble> createState() => _RandomSpeechBubbleState();
}

class _RandomSpeechBubbleState extends State<RandomSpeechBubble> {
  late Timer _timer;
  final Random _random = Random();
  late String _currentText;

  @override
  void initState() {
    super.initState();

    // 🎲 最初からランダムで1つ選ぶ
    _currentText = phrasesJp[_random.nextInt(phrasesJp.length)];

    // 12秒ごとに切り替え
    _timer = Timer.periodic(const Duration(seconds: 12), (_) {
      setState(() {
        _currentText = phrasesJp[_random.nextInt(phrasesJp.length)];
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SpeechBubble(text: _currentText);
  }
}
