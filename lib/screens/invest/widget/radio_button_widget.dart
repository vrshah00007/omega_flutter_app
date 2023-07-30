import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_const.dart';
import '../../../utils/constants_labels.dart';
import '../controller/controller.dart';

class RadioButtonWidget extends StatelessWidget {
  const RadioButtonWidget({
    super.key,
    required this.investController,
  });

  final InvestController investController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Material(
          elevation: 4,
          child: Container(
            width: Get.width,
            // height: 70,

            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                  child: RadioListTile(
                    activeColor: greenColor,
                    value: 1,
                    groupValue: investController.selectedRadio.value,
                    onChanged: (value) {
                      investController.selectedRadio.value = value!;
                    },
                    title: const Text(ConstantsLabels.labelCrypto),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 30,
                  child: RadioListTile(
                    activeColor: greenColor,
                    value: 2,
                    groupValue: investController.selectedRadio.value,
                    onChanged: (value) {
                      investController.selectedRadio.value = value!;
                    },
                    title: const Text(ConstantsLabels.labelUpi),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 30,
                  child: RadioListTile(
                    activeColor: greenColor,
                    value: 3,
                    groupValue: investController.selectedRadio.value,
                    onChanged: (value) {
                      investController.selectedRadio.value = value!;
                    },
                    title: const Text(ConstantsLabels.labelNetBanking),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ));
  }
}
