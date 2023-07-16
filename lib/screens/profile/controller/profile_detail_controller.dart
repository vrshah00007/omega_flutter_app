import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/profile/data/profile_detail_api_service.dart';
import 'package:omega_flutter_app/utils/shared_preference_helper.dart';
import 'package:omega_flutter_app/utils/shared_preference_key.dart';
import '../model/profile_detail_model.dart';

class ProfileDetailController extends GetxController {
  SharedPreferenceHelper sharedPrefs = SharedPreferenceHelper();
  Rx<ProfileDetailModelResponse> responseModel =
      ProfileDetailModelResponse().obs;

  // ProfileDetailModelResponse modelResponse = ProfileDetailModelResponse();

  getProfileDetail() async {
    await sharedPrefs.initialize();
    String id = sharedPrefs.getString(SharedPreferenceKey.userID) ?? "";
    ProfileDetailApiServices().get(id).then((value) {
      if (kDebugMode) {
        print(value?.toJson() ?? "");
      }
      // modelResponse = value!;
      if (value != null) {
        // responseModel.value = value;
      }
    });
  }
}
