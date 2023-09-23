import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:omega_flutter_app/screens/invest/controller/controller.dart';
import 'package:omega_flutter_app/screens/invest/widget/invest_detail_widget.dart';
import 'package:omega_flutter_app/screens/profile/controller/profile_detail_controller.dart';
import 'package:omega_flutter_app/screens/transaction/widget/transaction_card_widget.dart';
import 'package:omega_flutter_app/utils/color_const.dart';
import 'package:omega_flutter_app/utils/constants_labels.dart';
import 'package:omega_flutter_app/utils/custom_widgets/custom_button.dart';

import '../../../utils/custom_widgets/custom_widget.dart';
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
    return WillPopScope(
      onWillPop: () async {
        if (investController.isSubmitClicked.value == 1) {
          investController.isQrScreen.value = false;
          investController.isSubmitClicked.value = 0;
          investController.investMoneyFiled.value.clear();
        } else if (investController.isSubmitClicked.value == 0) {
          Get.back();
        }
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                if (investController.isSubmitClicked.value == 1) {
                  investController.isQrScreen.value = false;
                  investController.isSubmitClicked.value = 0;
                  investController.investMoneyFiled.value.clear();
                } else if (investController.isSubmitClicked.value == 0) {
                  Get.back();
                }
              },
              icon: Icon(
                Icons.arrow_back,
                color: blueColor,
              )),
          title: Text(
            ConstantsLabels.labelInvestMoney,
            style: TextStyle(color: greyTextColor, fontSize: 18),
          ),
        ),
        body: Obx(() {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              investMoneyDetailStackWidget(portfolioScreenController,
                  profileScreenController, investController),
              // SizedBox(
              //   height: 26,
              // ),
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
                          profileScreenController.responseModel.value.name ??
                              "",
                      iconHeight: 26,
                      iconWidth: 26,
                    ),
                    ProfileDetailCard(
                      leading: ImageConstants.iconEmail,
                      title: ConstantsLabels.emailLabel,
                      subTitle:
                          profileScreenController.responseModel.value.email ??
                              "",
                      iconHeight: 22,
                      iconWidth: 22,
                    ),
                    ProfileDetailCard(
                      leading: ImageConstants.iconPhoneNumber,
                      title: ConstantsLabels.labelContactNumber,
                      subTitle: profileScreenController
                              .responseModel.value.contactNo ??
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
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
                      height: 16,
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
                            EdgeInsets.symmetric(vertical: 14, horizontal: 16),
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
                            investController.investMoney();
                            investController.update();
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
      ),
    );
  }
}

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: greenColor, width: 2));
}

class ReplacementWidgetInvest extends StatelessWidget {
  InvestController controller;

  ReplacementWidgetInvest({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // var data = controller.getUpiResponseModel.value;
    return GetBuilder<InvestController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (controller.selectedRadio.value == 0)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Deposit USDT (TETHER) by Scanning'),
            ),
          if (controller.selectedRadio.value == 0)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 200,
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: greenColor,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.network(
                      "https://growfxtrade.com/${controller.getUpiResponseModel.value.image}",
                      errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: 200,
                    );
                  }, fit: BoxFit.fitHeight),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('OR USE'),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 63,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 2, right: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 62,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 20),
                          child: Column(
                            children: [
                              Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  // const SizedBox(width: 12,),
                                  Text(
                                    "Below Address",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    width: Get.width * .4,
                                  ),
                                  Text(
                                    "12345678",
                                    style: TextStyle(
                                        color: greyTextColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 63,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 2, right: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 62,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 20),
                          child: Column(
                            children: [
                              Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  // Text(),
                                  // const SizedBox(width: 12,),
                                  Text(
                                    "Wallet Address",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    width: Get.width * .4,
                                  ),
                                  Text(
                                    "12345678153",
                                    style: TextStyle(
                                        color: greyTextColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          if (controller.selectedRadio.value == 1)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Text("UPI ID"),
                ),
                Stack(
                  children: [
                    Container(
                      height: 63,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 2, right: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 62,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // const SizedBox(width: 12,),
                              Text(
                                controller.getUpiResponseModel.value.upi ?? "",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              InkWell(
                                onTap: () async {
                                  await Clipboard.setData(ClipboardData(
                                      text:
                                          "${controller.getUpiResponseModel.value.upi}"));
                                },
                                child: SvgPicture.asset(
                                  'assets/profile_detail_icon/🦆 icon _copy success_.svg',
                                  height: 30,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          if (controller.selectedRadio.value == 2)
            Column(
              children: [
                InvestDetailWidget(
                  leadingTitle: 'Bank Name',
                  trailingTitle: controller.getUpiResponseModel.value.bankName,
                  // iconWidget:  InkWell(onTap: () async{
                  //   await Clipboard.setData(ClipboardData(text: "${controller.getUpiResponseModel.value.upi}"));
                  // },child: SvgPicture.asset('assets/profile_detail_icon/🦆 icon _copy success_.svg',height: 30,),),
                ),
                InvestDetailWidget(
                  leadingTitle: 'Bank Account Number',
                  trailingTitle:
                      controller.getUpiResponseModel.value.bankAcNumber,
                  iconWidget: InkWell(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(
                          text:
                              "${controller.getUpiResponseModel.value.bankAcNumber}"));
                    },
                    child: SvgPicture.asset(
                      'assets/profile_detail_icon/🦆 icon _copy success_.svg',
                      height: 30,
                    ),
                  ),
                ),
                InvestDetailWidget(
                  leadingTitle: 'IFSC',
                  trailingTitle: controller.getUpiResponseModel.value.ifscCode,
                  iconWidget: InkWell(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(
                          text:
                              "${controller.getUpiResponseModel.value.ifscCode}"));
                    },
                    child: SvgPicture.asset(
                      'assets/profile_detail_icon/🦆 icon _copy success_.svg',
                      height: 30,
                    ),
                  ),
                ),
              ],
            ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('*Important ',
                    style: TextStyle(color: greyTextColor, fontSize: 10)),
                Text('This is BEP20 deposit address type.s',
                    style: TextStyle(color: greyTextColor, fontSize: 10)),
                Text('Please deposit only USDT to this address',
                    style: TextStyle(color: greyTextColor, fontSize: 10)),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 50,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                clickCallback: () {
                  buildShowDialog(context);
                },
                title: "I HAVE SENT MONEY",
                radius: 8,
                color: yellowButtonColor,
                textColor: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      );
    });
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        // title: const Text("Alert Dialog Box"),
        content: SizedBox(
          height: 180,
          child: Column(
            children: [
              const Text(
                'Upload Screenshot',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
// Pick an image.
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.gallery);
                  controller.path = image?.path ?? "";
                },
                child: SvgPicture.asset(
                  'assets/home_screen_icons/🦆 icon _camera_.svg',
                  height: 50,
                  width: 50,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(thickness: 2),
              TextButton(
                  onPressed: () {
                    if (controller.path != "") {
                      controller.submitAndClaim();
                    } else {
                      CustomWidget().customSnackBar(
                          message: 'Please select the screenshot');
                    }
                  },
                  child: const Text('SUBMIT & CLAIM'))
            ],
          ),
        ),
      ),
    );
  }
}
