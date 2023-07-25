import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:omega_flutter_app/api_helper/api_end_points.dart';
import 'package:omega_flutter_app/screens/profile/controller/profile_detail_controller.dart';

import '../../../api_helper/api_helper.dart';
import '../model/profile_detail_model.dart';

class ProfileDetailApiServices {
  Future<ProfileDetailModelResponse?> get(
    String id,
  ) async {
    var responseJson;

    try {
      final response = await http.get(
        Uri.parse("$baseUrl${ApiEndPoint.profileDetail}?id=$id"),
        // headers: {
        //   // 'Authorization': 'Bearer $token',
        // },
      );

      responseJson = ApiBaseHelper().returnResponse(response);
      Get.find<ProfileDetailController>().responseModel.value =
          ProfileDetailModelResponse.fromJson(responseJson);
      return ProfileDetailModelResponse.fromJson(responseJson);

      print(response);
    } catch (e) {
      print(e);
      return responseJson;
    }
    // return null;
  }
}
