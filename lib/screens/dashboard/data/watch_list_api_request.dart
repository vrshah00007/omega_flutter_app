import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:omega_flutter_app/api_helper/api_end_points.dart';
import 'package:omega_flutter_app/screens/dashboard/controller/dashboard_controller.dart';
import 'package:omega_flutter_app/screens/dashboard/view/dashboard.dart';
import 'package:omega_flutter_app/screens/profile/controller/profile_detail_controller.dart';
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
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var listofCurrency = preferences.getString('listOfCurrency');
    print(listofCurrency);
    var responseJson;

    try {
      final response = await http.get(
        Uri.parse(
            "https://api.1forge.com/quotes?pairs=$listofCurrency&api_key=dSW5dB5k32vksvTu7AYnXzFMdmPL2pEh"),
        // headers: {
        //   // 'Authorization': 'Bearer $token',
        // },
      );
      responseJson = ApiBaseHelper().returnResponse(response);
      print(responseJson);
      model.value = responseJson;
      print(model);
      // List<Map<String, dynamic>> map = [];
      // Get.find<DashboardController>().modelClass responseJson;
      // return List<>;
    } catch (e) {
      print(e);
      return responseJson;
    }
    // return null;
  }
}

class BuySellApi {
  Future buySellApiService(String id, String buySell, String currency_id,
      String amount, String ask,String total) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = http.Request(
        'POST', Uri.parse('https://growfxtrade.com/trade_api/buy-sell.php'));
    request.bodyFields = {
      'buy_sell': buySell,
      'currency_id': currency_id,
      'amount': amount,
      'total': total,
      'id': id,
      'ask': '1.08717'
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
