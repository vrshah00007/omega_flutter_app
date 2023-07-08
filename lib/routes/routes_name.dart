import 'package:get/get.dart';

import '../screens/get_started/view/get_started_screen.dart';
import '../screens/splash/binding/splash_binding.dart';
import '../screens/splash/view/splash.dart';

class Routes {
  static String splashScreen = '/splash_Screen';
  static String getStartedScreen = '/get_started_screen';
  static String homeScreen = '/Home_Screen';
}

final getPages = [
  GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding()),
  GetPage(
    name: Routes.getStartedScreen,
    page: () => const GetStartedScreen(),
  ),
];