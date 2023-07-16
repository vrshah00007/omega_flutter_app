import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/dashboard/controller/dashboard_controller.dart';
import 'package:omega_flutter_app/screens/profile/controller/profile_detail_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => ProfileDetailController());
  }
}
