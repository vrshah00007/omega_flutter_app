import 'package:get/get.dart';
import 'package:omega_flutter_app/routes/routes_name.dart';
import 'package:omega_flutter_app/screens/get_started/view/get_started_screen.dart';

import '../../../utils/shared_preference_helper.dart';
import '../../../utils/shared_preference_key.dart';

class SplashController extends GetxController {
  SharedPreferenceHelper sharedPrefs = SharedPreferenceHelper();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    toGetStartedScreen();
  }

  void toGetStartedScreen() async {
    await sharedPrefs.initialize();
    String id = "";
    id = sharedPrefs.getString(SharedPreferenceKey.userID) ?? "";
    print(id);
    Future.delayed(Duration(seconds: 3), () {
      if (id != null && id != "") {
        Get.offNamed(Routes.homeScreen);
      } else {
        Get.toNamed(Routes.getStartedScreen);
      }
    });
  }
}
