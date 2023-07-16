import 'dart:convert';
import 'dart:io';

import 'package:omega_flutter_app/api_helper/api_helper.dart';
import 'package:http/http.dart' as http;
import 'package:omega_flutter_app/screens/sign_in_screen/model/login_model.dart';

import '../../../api_helper/api_end_points.dart';
import '../../../api_helper/api_exception.dart';

class LoginApiService {
  Future<LoginModelResponse?> loginPost(LoginModelRequest request) async {
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse("$baseUrl${ApiEndPoint.login}"),
        body: request.toJson(),
      );
      // if(response.body[])
      responseJson = ApiBaseHelper().returnResponse(response);

      return LoginModelResponse.fromJson(responseJson);
    } on SocketException {
      // Get.toNamed(noInternetScreen);
      throw FetchDataException('No Internet connection');
    } catch (e) {
      print(e);
    }
    return null;
  }
}
