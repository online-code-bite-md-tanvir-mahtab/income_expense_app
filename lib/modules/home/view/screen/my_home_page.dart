import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/modules/home/widgets/blurred_circle_painer.dart';
import 'package:income_expense_app/ultra_background.dart';

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
              _buildAppBar(),
              _buildTotalBalance(),
              _buildThisMonthSummary(),
              _buildTransactionsHeader(),
              _buildTransactionsList(),
              _buildBottomNavigationBar(),
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 70, left: 120),
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
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        // This trailing comma makes auto-formatting nicer for build methods.
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
          padding: EdgeInsetsGeometry.only(left: 6, top: 0),
          child: Text(
            '\$500,489',
            style: GoogleFonts.anta(
              fontSize: 32,
              fontWeight: FontWeight.w500,
              color: const Color(0xFFFF3F21), // Light purple for the amount
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildThisMonthSummary() {
    return Container(
      margin: EdgeInsetsGeometry.only(top: 10),
      child: Column(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                // Rectangle 4094 (background curved shape)
                Positioned(
                  bottom: -8, // overlap half of the button
                  child: Container(
                    width: 80,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                      border: Border(
                        top: BorderSide(
                          color: const Color(0xff2B1C2933).withOpacity(0.2),
                          width: 1.2,
                        ),
                        left: BorderSide(
                          color: const Color(0xff2B1C2933).withOpacity(0.2),
                          width: 1.2,
                        ),
                        right: BorderSide(
                          color: const Color(0xff2B1C2933).withOpacity(0.2),
                          width: 1.2,
                        ),
                        bottom: BorderSide.none, // no bottom border
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                  ),
                ),

                // Main "This Month" button
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Color(0xFFFF0080), Color(0xFFFF4DA6)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(bounds),
                    child: Text(
                      'This Month',
                      style: GoogleFonts.poppins(
                        fontSize: 7,
                        fontWeight: FontWeight.w600,
                        color: Colors.white, // Use white for gradient text
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSummaryCard(
                title: 'Expense',
                amount: '\$24,589',
                icon: Icons.trending_down,
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
    return Container(
      width: 160, // Fixed width
      padding: EdgeInsets.only(left: 14, right: 2, bottom: 4, top: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff2B1C29), // Light purple for the amount
                ),
              ),
              Text(
                amount,
                style: GoogleFonts.anta(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: isExpense
                      ? const Color(0xffF32F42)
                      : Color(0xff079933), // Light purple for the amount
                ),
              ),
            ],
          ),
          SizedBox(width: 66),
          Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: isExpense ? Color(0xffFF3F21) : Color(0xffFF3F21),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              icon,
              color: isExpense ? Colors.white : Colors.white,
              size: 15.5,
            ),
          ),
        ],
      ),
    );
  }

  // Usage

  Widget _buildTransactionsHeader() {
    return Padding(
      padding: EdgeInsetsGeometry.only(
        left: 16,
        right: 16,
        top: 34,
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Transactions',
            style: GoogleFonts.exo(
              fontSize: 14.5,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          Text(
            'Show All',
            style: GoogleFonts.inter(
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              color: Color(0xff5B4950),
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
          SizedBox(height: 12),
          _buildTransactionItem(
            icon: Icons.design_services,
            iconBgColor: Colors.purple[100]!,
            iconColor: Colors.purple,
            title: 'Design Project',
            subtitle: 'Yesterday, 08:10 AM',
            amount: '+\$1500.00',
            isExpense: false,
          ),
          SizedBox(height: 12),
          _buildTransactionItem(
            icon: Icons.local_pharmacy,
            iconBgColor: Colors.orange[100]!,
            iconColor: Colors.orange,
            title: 'Medicine',
            subtitle: 'Today, 12:30 AM',
            amount: '-\$369.54',
            isExpense: true,
          ),
          SizedBox(height: 12),
          _buildTransactionItem(
            icon: Icons.shopping_basket,
            iconBgColor: Colors.red[100]!,
            iconColor: Colors.red,
            title: 'Grocery',
            subtitle: 'Today, 12:30 AM',
            amount: '-\$126.21',
            isExpense: true,
          ),
          SizedBox(height: 12),
          _buildTransactionItem(
            icon: Icons.shopping_basket,
            iconBgColor: Colors.red[100]!,
            iconColor: Colors.red,
            title: 'Grocery',
            subtitle: 'Today, 12:30 AM',
            amount: '-\$126.21',
            isExpense: true,
          ),
          SizedBox(height: 12),
          _buildTransactionItem(
            icon: Icons.shopping_basket,
            iconBgColor: Colors.red[100]!,
            iconColor: Colors.red,
            title: 'Grocery',
            subtitle: 'Today, 12:30 AM',
            amount: '-\$126.21',
            isExpense: true,
          ),
          SizedBox(height: 12),
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
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 8,
              right: 8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xff00000008).withOpacity(0.05),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Colors.white, // white border
                width: 1.5, // adjust thickness if needed
              ),
            ),
            child: Icon(icon, color: iconColor),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff2B1C29),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    color: Color(0xff686868),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            textAlign: TextAlign.right,
            style: GoogleFonts.anta(
              color: isExpense ? Color(0xffD90024) : Color(0xff079933),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

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
