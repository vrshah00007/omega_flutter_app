import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/dashboard/controller/dashboard_controller.dart';
import 'package:omega_flutter_app/utils/color_const.dart';

import '../widget/bottom_navigation_bar.dart';

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
      appBar: AppBar(
        // leadingWidth: ,
        leading: IconButton(
            onPressed: () {
              dashboardController.toggleDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: blueColor,
              size: 30,
            )),
        title: const Text(""),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),

            ),
          )
        ],
      ),
      body: Obx(() => ZoomDrawer(
            controller: dashboardController.zoomController.value,
            openCurve: Curves.fastOutSlowIn,
            closeCurve: Curves.bounceIn,
            menuScreen: customDrawer(),
            // isRtl: true,
            drawerShadowsBackgroundColor: Colors.white,
            slideWidth: Get.width * .7,
            angle: 0.0,
            mainScreen: DashboardScreenWidget(
                pageController: dashboardController.controller),
          )),
    );
  }
}

class DashboardScreenWidget extends StatelessWidget {
  PageController pageController;

  DashboardScreenWidget({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: Get.height,
      child: PageView(
        controller: pageController,

        physics: const NeverScrollableScrollPhysics(),
        // dragStartBehavior: DragStartBehavior.down,
        children: [
          // Add widgets here
          Container(child: const Center(child: Text("Watch List"))),
          const Center(child: Text("Portfolio")),
          const Center(child: Text("Orders")),
          const Center(child: Text("Portfolio")),
        ],
      ),
    );
  }
}

Widget customDrawer() {
  return const Drawer(
    backgroundColor: Colors.white,
    child: Column(
      children: [Text("Welcome Back")],
    ),
  );
}
