import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/utils/color_const.dart';

class PortfolioCard extends StatelessWidget {
  String title;
  String subTitle;
  Color? textColor;

  PortfolioCard({
    super.key,
    required this.title,
    required this.subTitle,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          // margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ListTile(
            title: Text(title ?? "",
                style: TextStyle(
                  color: textColor,

                )),
            trailing: Text(subTitle ?? "",
                style: TextStyle(
                    color: greenColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
          ),
        ),
      ),
    );
  }
}
