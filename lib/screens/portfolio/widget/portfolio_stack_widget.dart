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
          top: 80,
          left: 140,
          right: 100,
          child: RichText(
            text: TextSpan(
                text: ConstantsLabels.totalProfitLoss,
                style: TextStyle(color: Colors.black),
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
          top: 140,
          left: 10,
          right: 10,
          child: SizedBox(
            width: Get.width,
            height: 60,
            child: Card(
              color: whiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              elevation: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(ConstantsLabels.yourProfitLoss),
                      Text("\$ ${data.profitLoss}",
                          style: TextStyle(
                            color: greenColor,
                            fontWeight: FontWeight.w700,
                          )),
                    ],
                  ),
                  SizedBox(
                    width: Get.width * 0.2,
                    child: VerticalDivider(color: Colors.black),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(ConstantsLabels.availableLabel),
                      Text("\$ ${data.available}",
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
        )
      ],
    );
  }
}
