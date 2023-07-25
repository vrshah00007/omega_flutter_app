import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omega_flutter_app/utils/color_const.dart';

class PortfolioCard extends StatelessWidget {
  String title;
  String subTitle;

  PortfolioCard({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 2,
        child: Container(
          color: whiteColor,
          child: ListTile(
            title: Text(title ?? ""),
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
