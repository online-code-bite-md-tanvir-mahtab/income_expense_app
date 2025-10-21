import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:income_expense_app/ultra_background.dart';
import 'package:income_expense_app/widget/glass_bottom_nav.dart';
import 'package:pixel_perfect/pixel_perfect.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PixelPerfect.extended(
      image: Image.asset(
        // any image file
        'assets/homglass.jpg',
        scale: 1.099,
      ),
      child: UltraBackground(
        myChild: Scaffold(
          backgroundColor: Colors.transparent,

          body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 53),
                _buildAppBar(),
                _buildTotalBalance(),
                _buildThisMonthSummary(),
                _buildTransactionsHeader(),
                _buildTransactionsList(),
                _buildBottomNavigationBar(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 21.0),
          child: CircleAvatar(
            radius: 13,
            backgroundImage: NetworkImage(
              'https://scontent.fdac110-1.fna.fbcdn.net/v/t39.30808-6/550397504_1780752429222241_1234328624691204057_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeEMnqQ85e96LOUsaLX3SjrlHvcm0bcsQ-Ue9ybRtyxD5SR_TwMhkSqCDLi6aPLrPyT3Np5eVCU4o-npcLX99cjp&_nc_ohc=XTInqKuotpUQ7kNvwHwnbB0&_nc_oc=Adm4Tz5c0sL3u0q4sJr_0ouAHk7CSDXF0_o9NwW39Sj3CCoGbAe2weoPUODZCSO_o6I&_nc_zt=23&_nc_ht=scontent.fdac110-1.fna&_nc_gid=rKr_xwLtF5z3pcfoE4d71w&oh=00_AffI66VTW-GnRBlpI4YotiJBsO9w5DXWkfJ3Lv1azJkT_w&oe=68FC6766',
            ), // Replace with your image
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 17),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // blur strength
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Color(
                    0xffF4F4F4,
                  ).withOpacity(0.15), // translucent glass tint
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: Color(0xffF4F4F4).withOpacity(0.3),
                    width: 1.0,
                  ),
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
                    Icons.settings,
                    size: 24,
                    color: Color(
                      0xffFF3F21,
                    ), // use white for proper gradient blend
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTotalBalance() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.only(top: 14, left: 6),
          child: Text(
            'Total Balance',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: Colors.black54,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.only(left: 6),
          child: Text(
            '\$500,489',
            style: GoogleFonts.anta(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFFF3F21), // Light purple for the amount
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildThisMonthSummary() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildSummaryCard(
            title: 'Expense',
            amount: '\$24,589',
            icon: Icons.show_chart,
            isExpense: true,
          ),
          _buildSummaryCard(
            title: 'Income',
            amount: '\$24,589',
            icon: Icons.trending_up,
            isExpense: false,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String amount,
    required IconData icon,
    required bool isExpense,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: isExpense ? Colors.pink[100] : Colors.green[100],
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isExpense ? Colors.pink : Colors.green,
                size: 20,
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
                Text(
                  amount,
                  style: TextStyle(
                    color: isExpense ? Colors.red : Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Transactions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            'Show All',
            style: TextStyle(
              color: Colors.purple[300],
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionsList() {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          _buildTransactionItem(
            icon: Icons.restaurant,
            iconBgColor: Colors.pink[100]!,
            iconColor: Colors.pink,
            title: 'Dinner',
            subtitle: 'Today, 12:30 AM',
            amount: '-\$89.69',
            isExpense: true,
          ),
          _buildTransactionItem(
            icon: Icons.design_services,
            iconBgColor: Colors.purple[100]!,
            iconColor: Colors.purple,
            title: 'Design Project',
            subtitle: 'Yesterday, 08:10 AM',
            amount: '+\$1500.00',
            isExpense: false,
          ),
          _buildTransactionItem(
            icon: Icons.local_pharmacy,
            iconBgColor: Colors.orange[100]!,
            iconColor: Colors.orange,
            title: 'Medicine',
            subtitle: 'Today, 12:30 AM',
            amount: '-\$369.54',
            isExpense: true,
          ),
          _buildTransactionItem(
            icon: Icons.shopping_basket,
            iconBgColor: Colors.red[100]!,
            iconColor: Colors.red,
            title: 'Grocery',
            subtitle: 'Today, 12:30 AM',
            amount: '-\$126.21',
            isExpense: true,
          ),
          _buildTransactionItem(
            icon: Icons.shopping_basket,
            iconBgColor: Colors.red[100]!,
            iconColor: Colors.red,
            title: 'Grocery',
            subtitle: 'Today, 12:30 AM',
            amount: '-\$126.21',
            isExpense: true,
          ),
          _buildTransactionItem(
            icon: Icons.shopping_basket,
            iconBgColor: Colors.red[100]!,
            iconColor: Colors.red,
            title: 'Grocery',
            subtitle: 'Today, 12:30 AM',
            amount: '-\$126.21',
            isExpense: true,
          ),
          _buildTransactionItem(
            icon: Icons.shopping_basket,
            iconBgColor: Colors.red[100]!,
            iconColor: Colors.red,
            title: 'Grocery',
            subtitle: 'Today, 12:30 AM',
            amount: '-\$126.21',
            isExpense: true,
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String amount,
    required bool isExpense,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              color: isExpense ? Colors.red[700] : Colors.green[700],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, color: Colors.purple[300]),
          Icon(Icons.credit_card, color: Colors.black54),
          Icon(Icons.pie_chart, color: Colors.black54),
          Icon(Icons.settings, color: Colors.black54),
        ],
      ),
    );
  }
}
