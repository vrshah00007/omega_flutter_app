import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:omega_flutter_app/routes/routes_name.dart';

import '../../../api_helper/api_end_points.dart';
import '../../../api_helper/api_exception.dart';
import '../../../api_helper/api_helper.dart';
import '../../../utils/custom_widgets/custom_widget.dart';
import '../../portfolio/model/invest_money_model.dart';

class InvestMoneyApiService {
  Future<InvestMoneyResponseModel?> updateMoney(
      String amount, String type, String id, String image) async {
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse("$baseUrl${ApiEndPoint.updateWallet}"),
        body: {'amount': amount, 'type': type, 'id': id},
      );
      // if(response.body[])
      responseJson = ApiBaseHelper().returnResponse(response);
      print(responseJson);
      updatWalletImage()
          .updateImage(image, responseJson['wallet_transaction_id'].toString());
      return InvestMoneyResponseModel.fromJson(responseJson);
    } on SocketException {
      // Get.toNamed(noInternetScreen);
      throw FetchDataException('No Internet connection');
    } catch (e) {
      print(e);
    }
    return null;
  }
}

class updatWalletImage {
  Future<void> updateImage(String path, String walletID) async {
    var request = http.MultipartRequest('POST',
        Uri.parse('https://growfxtrade.com/trade_api/update_wallet_img.php'));
    request.fields.addAll({'wallet_transaction_id': walletID.toString()});
    request.files.add(await http.MultipartFile.fromPath('image', path));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      CustomWidget().customToast('Record successfully updated');
      Get.offAllNamed(Routes.homeScreen);
    } else {
      print(response.reasonPhrase);
    }
  }
}
