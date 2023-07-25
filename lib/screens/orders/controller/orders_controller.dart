import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/orders/model/close_order_model.dart';

import '../../../utils/shared_preference_helper.dart';
import '../../../utils/shared_preference_key.dart';
import '../data/open_order_api_respository.dart';
import '../model/open_orders_model.dart';

class OrdersController extends GetxController {
  SharedPreferenceHelper sharedPrefs = SharedPreferenceHelper();
  RxInt initialIndex = 0.obs;
  Rx<OpenOrderHistoryResponseModel> orderHistoryOpen =
      OpenOrderHistoryResponseModel().obs;
  Rx<CloseOrderResponseModel> orderHistoryClose = CloseOrderResponseModel().obs;

  void openOrderHistory() async {
    await sharedPrefs.initialize();
    String id = sharedPrefs.getString(SharedPreferenceKey.userID) ?? "";
    OpenOrderHistoryApiService()
        .openOrderHistoryPost(OpenOrdersHistoryRequestModel(id: id))
        .then((value) {
      // orderHistoryOpen.value = value!;
    });
  }

  void closeOrderHistory() async {
    await sharedPrefs.initialize();
    String id = sharedPrefs.getString(SharedPreferenceKey.userID) ?? "";
    CloseOrderHistoryApiService()
        .closeOrderHistoryPost(OpenOrdersHistoryRequestModel(id: id))
        .then((value) {
      // orderHistoryOpen.value = value!;
    });
  }
}
