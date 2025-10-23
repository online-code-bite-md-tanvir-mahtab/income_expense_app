import 'package:flutter/material.dart';
import 'package:income_expense_app/modules/widget/background_painter.dart';

class UltraBackground extends StatefulWidget {
  final Widget myChild;
  const UltraBackground({super.key, required this.myChild});

  @override
  State<UltraBackground> createState() => _UltraBackgroundState();
}

class _UltraBackgroundState extends State<UltraBackground> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundPainter(),
              child: Container(),
            ),
          ),

          widget.myChild,
        ],
      ),
    );
  }
}
