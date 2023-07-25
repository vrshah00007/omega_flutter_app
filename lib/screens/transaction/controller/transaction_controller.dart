import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/transaction/data/transaction_api_service.dart';
import 'package:omega_flutter_app/screens/transaction/model/transaction_model.dart';

import '../../../utils/shared_preference_helper.dart';
import '../../../utils/shared_preference_key.dart';
import '../../orders/model/open_orders_model.dart';

class TransactionController extends GetxController {
  RxBool isLoading = false.obs;
  SharedPreferenceHelper sharedPrefs = SharedPreferenceHelper();
  Rx<TransactionListResponseModel> transactionList =
      TransactionListResponseModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    transactionListData();
  }

  void transactionListData() async {
    isLoading(true);
    await sharedPrefs.initialize();
    String id = sharedPrefs.getString(SharedPreferenceKey.userID) ?? "";
    TransactionApiService()
        .transactionPost(OpenOrdersHistoryRequestModel(id: id))
        .then((value) {
      isLoading(false);
    });
  }
}
