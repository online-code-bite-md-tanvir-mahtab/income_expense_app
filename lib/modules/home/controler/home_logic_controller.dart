import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense_app/modules/expanse/view/add_expanse.dart';

class HomeLogicController extends GetxController {
  void incrementCounter(BuildContext context) {
    // In your main file or wherever you want to navigate
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddExpensePage()),
    );
  }
}
