import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  void paintBackground(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.5),
        width: size.width,
        height: size.height,
      ),
      Paint()..color = Color(0XFFFFF4FE),
    );
  }

  void drawSquare(Canvas canvas, Size size) {
    final paint1 = Paint();
    paint1
      ..shader = const LinearGradient(
        colors: [
          Color(0xFFFFC1E3), // light pink
          Color(0xFFD0B3FF), // soft purple
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 50)
      ..style = PaintingStyle.fill;

    // Centered around the top-right 60% horizontal position
    final double centerX = size.width * 0.8; // 60% of width (to the right)
    final double centerY = size.height * 0.01; // top area (20% down)

    const double squareSize = 150;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(centerX, centerY),
          width: squareSize + 50,
          height: squareSize,
        ),
        const Radius.circular(40),
      ),
      paint1,
    );
  }

  void drawAbstractShapes(Canvas canvas, Size size) {
    // Path path = Path();
    // final paint = Paint();
    // path.moveTo(size.width * 1.2, 0);
    // print("the size: ${size.width}");
    // path.quadraticBezierTo(
    //   size.width * 1.2,
    //   300,
    //   size.width * 0.4,
    //   size.height * 0.6,
    // );
    // path.quadraticBezierTo(
    //   size.width * 0.1,
    //   size.height * 0.7,
    //   -100,
    //   size.height * 1.2,
    // );
    // path.lineTo(-50, -50);
    // path.close();
    // paint.maskFilter = MaskFilter.blur(BlurStyle.normal, 100);
    // canvas.drawPath(
    //   path,
    //   paint
    //     ..color = Colors.purple.shade200
    //     ..style = PaintingStyle.fill,
    // );
    drawSquare(canvas, size);
  }

  void drawEllipse(Canvas canvas, Size size, Paint paint) {
    final path3 = Path();
    final paint3 = Paint();

    // Optional: if you want to use the path later for effects
    canvas.drawPath(path3, paint3);

    // Draw ellipse on the left side
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(0, size.height * 0.4), // ← moved to left
        width: 250,
        height: 170,
      ),
      paint3
        ..shader = const LinearGradient(
          colors: [
            Color(0xFFFFC1E3), // light pink
            Color(0xFFD0B3FF), // soft purple
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 100)
        ..style = PaintingStyle.fill,
    );
  }

  void drawTriangle(Canvas canvas, Size size, Paint paint) {
    final path = Path();
    final offset = Offset(200, size.height * 0.4);
    path.moveTo(offset.dx, offset.dy);
    path.lineTo(offset.dx + 250, offset.dy + 200);
    path.lineTo(offset.dx - 250, offset.dy + 500);
    canvas.drawPath(path, paint..color = Colors.green);
    path.close();
  }

  void drawCircle(Canvas canvas, Size size, Paint paint) {
    paint..color = Colors.orange.shade100;
    paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 100);

    canvas.drawCircle(Offset(size.width * 0.6, 350), 100, paint);
  }

  void drawCircleTop(Canvas canvas, Size size, Paint paint) {
    paint..color = Colors.orange.shade100;
    // paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 100);

    canvas.drawCircle(Offset(size.width * 0.2, 150), 90, paint);
  }

  void drawWidthCircle(Canvas canvas, Size size) {
    final paint = Paint();
    paint
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(255, 108, 97, 103), // light pink
          Color(0xFFD0B3FF), // soft purple
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 100)
      ..style = PaintingStyle.fill;

    // Draw a circle near the center (same vertical position as your square)
    canvas.drawCircle(
      Offset(size.width * -0.1, size.height * 1), // bottom-left position
      size.width * 0.3, // radius = 10% of screen width (matches 0.2 width)
      paint,
    );
  }

  void drawWidthCircleRight(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(255, 77, 73, 75), // light pink
          Color(0xFFD0B3FF), // soft purple
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 100)
      ..style = PaintingStyle.fill;

    // Draw a circle in the bottom-right corner
    canvas.drawCircle(
      Offset(size.width * 1.1, size.height * 1), // bottom-right position
      size.width * 0.3, // radius (same size as the left one)
      paint,
    );
  }

  void drawConstraintBlobs(Canvas canvas, Size size, Paint paint) {
    // paint.maskFilter = MaskFilter.blur(BlurStyle.normal, 30);
    // paint.blendMode = BlendMode.overlay;
    // drawTriangle(canvas, size, paint);

    drawCircle(canvas, size, paint);
    drawEllipse(canvas, size, paint);
    drawCircleTop(canvas, size, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    paintBackground(canvas, size);
    drawAbstractShapes(canvas, size);
    final paint = Paint();
    drawConstraintBlobs(canvas, size, paint);
    drawWidthCircle(canvas, size);
    drawWidthCircleRight(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
