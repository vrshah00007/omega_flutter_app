import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/portfolio/model/portfolio_model.dart';
import 'package:omega_flutter_app/screens/portfolio/widget/portfolio_card_widget.dart';
import 'package:omega_flutter_app/utils/color_const.dart';
import 'package:omega_flutter_app/utils/custom_widgets/custom_button.dart';

import '../../../utils/constants_labels.dart';
import '../controller/portfolio_controller.dart';
import '../widget/portfolio_stack_widget.dart';

class PortfolioScreen extends StatelessWidget {
  PortfolioScreen({super.key});

  final portfolioScreenController = Get.put(PortfolioController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var data = portfolioScreenController.responseModel.value;
      return Column(
        children: [
          PortfolioStackWidget(
              portfolioScreenController: portfolioScreenController, data: data),
          PortfolioCard(
              title: ConstantsLabels.labelTotalForexBuy,
              subTitle: "\$ ${data.totalBuy.toString()}" ?? ""),
          PortfolioCard(
              title: ConstantsLabels.labelWithdrawal,
              subTitle: "\$ ${data.withdraw.toString()}" ?? ""),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: Get.width * 0.4,
                child: CustomButton(
                    title: ConstantsLabels.labelInvest,
                    color: yellowButtonColor,
                    clickCallback: () {},
                    radius: 12,
                    textColor: Colors.black),
              ),
              SizedBox(
                width: Get.width * 0.4,
                child: CustomOutlinedButton(
                  title: ConstantsLabels.labelWithdrawal,
                  color: blueColor,
                  textColor: blueColor,
                  radius: 12,
                  clickCallback: () {},
                ),
              ),
            ],
          )
        ],
      );
    });
  }
}
