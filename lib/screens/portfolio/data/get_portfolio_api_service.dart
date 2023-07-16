import 'package:get/get.dart';

import '../../../api_helper/api_end_points.dart';
import '../../../api_helper/api_helper.dart';
import '../controller/portfolio_controller.dart';
import '../model/portfolio_model.dart';
import 'package:http/http.dart' as http;

class GetPortfolioApiService {
  Future<PortfolioDetailModelResponse?> getPortfolioDetail(
    String id,
  ) async {
    var responseJson;

    try {
      final response = await http.get(
        Uri.parse("$baseUrl${ApiEndPoint.getPortfolioDetail}?id=$id"),
        // headers: {
        //   // 'Authorization': 'Bearer $token',
        // },
      );

      responseJson = ApiBaseHelper().returnResponse(response);
      Get.find<PortfolioController>().responseModel.value =
          PortfolioDetailModelResponse.fromJson(responseJson);
      return PortfolioDetailModelResponse.fromJson(responseJson);

      print(response);
    } catch (e) {
      print(e);
      return responseJson;
    }
    // return null;
  }
}
