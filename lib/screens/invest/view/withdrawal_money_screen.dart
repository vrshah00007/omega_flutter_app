import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/invest/view/invest_screen.dart';
import 'package:omega_flutter_app/screens/invest/widget/invest_stack_widget.dart';
import 'package:omega_flutter_app/screens/portfolio/controller/portfolio_controller.dart';
import 'package:omega_flutter_app/screens/profile/controller/profile_detail_controller.dart';
import 'package:omega_flutter_app/screens/profile/widget/profile_detail_card_widget.dart';
import 'package:omega_flutter_app/utils/color_const.dart';
import 'package:omega_flutter_app/utils/custom_textform_filed.dart';
import 'package:omega_flutter_app/utils/icon_image_path.dart';

import '../../../utils/constants_labels.dart';
import '../../../utils/custom_widgets/custom_button.dart';
import '../controller/controller.dart';
import '../widget/radio_button_widget.dart';

class WithdrawalMoneyScreen extends StatelessWidget {
  WithdrawalMoneyScreen({Key? key}) : super(key: key);
  final portfolioScreenController = Get.put(PortfolioController());
  final profileScreenController = Get.put(ProfileDetailController());
  final investController = Get.find<InvestController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ConstantsLabels.labelWithdrawMoney,
          style: TextStyle(color: greyTextColor, fontSize: 18),
        ),
      ),
      body: Obx(() {
        return ListView(
          children: [
            investMoneyDetailStackWidget(
                portfolioScreenController, profileScreenController),
            Visibility(
              visible: investController.isQrScreen.value ? false : true,
              replacement: Obx(() {
                print(investController.isQrScreen.value);
                return ReplacementWidgetInvest(controller: investController);
              }),
              child: Column(
                children: [
                  ProfileDetailCard(
                    leading: ImageConstants.iconUser,
                    title: ConstantsLabels.nameLabel,
                    subTitle:
                        profileScreenController.responseModel.value.name ?? "",
                    iconHeight: 26,
                    iconWidth: 26,
                  ),
                  ProfileDetailCard(
                    leading: ImageConstants.iconEmail,
                    title: ConstantsLabels.emailLabel,
                    subTitle:
                        profileScreenController.responseModel.value.email ?? "",
                    iconHeight: 22,
                    iconWidth: 22,
                  ),
                  ProfileDetailCard(
                    leading: ImageConstants.iconPhoneNumber,
                    title: ConstantsLabels.labelContactNumber,
                    subTitle:
                        profileScreenController.responseModel.value.contactNo ??
                            "",
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
                          controller: investController.investMoneyFiled.value,
                          // maxLines: 1,
                          cursorColor: greenColor,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          keyboardType: TextInputType.number,
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
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        color: greyColor),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: Text(ConstantsLabels.labelChooseOption,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16)),
                    ),
                  ),
                  RadioButtonWidget(investController: investController),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 50,
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CustomButton(
                        clickCallback: () {
                          // investController.investMoney();
                          // investController.update();
                          buildShowDialog(context);
                        },
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
              ),
            ),
          ],
        );
      }),
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        // title: const Text("Alert Dialog Box"),
        content: SizedBox(
          // height: 180,
          child: Column(
            children: [
              const Text("Withdraw request sent"),
              const Divider(thickness: 2),
              TextButton(
                  onPressed: () {
                    investController.withdrawMoney();
                  },
                  child: const Text('OKAy'))
            ],
          ),
        ),
      ),
    );
  }
}
