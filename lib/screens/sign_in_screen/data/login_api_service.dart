import 'package:omega_flutter_app/api_helper/api_helper.dart';

import '../../../api_helper/api_end_points.dart';
import '../model/login_model.dart';

class LoginApiService {
  Future<LoginModelResponse> apiService(
      LoginModelRequest loginModelRequest) async {
    ApiBaseHelper _apiBaseHelper = ApiBaseHelper();
    var response = _apiBaseHelper.post(ApiEndPoint.login, loginModelRequest.toJson(),
        tokenNotRequired: false);
    print(response);
    response.then((value) {
      LoginModelResponse.fromJson(value);
    });
    return LoginModelResponse();
  }
}
