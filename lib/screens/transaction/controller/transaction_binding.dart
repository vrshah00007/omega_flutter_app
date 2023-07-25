import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/transaction/controller/transaction_controller.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransactionController());
    // TODO: implement dependencies
  }
}
