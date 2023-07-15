import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'api_exception.dart';

const String baseUrl = "https://growfxtrade.com/trade_api/";

class ApiBaseHelper {
  Future<dynamic> get(String url,) async {


    var responseJson;
    try {
      final response = await http.get(
        Uri.parse(baseUrl + url),
        headers: {
          // 'Authorization': 'Bearer $token',
        },
      );
      print(baseUrl + url);
      responseJson = returnResponse(response);
      print(response);
    } catch (e) {
      print(e);
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic requestBody,
      ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var responseJson;
    try {
      final response = await http.post(
        Uri.parse("$baseUrl$url"),
        body: requestBody,
        // headers: (tokenNotRequired != null && tokenNotRequired)
        //     ? null
        //     : {
        //         // 'Authorization': 'Bearer $token',
        //       },
      );
      responseJson = returnResponse(response);
    } on SocketException {
      // Get.toNamed(noInternetScreen);
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        // print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        notAuthLogout();
        throw UnauthorisedException(response.body.toString());

      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

notAuthLogout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  // Get.offAllNamed(loginScreen);
}
