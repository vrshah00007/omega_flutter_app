import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/routes/routes_name.dart';
import 'package:omega_flutter_app/screens/invest/data/get_upi_api_service.dart';
import 'package:omega_flutter_app/screens/invest/data/invest_money_api_service.dart';

import '../../../utils/custom_widgets/custom_widget.dart';
import '../../../utils/shared_preference_helper.dart';
import '../../../utils/shared_preference_key.dart';
import '../invest_money_model/get_upi_model.dart';

class InvestController extends GetxController {
  Rx<GetUpiResponseModel> getUpiResponseModel = GetUpiResponseModel().obs;
  RxInt selectedRadio = 0.obs;
  RxBool isQrScreen = false.obs;
  RxBool isChecked = false.obs;
  SharedPreferenceHelper sharedPrefs = SharedPreferenceHelper();
  Rx<TextEditingController> investMoneyFiled = TextEditingController().obs;
  Rx<TextEditingController> upiid = TextEditingController().obs;
  RxBool isLoading = false.obs;
  String path = '';
  RxInt isSubmitClicked = 0.obs;

  void investMoney() async {
    await sharedPrefs.initialize();
    isLoading(true);
    String? errorMsg;
    if (investMoneyFiled.value.text.isEmpty) {
      errorMsg = "Please enter amount to invest";
    }

    if (errorMsg != null) {
      CustomWidget().customSnackBar(message: errorMsg);
      isLoading(false);

    } else {
      print(selectedRadio.value);
      isQrScreen.value = true;
      GetUPIApiService().getUpiDetailAPi().then((value) {
        print(getUpiResponseModel.value.image);
        isSubmitClicked.value = 1;
        update();
      });
    }
  }

  submitAndClaim() async {
    await sharedPrefs.initialize();
    String id = sharedPrefs.getString(SharedPreferenceKey.userID) ?? "";
    InvestMoneyApiService()
        .updateMoney(
            investMoneyFiled.value.text,
            selectedRadio.value == 0
                ? 'Crypto'
                : selectedRadio.value == 1
                    ? 'UPI'
                    : 'Net Banking',
            id,
            path)
        .then((value) {});
  }

  void withdrawMoney() async {
    await sharedPrefs.initialize();
    String id = sharedPrefs.getString(SharedPreferenceKey.userID) ?? "";
    WIthdrawMoneyAPiService()
        .updateMoney(
            investMoneyFiled.value.text,
            selectedRadio.value == 0
                ? 'Crypto'
                : selectedRadio.value == 1
                    ? 'UPI'
                    : 'Net Banking',
            id,
            upiid.value.text)
        .then((value) {
      // Get.toNamed(Routes.homeScreen);
      Get.back();
      investMoneyFiled.value.clear();
    });
  }
}
