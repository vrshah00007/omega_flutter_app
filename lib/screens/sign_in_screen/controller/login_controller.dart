import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/routes/routes_name.dart';
import 'package:omega_flutter_app/utils/shared_preference_key.dart';

import '../../../utils/custom_widgets/custom_widget.dart';
import '../../../utils/shared_preference_helper.dart';
import '../data/login_api_service.dart';
import '../model/login_model.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool isChecked = false.obs;
  RxBool isLoading = false.obs;
  Rx<LoginModelResponse> loginResponse = LoginModelResponse().obs;

  SharedPreferenceHelper sharedPrefs = SharedPreferenceHelper();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  loginCheck() async {
    await sharedPrefs.initialize();
    isLoading(true);
    String? errorMsg;
    if (emailController.value.text.trim().isEmpty) {
      errorMsg = "Please enter your email";
    } else if (!GetUtils.isEmail(emailController.value.text.trim())) {
      errorMsg = "Please enter a valid email";
    } else if (passwordController.value.text.trim().isEmpty) {
      errorMsg = "Please enter your password";
    } else if (passwordController.value.text.trim().length < 6) {
      errorMsg = "Password cannot be less than 6 character";
    } else if (!isChecked.value) {
      errorMsg = "Please select the checkbox";
    }

    if (errorMsg != null) {
      CustomWidget().customSnackBar(message: errorMsg);
      isLoading(false);
    } else {
      LoginApiService()
          .loginPost(LoginModelRequest(
        email: emailController.value.text,
        password: passwordController.value.text,
      ))
          .then((value) {
        // print(value?.msg);
        if (value != null) {
          if (value.staus == 0) {
            isLoading(false);
            sharedPrefs.saveString(
                SharedPreferenceKey.userID, value.user?.userId ?? "");
            loginResponse.value = value;
            Get.toNamed(Routes.homeScreen);
          } else {
            isLoading(false);
            CustomWidget().customToast(value.msg ?? "");
          }
        }
      });
    }
  }
}
