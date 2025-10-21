import 'package:flutter/material.dart';
import 'package:income_expense_app/ultra_background.dart';
import 'package:income_expense_app/widget/glass_bottom_nav.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

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
          bottomNavigationBar: GlassBottomNav(
            currentIndex: 0,
            onTap: (value) {},
          ),
          backgroundColor: Colors.transparent,

          body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have pushed the button this many times:'),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
 // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}
