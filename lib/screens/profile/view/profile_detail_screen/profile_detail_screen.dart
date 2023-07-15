import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/color_const.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
