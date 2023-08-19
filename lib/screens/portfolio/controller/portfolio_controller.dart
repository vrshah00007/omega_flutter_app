import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/portfolio/data/get_portfolio_api_service.dart';

import '../../../utils/custom_widgets/custom_widget.dart';
import '../../../utils/shared_preference_helper.dart';
import '../../../utils/shared_preference_key.dart';
import '../model/portfolio_model.dart';

class PortfolioController extends GetxController {
  SharedPreferenceHelper sharedPrefs = SharedPreferenceHelper();
  Rx<PortfolioDetailModelResponse> responseModel =
      PortfolioDetailModelResponse().obs;

  void getPortfolioDetails() async {
    await sharedPrefs.initialize();
    String id = sharedPrefs.getString(SharedPreferenceKey.userID) ?? "";
    GetPortfolioApiService().getPortfolioDetail(id).then((value) {
      availableBalance = value?.available ??"";
      print(value?.toJson());
    });
  }
}
