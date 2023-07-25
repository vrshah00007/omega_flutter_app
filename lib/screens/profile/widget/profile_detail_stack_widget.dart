import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_const.dart';
import '../../../utils/constants_labels.dart';
import '../model/profile_detail_model.dart';

Stack profileDetailStackWidget(ProfileDetailModelResponse model) {
  return Stack(
    children: [
      Container(
        height: Get.height * 0.26,
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
      Positioned(
        top: 20,
        left: 150,
        right: 150,
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
      Positioned(
          top: 90,
          left: 120,
          right: 120,
          child: Text(
            model.email ?? "",
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black),
          )),
      Positioned(
        top: 140,
        left: 10,
        right: 10,
        child: SizedBox(
          width: Get.width,
          height: 60,
          child: Material(
            elevation: 2,borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration:  BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(8)
                 ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(ConstantsLabels.totalPortfolio),
                      Text("\$ ${model.walletData?.amountt}",
                          style: TextStyle(
                            color: greenColor,
                            fontWeight: FontWeight.w700,
                          )),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: VerticalDivider(color: Colors.black),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(ConstantsLabels.profitLabel),
                      Text("\$ ${model.walletData?.profit}",
                          style: TextStyle(
                            color: greenColor,
                            fontWeight: FontWeight.w700,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    ],
  );
}
