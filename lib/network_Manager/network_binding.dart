import 'package:get/get.dart';

import 'netwrok_manager_controller.dart';

class NetworkBinding extends Bindings{

  // dependence injection attach our class.
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<GetXNetworkManager>(() => GetXNetworkManager());
  }

}