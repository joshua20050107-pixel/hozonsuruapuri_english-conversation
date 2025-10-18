import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpeechBubble extends StatelessWidget {
  final String text;

  const SpeechBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 240, // 横幅を制限
      ),
      child: CustomPaint(
        painter: SpeechBubblePainter(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
              height: 1.3,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}

class SpeechBubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFD84D)
      ..style = PaintingStyle.fill;

    final r = 14.0;
    final path = Path();

    // 吹き出しの角丸四角を描く
    path.addRRect(
      RRect.fromLTRBR(0, 0, size.width, size.height, Radius.circular(r)),
    );

    // 👈 左中央（少し下）にしっぽを描く
    path.moveTo(0, size.height / 2 - 4);
    path.lineTo(-10, size.height / 2 + 4);
    path.lineTo(0, size.height / 2 + 6);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
