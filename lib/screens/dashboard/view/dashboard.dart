import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:omega_flutter_app/routes/routes_name.dart';
import 'package:omega_flutter_app/screens/dashboard/controller/dashboard_controller.dart';
import 'package:omega_flutter_app/screens/dashboard/data/watch_list_api_request.dart';
import 'package:omega_flutter_app/screens/portfolio/controller/portfolio_controller.dart';
import 'package:omega_flutter_app/utils/color_const.dart';

import '../widget/bottom_navigation_bar.dart';
import '../widget/dashboard_body_widget.dart';
import '../widget/dashboard_drawer_widget.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  final dashboardController = Get.find<DashboardController>();


  // TabController tabController = TabController(length: 4, vsync: );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavigationBar(
          pageController: dashboardController.controller),
      drawer: customDrawer(dashboardController),
      appBar: AppBar(
        title: Obx(() => Text(
              dashboardController
                  .appbarTitle[dashboardController.selectedIcon.value],
              style: TextStyle(
                  fontSize: 16,
                  color: blackAppbarTitle,
                  fontWeight: FontWeight.w700),
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.searchScreen)?.then((value) {
                  CurrencyTradeApiRequestQuote().get();
                });
              },
              child: SvgPicture.asset(
                  "assets/home_screen_icons/🦆 icon _search normal 1_.svg",
                  height: 20,
                  width: 20,
                  fit: BoxFit.cover),
            ),
          )
        ],
      ),
      body:
          DashboardScreenWidget(pageController: dashboardController.controller),
    );
  }
}
