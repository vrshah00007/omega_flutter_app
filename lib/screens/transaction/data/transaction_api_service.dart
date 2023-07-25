import 'dart:io';

import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/transaction/model/transaction_model.dart';

import '../../../api_helper/api_end_points.dart';
import '../../../api_helper/api_exception.dart';
import '../../../api_helper/api_helper.dart';
import '../../orders/model/open_orders_model.dart';

import 'package:http/http.dart' as http;

import '../controller/transaction_controller.dart';

class TransactionApiService {
  Future<TransactionListResponseModel?> transactionPost(
      OpenOrdersHistoryRequestModel request) async {
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse("$baseUrl${ApiEndPoint.transaction}"),
        body: request.toJson(),
      );
      // if(response.body[])
      responseJson = ApiBaseHelper().returnResponse(response);
      Get.find<TransactionController>().transactionList.value =
          TransactionListResponseModel.fromJson(responseJson);
      return TransactionListResponseModel.fromJson(responseJson);
    } on SocketException {
      // Get.toNamed(noInternetScreen);
      throw FetchDataException('No Internet connection');
    } catch (e) {
      print(e);
    }
    return null;
  }
}
