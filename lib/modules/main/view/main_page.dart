import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense_app/modules/home/view/screen/my_home_page.dart';
import 'package:income_expense_app/modules/main/controller/main_controller.dart';
import 'package:income_expense_app/modules/main/widgets/blur_bottom_nav.dart';
import 'package:income_expense_app/ultra_background.dart';

class MainPage extends StatelessWidget {
  final MainController controller = Get.put(MainController());

  final List<Widget> pages = const [
    MyHomePage(),
    Center(child: Text("Stats Screen")),
    Center(child: Text("Add Transaction")),
    Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return UltraBackground(
      myChild: Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(() => pages[controller.selectedIndex.value]),
        bottomNavigationBar: BlurBottomNav(),
      ),
    );
  }

  Widget _buildBottomNavigationBar(int currentIndex, Function(int) onTabChange) {
    return Container(
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black.withOpacity(0.03), Colors.transparent],
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavIcon('assets/home.png', 0, currentIndex, onTabChange),
              _buildNavIcon('assets/Layer_1.png', 1, currentIndex, onTabChange),
              _buildNavIcon('assets/Frame.png', 2, currentIndex, onTabChange),
              _buildNavIcon('assets/Group.png', 3, currentIndex, onTabChange),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavIcon(
      String asset, int index, int currentIndex, Function(int) onTabChange) {
    final bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTabChange(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: isSelected
              ? const LinearGradient(
                  colors: [Color(0xffFF3F21), Color(0xFFE63AE9)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
        ),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            isSelected ? Colors.white : Colors.black54,
            BlendMode.srcIn,
          ),
          child: Image.asset(asset),
        ),
      ),
    );
  }
}

