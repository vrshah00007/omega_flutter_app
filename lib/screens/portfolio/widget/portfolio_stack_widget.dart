import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_const.dart';
import '../../../utils/constants_labels.dart';
import '../controller/portfolio_controller.dart';
import '../model/portfolio_model.dart';

class PortfolioStackWidget extends StatelessWidget {
  const PortfolioStackWidget({
    super.key,
    required this.portfolioScreenController,
    required this.data,
  });

  final PortfolioController portfolioScreenController;
  final PortfolioDetailModelResponse data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height * 0.30,
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
          top: 80,
          left: 140,
          right: 100,
          child: RichText(
            text: TextSpan(
                text: ConstantsLabels.totalProfitLoss,
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                      text:
                          "${portfolioScreenController.responseModel.value.profitLoss}",
                      style: TextStyle(
                        color: greenColor,
                      ))
                ]),
          ),
        ),
        Positioned(
          top: 136,
          left: 18,
          right: 18,
          child: Container(
              width: Get.width,
              height: 65,
              decoration: BoxDecoration(
                  color: iconGreyColor.withOpacity(0.4),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8)))),
        ),
        Positioned(
          top: 120,
          left: 20,
          right: 20,
          child: SizedBox(
            width: Get.width,
            height: 80,
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(ConstantsLabels.yourProfitLoss,
                            style: TextStyle(
                              color: greyTextColor,
                              fontFamily: "arial-cufonfonts",
                            )),
                        Text("\$ ${data.profitLoss ?? ""}",
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
                        horizontal: 32, vertical: 20),
                    child: VerticalDivider(color: iconGreyColor),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(ConstantsLabels.availableLabel,
                            style: TextStyle(
                              color: greyTextColor,
                              fontFamily: "arial-cufonfonts",
                            )),
                        Text("\$ ${data.available ?? ""}",
                            style: TextStyle(
                              fontFamily: "arial-cufonfonts",
                              color: greenColor,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
