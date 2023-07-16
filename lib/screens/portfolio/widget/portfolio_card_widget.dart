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
    return Card(
      color: whiteColor,
      child: ListTile(
        // contentPadding: const EdgeInsets.symmetric(horizontal: 16),

        title: Text(title),
        trailing: Text(subTitle ?? "",
            style: TextStyle(
                color: greenColor, fontSize: 16, fontWeight: FontWeight.w700)),
      ),
    );
  }
}
