import 'package:flutter/material.dart';

class BlurredGradientCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double radius = 29;
    final Offset center = Offset(radius, radius);

    final Rect rect = Rect.fromCircle(center: center, radius: radius);

    // Create a linear gradient shader
    final Gradient gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xffFF3F21), // bright red-orange
        const Color(0xffE63AE9), // orange
      ],
    );

    final Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 18); // add blur

    // Draw the blurred gradient circle
    canvas.drawCircle(center, radius - 8, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
