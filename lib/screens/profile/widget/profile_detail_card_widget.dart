import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omega_flutter_app/utils/color_const.dart';

class ProfileDetailCard extends StatelessWidget {
  String leading;
  String title;
  String subTitle;

  ProfileDetailCard({
    super.key,
    required this.title,
    required this.leading,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(8),
      shadowColor: Colors.black,
      animationDuration: const Duration(milliseconds: 500),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ListTile(
          // contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          leading: SvgPicture.asset(leading,
              height: 20, width: 20, fit: BoxFit.cover),
          title: Text(title),
          subtitle: Text(subTitle ?? ""),
        ),
      ),
    );
  }
}
