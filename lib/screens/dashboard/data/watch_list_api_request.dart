import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:omega_flutter_app/api_helper/api_end_points.dart';
import 'package:omega_flutter_app/screens/dashboard/controller/dashboard_controller.dart';
import 'package:omega_flutter_app/screens/dashboard/view/dashboard.dart';
import 'package:omega_flutter_app/screens/profile/controller/profile_detail_controller.dart';
import 'package:omega_flutter_app/screens/transaction/model/local_database_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api_helper/api_helper.dart';
import '../../../utils/custom_widgets/custom_widget.dart';
import '../model/currency_model_class.dart';

class CurrencyTradeApiRequest {
  Future<void> get() async {
    var responseJson;

    try {
      final response = await http.get(
        Uri.parse(
            "https://api.1forge.com/symbols?api_key=dSW5dB5k32vksvTu7AYnXzFMdmPL2pEh"),
        // headers: {
        //   // 'Authorization': 'Bearer $token',
        // },
      );

      responseJson = ApiBaseHelper().returnResponse(response);
      print(responseJson);
      listOfCurrency = responseJson;
      if (boxLocalDatabase!.isEmpty) {
        for (var user in listOfCurrency) {
          boxLocalDatabase?.put(
              user, WatchListData(currency: user, isSelected: false));
          print(boxLocalDatabase?.get(user)?.currency);
        }
      } else {}

      // print(response);response
    } catch (e) {
      print(e);
      return responseJson;
    }
    // return null;
  }
}

class CurrencyTradeApiRequestQuote {
  Future<ApiForgeQuotesResponseModel?> get() async {
    isLoading.value = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var listofCurrency = preferences.getString('listOfCurrency');
    print(listofCurrency);
    var responseJson;
    listofCurrency = "";
    boxLocalDatabaseSearch?.toMap().forEach((key, value) {
      print("boxLocalDatabaseSearch ===> ${value.currency}");
    });
    boxLocalDatabase?.toMap().forEach((key, value) {
      if (value.isSelected == true) {
        // print("boxLocalDatabase""${value.currency}");
        if (listofCurrency == "") {
          listofCurrency = value.currency;
        } else {
          listofCurrency = "${listofCurrency},${value.currency}";
        }
      }
    });
    print("SELECTED CURRENCY ${listofCurrency}");
    try {
      final response = await http.get(
        Uri.parse(
            "https://api.1forge.com/quotes?pairs=$listofCurrency&api_key=dSW5dB5k32vksvTu7AYnXzFMdmPL2pEh"),
        // headers: {
        //   // 'Authorization': 'Bearer $token',
        // },
      );
      print(
          "https://api.1forge.com/quotes?pairs=$listofCurrency&api_key=dSW5dB5k32vksvTu7AYnXzFMdmPL2pEh");
      responseJson = ApiBaseHelper().returnResponse(response);
      // print(responseJson);
      model.value = responseJson;
      // print(model);
      // for (var i = 0; i < model.value.length; i++) {
      //   if (boxLocalDatabase!.isNotEmpty) {
      //     if (boxLocalDatabase?.get("currencyDataBody") != model[i]) {
      //       await boxLocalDatabase
      //           ?.put(i,WatchListData(currency: model[i], isSelected: false));
      //     }
      //   } else {
      //     await boxLocalDatabase
      //         ?.put(i,WatchListData(currency: model[i], isSelected: false));
      //   }
      // }

      // boxLocalDatabase.add();

      // List<Map<String, dynamic>> map = [];
      // Get.find<DashboardController>().modelClass responseJson;
      // return List<>;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
      return responseJson;
    }
    // return null;
  }
}

class BuySellApi {
  Future buySellApiService(String id, String buySell, String currency_id,
      String amount, String ask, String total) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = http.Request(
        'POST', Uri.parse('https://growfxtrade.com/trade_api/buy-sell.php'));
    request.bodyFields = {
      'buy_sell': buySell,
      'currency_id': currency_id,
      'amount': amount,
      'total': amount,
      'id': id,
      'ask': ask
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var newResponse = response.stream.listen((bytes) {
        String decodedString = utf8.decode(bytes);
// print(json.decode(decodedString)["msg"]);
        CustomWidget().customToast(json.decode(decodedString)["msg"]);

        // Add the decoded string to the list
        // streamedStrings.add(decodedString);
        // });\
      });
    } else {
      print(response.reasonPhrase);
    }
  }
}

class SellOrderApi {
  Future<void> sellApi(String id, String qty) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = http.Request(
        'POST', Uri.parse('https://growfxtrade.com/trade_api/sell.php'));
    request.bodyFields = {
      'id': id,
      'qty': qty,
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
