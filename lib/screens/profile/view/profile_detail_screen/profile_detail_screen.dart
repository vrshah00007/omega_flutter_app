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
      backgroundColor: Colors.white,
      body: Obx(() {
        var model = profileController.responseModel.value;
        return ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            profileDetailStackWidget(model),

            ProfileDetailCard(
              leading: ImageConstants.iconUser,
              title: ConstantsLabels.nameLabel,
              subTitle: model.name ?? "",
              iconHeight: 26,
              iconWidth: 26,
            ),
            ProfileDetailCard(
              leading: ImageConstants.iconEmail,
              title: ConstantsLabels.emailLabel,
              subTitle: model.email ?? "",
              iconHeight: 22,
              iconWidth: 22,
            ),
            ProfileDetailCard(
              leading: ImageConstants.iconPhoneNumber,
              title: ConstantsLabels.labelContactNumber,
              subTitle: model.contactNo ?? "",
              iconHeight: 28,
              iconWidth: 28,
            ),
            ProfileDetailCard(
              leading: ImageConstants.iconAccountNumber,
              title: ConstantsLabels.labelAccountNumber,
              subTitle: model.accountNumber ?? "",
              iconHeight: 26,
              iconWidth: 26,
            ),
            ProfileDetailCard(
              leading: ImageConstants.iconIFSCCOde,
              title: ConstantsLabels.labelIFSCCODE,
              subTitle: model.ifscCode ?? "",
              iconHeight: 26,
              iconWidth: 26,
            ),
            ProfileDetailCard(
              leading: ImageConstants.iconPanCard,
              title: ConstantsLabels.labelPanCardNumber,
              subTitle: model.panNo ?? "",
              iconHeight: 30,
              iconWidth: 30,
            ),
            ProfileDetailCard(
              leading: ImageConstants.iconAdhaarCard,
              title: ConstantsLabels.labelAadhaarCardNumber,
              subTitle: model.addharNo ?? "",
              iconHeight: 26,
              iconWidth: 26,
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
