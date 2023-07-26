import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/profile/controller/profile_detail_controller.dart';
import 'package:omega_flutter_app/utils/color_const.dart';
import 'package:omega_flutter_app/utils/constants_labels.dart';

import '../../../utils/icon_image_path.dart';
import '../../portfolio/controller/portfolio_controller.dart';
import '../../profile/widget/profile_detail_card_widget.dart';
import '../widget/invest_stack_widget.dart';

class InvestScreen extends StatelessWidget {
  InvestScreen({super.key});

  final portfolioScreenController = Get.put(PortfolioController());
  final profileScreenController = Get.put(ProfileDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ConstantsLabels.labelInvestMoney,
          style: TextStyle(color: greyTextColor, fontSize: 18),
        ),
      ),
      body: Obx(() {
        return ListView(
          children: [
            investMoneyDetailStackWidget(
                portfolioScreenController, profileScreenController),
            ProfileDetailCard(
              leading: ImageConstants.iconUser,
              title: ConstantsLabels.nameLabel,
              subTitle: profileScreenController.responseModel.value.name ?? "",
              iconHeight: 26,
              iconWidth: 26,
            ),
            ProfileDetailCard(
              leading: ImageConstants.iconEmail,
              title: ConstantsLabels.emailLabel,
              subTitle: profileScreenController.responseModel.value.email ?? "",
              iconHeight: 22,
              iconWidth: 22,
            ),
            ProfileDetailCard(
              leading: ImageConstants.iconPhoneNumber,
              title: ConstantsLabels.labelContactNumber,
              subTitle:
                  profileScreenController.responseModel.value.contactNo ?? "",
              iconHeight: 28,
              iconWidth: 28,
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 60,
                child: TextField(
                    maxLines: 1,
                    cursorColor: greenColor,
                    decoration: InputDecoration(
                      prefix: SvgPicture.asset(
                          "assets/drawer_icons/🦆 icon _dollar square_.svg",
                          height: 26,
                          width: 26),
                      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      focusedErrorBorder: buildOutlineInputBorder(),
                      border: buildOutlineInputBorder(),
                      focusedBorder: buildOutlineInputBorder(),
                      errorBorder: buildOutlineInputBorder(),
                      enabledBorder: buildOutlineInputBorder(),
                      disabledBorder: buildOutlineInputBorder(),
                      labelText: 'Description',
                      labelStyle: TextStyle(color: Colors.black),
                    )),
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        );
      }),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: greenColor, width: 2));
  }
}
