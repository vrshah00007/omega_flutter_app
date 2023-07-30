import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omega_flutter_app/screens/invest/controller/controller.dart';
import 'package:omega_flutter_app/screens/profile/controller/profile_detail_controller.dart';
import 'package:omega_flutter_app/utils/color_const.dart';
import 'package:omega_flutter_app/utils/constants_labels.dart';
import 'package:omega_flutter_app/utils/custom_widgets/custom_button.dart';

import '../../../utils/icon_image_path.dart';
import '../../portfolio/controller/portfolio_controller.dart';
import '../../profile/widget/profile_detail_card_widget.dart';
import '../widget/invest_stack_widget.dart';
import '../widget/radio_button_widget.dart';

class InvestScreen extends StatelessWidget {
  InvestScreen({super.key});

  final portfolioScreenController = Get.put(PortfolioController());
  final profileScreenController = Get.put(ProfileDetailController());
  final investController = Get.find<InvestController>();

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
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 60,
                child: TextFormField(
                    // maxLines: 1,
                    cursorColor: greenColor,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: SvgPicture.asset(
                          "assets/drawer_icons/🦆 icon _dollar square_.svg",
                          // fit: BoxFit.cover,
                          // height: 20,
                          // width: 20,
                        ),
                      ),
                      // contentPadding: const EdgeInsets.fromLTRB(14, 0, 0, 30),
                      // prefixIcon: ,

                      focusedErrorBorder: buildOutlineInputBorder(),
                      border: buildOutlineInputBorder(),
                      focusedBorder: buildOutlineInputBorder(),

                      errorBorder: buildOutlineInputBorder(),
                      enabledBorder: buildOutlineInputBorder(),
                      disabledBorder: buildOutlineInputBorder(),
                      labelText: 'Invest Money',
                      labelStyle: const TextStyle(color: Colors.black),
                    )),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  color: greyColor),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Text(ConstantsLabels.labelChooseOption,
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
              ),
            ),
            RadioButtonWidget(investController: investController),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomButton(
                  title: "Submit",
                  radius: 8,
                  color: yellowButtonColor,
                  textColor: Colors.black,
                ),
              ),
            ),
            const SizedBox(
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
