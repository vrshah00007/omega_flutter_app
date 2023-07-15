import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/profile/data/profile_detail_api_service.dart';
import 'package:omega_flutter_app/utils/shared_prefrence_helper.dart';
import 'package:omega_flutter_app/utils/shared_prefrence_key.dart';

import '../../../utils/shared_prefrence_helper.dart';
import '../model/profile_detail_model.dart';

class ProfileDetailController extends GetxController {
  SharedPreferenceHelper sharedPrefs = SharedPreferenceHelper();
  Rx<ProfileDetailModelResponse> responseModel =
      ProfileDetailModelResponse().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  getProfileDetail() async {
    await sharedPrefs.initialize();
    String id = sharedPrefs.getString(SharedPreferenceKey.userID) ?? "idid";
    ProfileDetailApiServices().get(id).then((value) {
      print(value);
      if (value != null) {
        responseModel.value = value;
      }
    });
  }
}
