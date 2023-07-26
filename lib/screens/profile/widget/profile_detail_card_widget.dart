import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/utils/color_const.dart';

class ProfileDetailCard extends StatelessWidget {
  String leading;
  String title;
  String subTitle;
  double? iconHeight;
  double? iconWidth;

  ProfileDetailCard({
    super.key,
    required this.title,
    required this.leading,
    required this.subTitle,
    this.iconHeight,
    this.iconWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 30,
          left: 7,
          right: 7,
          child: Container(
              width: Get.width,
              height: 46,
              decoration: BoxDecoration(
                  color: iconGreyColor.withOpacity(0.4),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8)))),
        ),
        Container(
          // height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            // contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            leading: SvgPicture.asset(leading,
                height: iconHeight, width: iconWidth, fit: BoxFit.cover),
            title: Text(title,
                style: TextStyle(fontSize: 14, color: greyTextColor)),
            subtitle: Text(subTitle ?? "",
                style: TextStyle(
                    color: blackButtonColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16)),
          ),
        ),
      ],
    );
  }
}
