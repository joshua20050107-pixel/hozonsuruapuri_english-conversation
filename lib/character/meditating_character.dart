import 'package:flutter/material.dart';

class MeditatingCharacter extends StatefulWidget {
  const MeditatingCharacter({
    super.key,
    this.size = 56,
    this.closedDuration = const Duration(milliseconds: 900),
    this.cycle = const Duration(seconds: 6),
  });

  final double size;
  // 目を閉じている時間
  final Duration closedDuration;
  // 開↔閉のサイクル（開いている時間＋閉じている時間の周期）
  final Duration cycle;

  @override
  State<MeditatingCharacter> createState() => _MeditatingCharacterState();
}

class _MeditatingCharacterState extends State<MeditatingCharacter>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;
  bool _isClosed = false;

  @override
  void initState() {
    super.initState();

    // 呼吸スケール（ふわっと 1.00 → 1.06）
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _scale = Tween(
      begin: 1.0,
      end: 1.06,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));

    // 目の開閉（少しの間だけ閉じる → 瞑想感）
    _loopEyes();
  }

  Future<void> _loopEyes() async {
    while (mounted) {
      await Future.delayed(widget.cycle);
      if (!mounted) break;
      setState(() => _isClosed = true);
      await Future.delayed(widget.closedDuration);
      if (!mounted) break;
      setState(() => _isClosed = false);
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: Image.asset(
        _isClosed
            ? 'assets/images/character_meditate_closed.png'
            : 'assets/images/character_meditate_open.png',
        width: widget.size,
        height: widget.size,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}
