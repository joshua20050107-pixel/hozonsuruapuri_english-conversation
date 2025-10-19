import 'package:flutter/material.dart';

class TalkinColors {
  static const palette = [
    Color(0xFFBFA5FF), // lavender
    Color(0xFF9FD5FF), // sky
    Color(0xFFFFE070), // yellow
    Color(0xFFA9FFF3), // mint
    Color(0xFFFFC1E3), // pink
    Color(0xFFFFB6A0), // coral
    Color(0xFFB8FFC9), // green
  ];
}

Color assignColor(String name) {
  final index = name.hashCode % TalkinColors.palette.length;
  return TalkinColors.palette[index];
}
