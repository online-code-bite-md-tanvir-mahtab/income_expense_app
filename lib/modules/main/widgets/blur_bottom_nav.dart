import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense_app/modules/home/widgets/blurred_circle_painer.dart';
import '../controller/main_controller.dart';

class BlurBottomNav extends StatelessWidget {
  final MainController controller = Get.find<MainController>();

  BlurBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: double.infinity,
          height: 75,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.03),
                Colors.transparent,
              ],
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            border: Border.all(
              color: const Color(0xFFF4F4F4).withOpacity(0.36),
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
                    _buildNavIcon('assets/home.png', 0),
                    _buildNavIcon('assets/Layer_1.png', 1),
                    _buildNavIcon('assets/Frame.png', 2),
                    _buildNavIcon('assets/Group.png', 3),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _buildNavIcon(String asset, int index) {
    bool isSelected = controller.selectedIndex.value == index;
    return GestureDetector(
      onTap: () => controller.changeTab(index),
      child: isSelected
          ? CustomPaint(
              painter: BlurredGradientCirclePainter(),
              child: SizedBox(
                width: 40,
                height: 40,
                child: Image.asset(asset, color: Colors.white),
              ),
            )
          : SizedBox(
              width: 40,
              height: 40,
              child: Image.asset(asset, color: Colors.black54),
            ),
    );
  }
}


