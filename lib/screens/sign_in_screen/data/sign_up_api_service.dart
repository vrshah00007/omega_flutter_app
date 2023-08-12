import 'dart:io';

import '../../../api_helper/api_end_points.dart';
import '../../../api_helper/api_exception.dart';
import '../../../api_helper/api_helper.dart';
import '../model/sign_up_model.dart';
import 'package:http/http.dart' as http;

class SignUpApiService {
  Future<SignUpResponseModel?> loginPost(
      SignUpRequestModel requestModel) async {
    var responseJson;
    // var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final response = await http.post(
        Uri.parse('https://growfxtrade.com/trade_api/registers.php'),
        body: {
          'user_name': requestModel.userName ?? "",
          'email': requestModel.email ?? "",
          'mono': requestModel.mono ?? "",
          'city': requestModel.city ?? "",
          'state': requestModel.state ?? "",
          'country': requestModel.country ?? "",
          'pancard_no': requestModel.panCardNo ?? "",
          'bank_name': requestModel.bankName ?? "",
          'bank_account': requestModel.bankAccount ?? "",
          'ifsc': requestModel.ifsc ?? "",
          'upi_id': requestModel.upiID ?? "",
          'password': requestModel.password ?? "",
          'doc_no': requestModel.docNo ?? "",
          'gender': requestModel.gender ?? "",
        });
    // request.bodyFields = ;
    // request.headers.addAll(headers);
    responseJson = ApiBaseHelper().returnResponse(response);
    print(response);
    return SignUpResponseModel.fromJson(responseJson);
  }
}
