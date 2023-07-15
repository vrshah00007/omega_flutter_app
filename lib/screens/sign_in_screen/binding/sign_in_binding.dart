import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/sign_in_screen/controller/login_controller.dart';

class SignINBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LoginController());
  }
}
