import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/splash/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
