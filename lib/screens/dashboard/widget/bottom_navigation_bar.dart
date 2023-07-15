import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/utils/color_const.dart';

import '../controller/dashboard_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  PageController pageController;

  CustomBottomNavigationBar({
    super.key,
    required this.pageController,
  });

  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          selectedItemColor: activeIconBlueColor,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(color: activeIconBlueColor),
          unselectedItemColor: iconGreyColor,
          currentIndex: dashboardController.selectedIcon.value,
          onTap: (value) {
            dashboardController.selectedIcon.value = value;
            pageController.animateToPage(value,
                duration: const Duration(milliseconds: 1),
                curve: Curves.linear);
          },
          items: [
            customBottomNavigationBarItem(
              icon: "assets/home_screen_icons/🦆 icon _home 2_.svg",
              label: "Home",
            ),
            customBottomNavigationBarItem(
              icon: "assets/home_screen_icons/🦆 icon _folder open_.svg",
              label: "Portfolio",
            ),
            customBottomNavigationBarItem(
              icon: "assets/home_screen_icons/🦆 icon _mobile_.svg",
              label: "Orders",
            ),
            customBottomNavigationBarItem(
              icon: "assets/home_screen_icons/🦆 icon _user_.svg",
              label: "Orders",
            ),
          ],
        ));
  }

  BottomNavigationBarItem customBottomNavigationBarItem(
      {String? icon, String? label}) {
    return BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        icon ?? "",
        height: 20,
        color: activeIconBlueColor,
      ),
      icon: SvgPicture.asset(
        icon ?? '',
        height: 20,
        color: iconGreyColor,
      ),
      label: label,
    );
  }
}
