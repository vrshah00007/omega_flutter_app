import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/sign_in_screen/data/sign_up_api_service.dart';
import 'package:omega_flutter_app/screens/sign_in_screen/model/sign_up_model.dart';

class SignUpController extends GetxController {
  RxBool isChecked = false.obs;
  Rx<TextEditingController> userName = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> mobileNumber = TextEditingController().obs;
  Rx<TextEditingController> city = TextEditingController().obs;
  Rx<TextEditingController> state = TextEditingController().obs;
  Rx<TextEditingController> country = TextEditingController().obs;
  Rx<TextEditingController> docNo = TextEditingController().obs;
  Rx<TextEditingController> panCard = TextEditingController().obs;
  Rx<TextEditingController> bankName = TextEditingController().obs;
  Rx<TextEditingController> bankAccountNumber = TextEditingController().obs;
  Rx<TextEditingController> ifscCode = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  Rx<TextEditingController> gender = TextEditingController().obs;
  Rx<TextEditingController> upiId = TextEditingController().obs;

  void signUpAPIService() {
    SignUpApiService()
        .loginPost(SignUpRequestModel(
      userName: userName.value.text,
      email: email.value.text,
      bankAccount: bankAccountNumber.value.text,
      bankName: bankName.value.text,
      city: city.value.text,
      country: country.value.text,
      docNo: docNo.value.text,
      gender: gender.value.text,
      ifsc: ifscCode.value.text,
      mono: mobileNumber.value.text,
      panCardNo: panCard.value.text,
      password: password.value.text,
      state: state.value.text,
      upiID: upiId.value.text,
    ))
        .then((value) {
      userName.value.clear();
      email.value.clear();
      bankAccountNumber.value.clear();
      bankName.value.clear();
      city.value.clear();
      country.value.clear();
      docNo.value.clear();
      gender.value.clear();
      ifscCode.value.clear();
      mobileNumber.value.clear();
      panCard.value.clear();
      password.value.clear();
      state.value.clear();
      upiId.value.clear();
    });
  }
}
