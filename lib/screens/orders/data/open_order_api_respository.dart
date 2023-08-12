import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:omega_flutter_app/api_helper/api_helper.dart';
import 'package:http/http.dart' as http;
import 'package:omega_flutter_app/screens/orders/model/close_order_model.dart';
import 'package:omega_flutter_app/screens/sign_in_screen/model/login_model.dart';

import '../../../api_helper/api_end_points.dart';
import '../../../api_helper/api_exception.dart';
import '../controller/orders_controller.dart';
import '../model/open_orders_model.dart';

class OpenOrderHistoryApiService {
  Future<OpenOrderHistoryResponseModel?> openOrderHistoryPost(
      OpenOrdersHistoryRequestModel request) async {
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse("$baseUrl${ApiEndPoint.openOrder}"),
        body: request.toJson(),
      );
      // if(response.body[])
      responseJson = ApiBaseHelper().returnResponse(response);
      Get.find<OrdersController>().orderHistoryOpen.value =
          OpenOrderHistoryResponseModel.fromJson(responseJson);
      return OpenOrderHistoryResponseModel.fromJson(responseJson);
    } on SocketException {
      // Get.toNamed(noInternetScreen);
      throw FetchDataException('No Internet connection');
    } catch (e) {
      print(e);
    }
    return null;
  }
}

class CloseOrderHistoryApiService {
  Future<CloseOrderResponseModel?> closeOrderHistoryPost(
      OpenOrdersHistoryRequestModel request) async {
    var responseJson;

    try {
      final response = await http.post(
        Uri.parse("$baseUrl${ApiEndPoint.closeOrder}"),
        body: request.toJson(),
      );
      // if(response.body[])
      responseJson = ApiBaseHelper().returnResponse(response);
      Get.find<OrdersController>().orderHistoryClose.value =
          CloseOrderResponseModel.fromJson(responseJson);
      return CloseOrderResponseModel.fromJson(responseJson);
    } on SocketException {
      // Get.toNamed(noInternetScreen);
      throw FetchDataException('No Internet connection');
    } catch (e) {
      print(e);
    }
    return null;
  }
}
