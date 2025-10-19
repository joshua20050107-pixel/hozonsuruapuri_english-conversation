import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedCharacter extends StatefulWidget {
  const AnimatedCharacter({super.key});

  @override
  State<AnimatedCharacter> createState() => _AnimatedCharacterState();
}

class _AnimatedCharacterState extends State<AnimatedCharacter>
    with SingleTickerProviderStateMixin {
  String _currentFrame = 'assets/images/character_open.png';
  late Timer _faceTimer;
  bool _firstChangeDone = false;

  // 🌬 呼吸アニメーション用
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // 🫁 呼吸アニメーション設定
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // 1呼吸の長さ
    )..repeat(reverse: true); // 吸って→吐いてを繰り返す

    _scaleAnimation = Tween(
      begin: 1.0,
      end: 1.07,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // 🙂 表情切り替え（7秒ごと）
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await precacheImage(
        const AssetImage('assets/images/character_open.png'),
        context,
      );
      await precacheImage(
        const AssetImage('assets/images/character_normal.png'),
        context,
      );

      Future.delayed(const Duration(seconds: 1), () {
        _startFaceChange();
      });
    });
  }

  void _startFaceChange() {
    _faceTimer = Timer.periodic(const Duration(seconds: 6), (_) {
      setState(() {
        if (!_firstChangeDone) {
          _firstChangeDone = true;
          return;
        }
        _currentFrame = _currentFrame == 'assets/images/character_open.png'
            ? 'assets/images/character_normal.png'
            : 'assets/images/character_open.png';
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _faceTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: const Offset(32, 7),
          child: Transform.scale(
            scale: _scaleAnimation.value, // ← ← ← 呼吸スケール反映！
            child: Image.asset(_currentFrame, width: 130, height: 150),
          ),
        );
      },
    );
  }
}
