import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omega_flutter_app/routes/routes_name.dart';
import 'package:omega_flutter_app/screens/invest/controller/binding.dart';
import 'package:omega_flutter_app/screens/portfolio/widget/portfolio_card_widget.dart';
import 'package:omega_flutter_app/utils/color_const.dart';

import '../../../utils/constants_labels.dart';
import '../../invest/view/withdrawal_money_screen.dart';
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
          SizedBox(
            height: 26,
          ),
          PortfolioDetailCard(
            leadingTitle: ConstantsLabels.labelTotalForexBuy,
            trailingTitle: "\$ ${data.totalBuy.toString()}" ?? "",
          ),
          // TransactionCardWidget(
          //   leadingTitle: ConstantsLabels.labelTotalForexBuy,
          //   trailingTitle: "\$ ${data.totalBuy.toString()}" ?? "",
          // ),
          const SizedBox(
            height: 6,
          ),
          PortfolioDetailCard(
            leadingTitle: ConstantsLabels.labelWithdrawal,
            trailingTitle: "\$ ${data.withdraw.toString()}" ?? "",
          ),
          // TransactionCardWidget(
          //   leadingTitle: ConstantsLabels.labelWithdrawal,
          //   trailingTitle: "\$ ${data.withdraw.toString()}" ?? "",
          // ),
          // const SizedBox(
          //   height: 6,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Material(
              elevation: 1,
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      ConstantsLabels.labelInvest,
                      style: TextStyle(
                        color: greenColor,
                      ),
                    ),
                    Text(
                      "\$ ${data.available.toString()} Pending",
                      style: TextStyle(
                        color: greenColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Material(
              elevation: 1,
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      ConstantsLabels.labelWithdrawal,
                      style: TextStyle(
                        color: redColor,
                        fontFamily: "arial-cufonfonts",
                      ),
                    ),
                    Text(
                      "\$ ${data.withdraw.toString()} Pending",
                      style: TextStyle(
                        color: redColor,
                        fontFamily: "arial-cufonfonts",
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: Get.width * 0.4,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.investScreen);
                  },
                  style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(0),
                      backgroundColor:
                          MaterialStatePropertyAll(yellowButtonColor),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
                  child: Text(
                    ConstantsLabels.labelInvest,
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          letterSpacing: .5,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * 0.4,
                height: 50,
                child: OutlinedButton(
                    onPressed: () {
                      InvestBinding().dependencies();
                      Get.to(() => WithdrawalMoneyScreen());
                    },
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: blueColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(ConstantsLabels.labelWithdraw,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: .5,
                            color: blueColor))),
              ),
            ],
          )
        ],
      );
    });
  }
}

class TransactionCardWidget extends StatelessWidget {
  String? leadingTitle;
  String? trailingTitle;

  TransactionCardWidget({
    super.key,
    this.leadingTitle,
    this.trailingTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: 60,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 1, right: 1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 59,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(leadingTitle ?? ""),
                  Text(
                      ""
                      "${trailingTitle ?? ""}",
                      style: TextStyle(
                          color: greenColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                ]),
          ),
        ],
      ),
    );
  }
}
