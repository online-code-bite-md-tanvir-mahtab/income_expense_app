import 'package:get/get.dart';
import 'package:income_expense_app/modules/home/view/screen/my_home_page.dart';

class AppPages {
  static const initial = '/home';

  static final routes = [
    GetPage(
      name: '/home',
      page: () => MyHomePage(),
    ),
  ];
}
