import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/dashboard/controller/dashboard_binding.dart';
import 'package:omega_flutter_app/screens/dashboard/view/dashboard.dart';
import 'package:omega_flutter_app/screens/invest/controller/binding.dart';
import 'package:omega_flutter_app/screens/invest/view/invest_screen.dart';
import 'package:omega_flutter_app/screens/search/view/search_screen.dart';
import 'package:omega_flutter_app/screens/sign_in_screen/binding/sign_in_binding.dart';
import 'package:omega_flutter_app/screens/sign_in_screen/view/sign_in_screen.dart';
import 'package:omega_flutter_app/screens/transaction/view/transaction_screen.dart';

import '../screens/get_started/view/get_started_screen.dart';
import '../screens/search/controller/search_binding.dart';
import '../screens/splash/binding/splash_binding.dart';
import '../screens/splash/view/splash.dart';
import '../screens/transaction/controller/transaction_binding.dart';

class Routes {
  static String splashScreen = '/splash_Screen';
  static String getStartedScreen = '/get_started_screen';
  static String loginScreen = '/login_screen';
  static String homeScreen = '/Home_Screen';
  static String singInScreen = '/Sign_IN_Screen';
  static String transactionScreen = '/Transaction_Screen';
  static String investScreen = '/Invest_Screen';
  static String searchScreen = '/Search_Screen';
}

final getPages = [
  GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding()),
  GetPage(
    name: Routes.loginScreen,
    page: () => const SignInScreen(),
  ),
  GetPage(
    name: Routes.getStartedScreen,
    page: () => const GetStartedScreen(),
  ),
  GetPage(
    name: Routes.getStartedScreen,
    page: () => const GetStartedScreen(),
  ),
  GetPage(
    name: Routes.homeScreen,
    page: () => Dashboard(),
    binding: DashboardBinding(),
  ),
  GetPage(
    name: Routes.singInScreen,
    page: () => const SignInScreen(),
    binding: SignINBinding(),
  ),
  GetPage(
    name: Routes.transactionScreen,
    page: () => TransactionScreen(),
    binding: TransactionBinding(),
  ),
  GetPage(
    name: Routes.investScreen,
    page: () => InvestScreen(),
    binding: InvestBinding(),
  ),
  GetPage(
    name: Routes.searchScreen,
    page: () => SearchScreen(),
    binding: SearchBinding(),
  ),
];
