import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'api_exception.dart';

const String baseUrl = "";

class ApiBaseHelper {
  Future<dynamic> get(String url, {bool? isSocket}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String token = LocalStorageRepository(prefs).getValue(KEY_USER_TOKEN);
    // String token = prefs.getString(KEY_USER_TOKEN)!;
    // String SocketToken = prefs.getString(KEY_SOCKET_ACCESS_TOKEN) ?? '';
    var responseJson;
    try {
      final response = await http.get(
        Uri.parse(baseUrl + url),
        headers: {
          // 'Authorization': 'Bearer $token',
        },
      );
      print(baseUrl + url);
      responseJson = _returnResponse(response);
      print(response);
    } catch (e) {
      print(e);
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic requestBody,
      {bool? tokenNotRequired, bool? isSocketUrl}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String token = LocalStorageRepository(prefs).getValue(KEY_USER_TOKEN);
    // String token = prefs.getString(KEY_USER_TOKEN).toString();
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse("${isSocketUrl}$url"),
        body: requestBody,
        headers: (tokenNotRequired != null && tokenNotRequired)
            ? null
            : {
                // 'Authorization': 'Bearer $token',
              },
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      // Get.toNamed(noInternetScreen);
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
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
