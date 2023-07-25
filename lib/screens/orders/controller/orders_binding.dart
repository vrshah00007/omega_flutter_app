import 'package:get/get.dart';

import 'orders_controller.dart';

class OrdersBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => OrdersController());
  }

}