import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:income_expense_app/modules/home/widgets/blurred_circle_painer.dart';

class NavController {

  Widget _buildBottomNavigationBar() {
    return Container(
      width: 402, // Match Figma width
      height: 75, // Match Figma height
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.03), // #000000 3%
            Colors.transparent,
          ],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        border: Border.all(
          color: const Color(0xFFF4F4F4).withOpacity(0.36), // #F4F4F4 36%
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black.withOpacity(0.03), Colors.transparent],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomPaint(
                  painter: BlurredGradientCirclePainter(),
                  child: Container(
                    width: 40,
                    height: 40,
                    child: Image.asset('assets/home.png', color: Colors.white),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                  child: Image.asset(
                    'assets/Layer_1.png',
                    color: Colors.black54,
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                  child: Image.asset('assets/Frame.png', color: Colors.black54),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                  child: Image.asset('assets/Group.png', color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}