import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/invest/controller/controller.dart';

class InvestBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => InvestController());
  }

}