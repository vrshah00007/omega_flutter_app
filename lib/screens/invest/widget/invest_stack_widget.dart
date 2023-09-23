import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/invest/controller/controller.dart';
import 'package:omega_flutter_app/screens/profile/controller/profile_detail_controller.dart';
import 'package:omega_flutter_app/utils/color_const.dart';

import '../../../utils/constants_labels.dart';

import '../../portfolio/controller/portfolio_controller.dart';

Stack investMoneyDetailStackWidget(
    PortfolioController portfolioScreenController,
    ProfileDetailController profileScreenController,
    InvestController investController) {
  return Stack(
    children: [
      Container(
        height: Get.height * 0.25,
        width: Get.width,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
      Positioned(
        top: 50,
        child: Container(
          height: Get.height * 0.15,
          width: Get.width,
          decoration: BoxDecoration(
            color: blueColor.withOpacity(0.1),
          ),
        ),
      ),
      Obx(() {
        return Positioned(
            top: 70,
            // right: investController.isQrScreen.value? 60:140,
            // left: investController.isQrScreen.value? 60:140,
            child: SizedBox(
              // color: Colors.black,
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: investController.isQrScreen.value
                        ? const Text('DEPOSITED VIA ')
                        : const Text(
                            ConstantsLabels.totalProfitLoss,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
                  ),
                  investController.isQrScreen.value
                      ? Text(
                          investController.selectedRadio.value == 0
                              ? "CRYPTO"
                              : investController.selectedRadio.value == 1
                                  ? "UPI"
                                  : "NET BANKING",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      : Text(
                          "\$ ${portfolioScreenController.responseModel.value.profitLoss}",
                          style: TextStyle(color: greenColor),
                        )
                ],
              ),
            ));
      }),
      Positioned(
        top: 130,
        left: 19,
        right: 19,
        child: Container(
            width: Get.width,
            height: 60,
            decoration: BoxDecoration(
                color: iconGreyColor.withOpacity(0.4),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)))),
      ),
      Positioned(
        top: 110,
        left: 20,
        right: 20,
        child: Stack(
          children: [
            SizedBox(
              width: Get.width,
              height: 80,
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(ConstantsLabels.yourProfitLoss,
                                style: TextStyle(
                                  color: greyTextColor,
                                  fontFamily: "arial-cufonfonts",
                                )),
                            Text(
                                "\$ ${profileScreenController.responseModel.value.profitLoss ?? "0"}",
                                style: TextStyle(
                                  fontFamily: "arial-cufonfonts",
                                  color: greenColor,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 20),
                        child: VerticalDivider(color: greyTextColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(ConstantsLabels.availableLabel,
                                style: TextStyle(
                                  color: greyTextColor,
                                  fontFamily: "arial-cufonfonts",
                                )),
                            Text(
                                "\$ ${profileScreenController.responseModel.value.walletData?.amountt}",
                                style: TextStyle(
                                    fontFamily: "arial-cufonfonts",
                                    color: greenColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}
