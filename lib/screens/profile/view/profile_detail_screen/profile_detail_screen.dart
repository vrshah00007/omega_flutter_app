import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/profile/controller/profile_detail_controller.dart';
import 'package:omega_flutter_app/utils/constants_labels.dart';
import 'package:omega_flutter_app/utils/icon_image_path.dart';
import '../../widget/profile_detail_card_widget.dart';
import '../../widget/profile_detail_stack_widget.dart';

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
            profileDetailStackWidget(model),
            ProfileDetailCard(
                leading: ImageConstants.iconUser,
                title: ConstantsLabels.nameLabel,
                subTitle: model.name ?? ""),
            ProfileDetailCard(
                leading: ImageConstants.iconEmail,
                title: ConstantsLabels.emailLabel,
                subTitle: model.email ?? ""),
            ProfileDetailCard(
                leading: ImageConstants.iconPhoneNumber,
                title: ConstantsLabels.labelContactNumber,
                subTitle: model.contactNo ?? ""),
            ProfileDetailCard(
                leading: ImageConstants.iconAccountNumber,
                title: ConstantsLabels.labelAccountNumber,
                subTitle: model.accountNumber ?? ""),
            ProfileDetailCard(
                leading: ImageConstants.iconIFSCCOde,
                title: ConstantsLabels.labelIFSCCODE,
                subTitle: model.ifscCode ?? ""),
            ProfileDetailCard(
                leading: ImageConstants.iconPanCard,
                title: ConstantsLabels.labelPanCardNumber,
                subTitle: model.panNo ?? ""),
            ProfileDetailCard(
                leading: ImageConstants.iconAdhaarCard,
                title: ConstantsLabels.labelAadhaarCardNumber,
                subTitle: model.addharNo ?? ""),
            const SizedBox(
              height: 28,
            )
          ],
        );
      }),
    );
  }
}
