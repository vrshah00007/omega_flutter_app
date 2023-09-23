import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/utils/color_const.dart';

class PortfolioDetailCard extends StatelessWidget {
  String? leadingTitle;
  String? trailingTitle;

  PortfolioDetailCard({
    super.key,
    this.leadingTitle,
    this.trailingTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 27,
          left: 6,
          right: 6,
          child: Container(
              width: Get.width,
              height: 38,
              decoration: BoxDecoration(
                  color: iconGreyColor.withOpacity(0.4),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)))),
        ),
        Container(
          margin: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          height: 63,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(leadingTitle ?? ""),
            Text(
                ""
                "${trailingTitle ?? ""}",
                style: TextStyle(
                    color: greenColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
          ]),
        ),
      ],
    );
  }
}
