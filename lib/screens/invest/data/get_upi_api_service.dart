import 'package:get/get.dart';
import 'package:omega_flutter_app/api_helper/api_helper.dart';
import 'package:omega_flutter_app/screens/invest/controller/controller.dart';

import '../../../api_helper/api_end_points.dart';
import '../invest_money_model/get_upi_model.dart';
import 'package:http/http.dart' as http;

class GetUPIApiService {
  Future<GetUpiResponseModel?> getUpiDetailAPi() async {
    var responseJson;

    try {
      final response = await http.get(
        Uri.parse("$baseUrl${ApiEndPoint.getUpiData}"),
        // headers: {
        //   // 'Authorization': 'Bearer $token',
        // },
      );

      responseJson = ApiBaseHelper().returnResponse(response);
      Get.find<InvestController>().getUpiResponseModel.value =
          GetUpiResponseModel.fromJson(responseJson);
      return GetUpiResponseModel.fromJson(responseJson);

      print(response);
    } catch (e) {
      print(e);
      return responseJson;
    }
    // r
  }
}
