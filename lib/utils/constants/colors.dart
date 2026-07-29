import 'package:flutter/material.dart';

class AppColors {
  // Background
  static const Color bg = Color(0xFF0B1F3A);
  static const Color bg2 = Color(0xFF0d0d12);

  // Cards
  static const Color card = Color(0xFF111117);
  static const Color card2 = Color(0xFF18181f);

  // Borders
  static const Color border = Color(0xFF1e1e28);
  static const Color border2 = Color(0xFF2a2a38);

  // Text/Ink
  static const Color ink = Color(0xFFFFFFFF);
  static const Color ink2 = Color(0xFFC8A95A);
  static const Color ink3 = Color(0xFFFFFFFF);

  // Highlights
  static const Color hi = Color(0xFF0B1F3A); // neon mint
  static const Color hi2 = Color(0xFFff3c78); // hot pink
  static const Color hi3 = Color(0xFFffc93c); // amber
  static const Color hi4 = Color(0xFF3c8aff); // electric blue

  // Gradients
  static const LinearGradient mainGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0B1F3A), Color(0xFF00d9f5)],
  );
}
