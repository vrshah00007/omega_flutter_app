import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omega_flutter_app/screens/portfolio/widget/portfolio_card_widget.dart';
import 'package:omega_flutter_app/utils/color_const.dart';

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
          const SizedBox(
            height: 6,
          ),
          PortfolioCard(
              title: ConstantsLabels.labelWithdrawal,
              subTitle: "\$ ${data.withdraw.toString()}" ?? ""),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  onPressed: () {},
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
                    onPressed: () {},
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
