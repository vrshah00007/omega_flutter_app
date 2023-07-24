import 'package:get/get.dart';

import '../../../utils/shared_preference_helper.dart';
import '../../../utils/shared_preference_key.dart';
import '../data/open_order_api_respository.dart';
import '../model/open_orders_model.dart';

class OrdersController extends GetxController {
  SharedPreferenceHelper sharedPrefs = SharedPreferenceHelper();
  RxInt initialIndex = 0.obs;
  Rx<OpenOrderHistoryResponseModel> orderHistoryOpen =
      OpenOrderHistoryResponseModel().obs;

  void openOrderHistory() async {
    await sharedPrefs.initialize();
    String id = sharedPrefs.getString(SharedPreferenceKey.userID) ?? "";
    OpenOrderHistoryApiService()
        .openOrderHistoryPost(OpenOrdersHistoryRequestModel(id: id))
        .then((value) {
      // orderHistoryOpen.value = value!;
    });
  }
}
