import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/profile/controller/profile_detail_controller.dart';
import 'package:omega_flutter_app/screens/sign_in_screen/controller/login_controller.dart';
import 'package:omega_flutter_app/utils/constants_labels.dart';
import 'package:omega_flutter_app/utils/icon_image_path.dart';

import '../../../../utils/color_const.dart';

class ProfileDetailScreen extends StatelessWidget {
  ProfileDetailScreen({super.key});

  final profileController = Get.find<ProfileDetailController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        var model = profileController.responseModel.value;
        return ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Stack(
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
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                Positioned(
                    top: 90,
                    left: 120,
                    right: 120,
                    child: Text(
                      profileController.responseModel.value.email ?? "",
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
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 10,
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
                )
              ],
            ),
            Card(
              color: whiteColor,
              child: ListTile(
                // contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: SvgPicture.asset(ImageConstants.iconUser,
                    height: 20, width: 20, fit: BoxFit.cover),
                title: const Text(ConstantsLabels.nameLabel),
                subtitle: Text(model.name ?? ""),
              ),
            ),
            Card(
              color: whiteColor,
              child: ListTile(
                leading: SvgPicture.asset(ImageConstants.iconEmail,
                    height: 15, width: 15, fit: BoxFit.cover),
                title: const Text(ConstantsLabels.emailLabel),
                subtitle: Text(model.email ?? ""),
              ),
            ),
            Card(
              color: whiteColor,
              child: ListTile(
                leading: SvgPicture.asset(ImageConstants.iconPhoneNumber,
                    height: 20, width: 20, fit: BoxFit.cover),
                title: const Text(ConstantsLabels.labelContactNumber),
                subtitle: Text(model.contactNo ?? ""),
              ),
            ),
            Card(
              color: whiteColor,
              child: ListTile(
                leading: SvgPicture.asset(ImageConstants.iconAccountNumber,
                    height: 20, width: 20, fit: BoxFit.cover),
                title: const Text(ConstantsLabels.labelAccountNumber),
                subtitle: Text(model.accountNumber ?? ""),
              ),
            ),
            Card(
              color: whiteColor,
              child: ListTile(
                leading: SvgPicture.asset(ImageConstants.iconIFSCCOde,
                    height: 20, width: 20, fit: BoxFit.cover),
                title: const Text(ConstantsLabels.labelIFSCCODE),
                subtitle: Text(model.ifscCode ?? ""),
              ),
            ),
            Card(
              color: whiteColor,
              child: ListTile(
                leading: SvgPicture.asset(ImageConstants.iconPanCard,
                    height: 30, width: 30, fit: BoxFit.cover),
                title: const Text(ConstantsLabels.labelPanCardNumber),
                subtitle: Text(model.panNo ?? ""),
              ),
            ),
            Card(
              color: whiteColor,
              child: ListTile(
                leading: SvgPicture.asset(ImageConstants.iconAdhaarCard,
                    height: 20, width: 20, fit: BoxFit.cover),
                title: const Text(ConstantsLabels.labelAadhaarCardNumber),
                subtitle: Text(model.addharNo ?? ""),
              ),
            ),
            const SizedBox(
              height: 28,
            )
          ],
        );
      }),
    );
  }
}
