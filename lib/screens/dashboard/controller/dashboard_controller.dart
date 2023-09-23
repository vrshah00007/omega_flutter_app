import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:omega_flutter_app/screens/dashboard/data/watch_list_api_request.dart';
import 'package:omega_flutter_app/screens/orders/controller/orders_controller.dart';

import '../../../utils/constants_labels.dart';
import '../../../utils/shared_preference_helper.dart';
import '../../../utils/shared_preference_key.dart';
import '../../portfolio/controller/portfolio_controller.dart';
import '../../transaction/model/local_database_model.dart';
import '../model/currency_model_class.dart';

class DashboardController extends GetxController {
  RxInt selectedIcon = 0.obs;
  SharedPreferenceHelper sharedPrefs = SharedPreferenceHelper();
  final portfolioController = Get.put(PortfolioController());
  final PageController controller = PageController();

// RxList<ApiForgeQuotesResponseModel> modelClass = <ApiForgeQuotesResponseModel>[].obs;
  ApiForgeQuotesResponseModel modelClass = ApiForgeQuotesResponseModel();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    apiRequest();
    portfolioController.getPortfolioDetails();
  }

  List drawerItemList = [
    "Watchlist",
    "Profile",
    "Chart",
    "Calendar",
    "Invest",
    "Withdraw",
    "Portfolio",
    "Transaction",
    "Order",
  ];
  List drawerIconList = [
    'assets/drawer_icons/Watchlist.png',
    'assets/drawer_icons/Personal information.png',
    'assets/drawer_icons/Graph.png',
    'assets/drawer_icons/Appointment.png',
    'assets/drawer_icons/Stock market.png',
    'assets/drawer_icons/Bank.png',
    'assets/drawer_icons/Briefcase.png',
    'assets/drawer_icons/Negotiating.png',
    'assets/drawer_icons/Fulfillment.png',
  ];

  List appbarTitle = [
    ConstantsLabels.homeLabel,
    ConstantsLabels.portfolioLabel,
    ConstantsLabels.orderLabel,
    ConstantsLabels.profileLabel,
  ];

  void apiRequest() {
    CurrencyTradeApiRequest().get().then((value) {
      // print(value)
      CurrencyTradeApiRequestQuote().get().then((value) {
        print(modelClass);
      });
    });
  }

  void buy(String currency_id, String amount, String ask, String total) async {
    await sharedPrefs.initialize();
    String id = sharedPrefs.getString(SharedPreferenceKey.userID) ?? "";
    BuySellApi()
        .buySellApiService(id, "buy", currency_id, amount, ask, "1")
        .then((value) {
      // print(object);
    });
  }

  void sell(String currency_id, String amount, String ask, String total) async {
    await sharedPrefs.initialize();
    String id = sharedPrefs.getString(SharedPreferenceKey.userID) ?? "";
    BuySellApi()
        .buySellApiService(id, "sell", currency_id, amount, ask, total)
        .then((value) {
      // print(object);
      Get.find<OrdersController>().openOrderHistory();
    });
  }

  void sellOrderApi(String orderId, String qty) async {
    await sharedPrefs.initialize();
    String id = sharedPrefs.getString(SharedPreferenceKey.userID) ?? "";
    SellOrderApi().sellApi(orderId, qty);
    Get.find<OrdersController>().openOrderHistory();
    update();
  }
}
