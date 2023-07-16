import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/portfolio/controller/portfolio_controller.dart';
import 'package:omega_flutter_app/screens/profile/controller/profile_detail_controller.dart';
import 'package:omega_flutter_app/utils/color_const.dart';
import 'package:omega_flutter_app/utils/constants_labels.dart';

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
            print(value);
            if (value == 3) {
              ProfileDetailController().getProfileDetail();
            } else if (value == 1) {
              PortfolioController().getPortfolioDetails();
            }
          },
          items: bottomItems(),
        ));
  }

  List<BottomNavigationBarItem> bottomItems() {
    return [
      customBottomNavigationBarItem(
        icon: "assets/home_screen_icons/🦆 icon _home 2_.svg",
        label: ConstantsLabels.homeLabel,
      ),
      customBottomNavigationBarItem(
        icon: "assets/home_screen_icons/🦆 icon _folder open_.svg",
        label: ConstantsLabels.portfolioLabel,
      ),
      customBottomNavigationBarItem(
        icon: "assets/home_screen_icons/🦆 icon _mobile_.svg",
        label: ConstantsLabels.orderLabel,
      ),
      customBottomNavigationBarItem(
        icon: "assets/home_screen_icons/🦆 icon _user_.svg",
        label: ConstantsLabels.profileLabel,
      ),
    ];
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
