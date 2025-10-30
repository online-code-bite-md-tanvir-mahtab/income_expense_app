import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/modules/home/controler/home_logic_controller.dart';
import 'package:income_expense_app/modules/home/widgets/home_widget.dart';
import 'package:income_expense_app/ultra_background.dart';
import 'package:get/instance_manager.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  String _selectedExpenseType = 'Expense';
  String _selectedExpenseCategory = 'Food';
  final List<String> _expenseCategories = [
    'Food',
    'Transport',
    'Entertainment',
    'Utilities',
    'Rent',
    'Other',
  ];

  // Dummy date data for the calendar
  final List<int> _daysInMonth = [23, 24, 25, 26, 27, 28, 29];
  int _selectedDay = 27;

  final HomeLogicController controller = Get.put(HomeLogicController());
  final HomeWidget homeWidget = HomeWidget();
  @override
  Widget build(BuildContext context) {
    return UltraBackground(
      myChild: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 53),
              homeWidget.buildAppBar(),
              const SizedBox(height: 13),
              buildPopToPrevious(),
              const SizedBox(height: 16),
              _buildExpenseTypeSelector(),
              const SizedBox(height: 20),
              _buildCalendar(),
              const SizedBox(height: 20),
              _buildInputField(
                title: 'Expense Title',
                hintText: 'Type here...',
              ),
              const SizedBox(height: 15),
              _buildInputField(
                title: 'Expense Amount',
                hintText: '',
                isCurrency: true,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              _buildExpenseCategoryDropdown(),
              const Spacer(),
              _buildAddExpenseButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPopToPrevious() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Back Button Container
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 0),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10,
                    sigmaY: 10,
                  ), // blur strength
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(
                        0xff00000008,
                      ).withOpacity(0.03), // translucent glass tint
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Color(0xffF4F4F4), width: 1.0),
                    ),
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [Color(0xffFF3F21), Color(0xffE63AE9)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 12,
                        color: Color(
                          0xffFF3F21,
                        ), // use white for proper gradient blend
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          // Title Text
          Text(
            'Add Expense',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF2B1C29), // dark text color
            ),
          ),
        ],
      ),
    );
  }

  // keep track of selected type

  Widget _buildExpenseTypeSelector() {
    final expenseTypes = [
      'Expense',
      'Income',
      'Savings',
      'Subscription',
      'Remainder',
    ];

    return Container(
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: expenseTypes.map((type) {
            final bool isSelected = _selectedExpenseType == type;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedExpenseType = type;
                });
              },
              child: Container(
                padding: EdgeInsets.only(top: 6, bottom: 6),
                width: 80,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: isSelected
                      ? const LinearGradient(
                          colors: [
                            Color(0xFFFF3F21), // red
                            Color(0xFFE63AE9), // pink-purple
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  color: isSelected ? null : Colors.grey.shade200,
                ),
                child: Text(
                  type,
                  style: GoogleFonts.poppins(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    // Example: one week (7 days)
    final List<int> _daysInWeek = [25, 26, 27, 28, 29, 30, 31];
    int _selectedDay = 28; // example selected day

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Header box
        Container(
          margin: const EdgeInsets.only(left: 16),
          width: 360,
          height: 31,
          decoration: BoxDecoration(
            color: Color(0xff00000008).withOpacity(0.05), // black 3% opacity
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: const Color(0xFFF4F4F4), width: 0.5),
            boxShadow: const [
              // Simulate the inner shadow by using two small outer shadows
              BoxShadow(
                color: Colors.transparent,
                offset: Offset(0, 1),
                blurRadius: 12
              ),
              BoxShadow(
                color: Colors.transparent,
                offset: Offset(0, -1),
                blurRadius: 12,
                spreadRadius: 0,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, size: 14),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {},
              ),
              Text(
                'December',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF000000),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios, size: 14),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Weekdays header
        Container(
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'M',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Text(
                'T',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Text(
                'W',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Text(
                'T',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Text(
                'F',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Text(
                'S',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Text(
                'S',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // Single row of dates
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _daysInWeek.map((day) {
            bool isSelected = day == _selectedDay;
            return GestureDetector(
              onTap: () {
                // setState(() => _selectedDay = day); // Uncomment if in StatefulWidget
              },
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? const LinearGradient(
                          colors: [Color(0xFFFF3F21), Color(0xFFE63AE9)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  color: isSelected ? null : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSelected
                        ? Colors.transparent
                        : Colors.grey.shade300,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  day.toString(),
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildInputField({
    required String title,
    required String hintText,
    bool isCurrency = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.shade400),
              border: InputBorder.none,
              prefixText: isCurrency ? '\$ ' : null,
              prefixStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExpenseCategoryDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Expense Category',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(15),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: _selectedExpenseCategory,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
              style: const TextStyle(color: Colors.black, fontSize: 16),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedExpenseCategory = newValue!;
                });
              },
              items: _expenseCategories.map<DropdownMenuItem<String>>((
                String value,
              ) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddExpenseButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFF95B7D),
            Color(0xFFFC8B5B),
          ], // Adjust colors to match the image gradient
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 15),
        onPressed: () {
          // Handle add expense button press
        },
        child: const Text(
          'Add Expense',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
