import 'package:get/get.dart';
import 'package:omega_flutter_app/routes/routes_name.dart';
import 'package:omega_flutter_app/screens/get_started/view/get_started_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    toGetStartedScreen();
  }

  void toGetStartedScreen() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.toNamed(Routes.getStartedScreen),
    );
  }
}
