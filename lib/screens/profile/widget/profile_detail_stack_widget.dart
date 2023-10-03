import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_const.dart';
import '../../../utils/constants_labels.dart';
import '../model/profile_detail_model.dart';

Stack profileDetailStackWidget(ProfileDetailModelResponse model) {
  return Stack(
    children: [
      Container(
          height: Get.height * 0.27,
          width: Get.width,
          decoration: const BoxDecoration(
            color: Colors.white,
          )),
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
      Positioned(
        top: 40,
        // left: 100,
        // right: 100,
        child: SizedBox(
          // color: Colors.black,
          width: Get.width,
          child: Center(
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: blueColor, width: 2),
                borderRadius: BorderRadius.circular(60),
              ),
              alignment: Alignment.center,
              child: const Text("VK",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
            ),
          ),
        ),
      ),
      Positioned(
          top: 100,
          // left: 100,
          // right: 100,
          child: SizedBox(
            width: Get.width,
            child: Center(
              child: Text(
                model.email ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          )),
      Positioned(
        top: 151,
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
        top: 130,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(ConstantsLabels.totalPortfolio,
                                style: TextStyle(
                                  color: greyTextColor,
                                  fontFamily: "arial-cufonfonts",
                                )),
                            Text("\$ ${model.walletData?.amountt}",
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
                            Text(ConstantsLabels.profitLabel,
                                style: TextStyle(
                                  color: greyTextColor,
                                  fontFamily: "arial-cufonfonts",
                                )),
                            Text("\$ ${model.walletData?.profit}",
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
