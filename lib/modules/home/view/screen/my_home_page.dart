import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:income_expense_app/modules/home/controler/home_logic_controller.dart';
import 'package:income_expense_app/modules/home/widgets/home_widget.dart';
import 'package:income_expense_app/ultra_background.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeLogicController controller =Get.put(HomeLogicController());
  final HomeWidget homeWidget = HomeWidget();

  

  @override
  Widget build(BuildContext context) {
    return UltraBackground(
      myChild: Scaffold(
        backgroundColor: Colors.transparent,

        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 53),
              homeWidget.buildAppBar(),
              homeWidget.buildTotalBalance(),
              homeWidget.buildThisMonthSummary(),
              homeWidget.buildTransactionsHeader(),
              homeWidget.buildTransactionsList(),
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 15, left: 120),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xffFF3F21), Color(0xFFE63AE9)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              // Action when button is pressed
              controller.incrementCounter();
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
