import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:omega_flutter_app/screens/dashboard/controller/dashboard_controller.dart';
import 'package:omega_flutter_app/screens/invest/controller/binding.dart';
import 'package:omega_flutter_app/screens/invest/view/withdrawal_money_screen.dart';
import 'package:omega_flutter_app/screens/orders/controller/orders_controller.dart';
import 'package:omega_flutter_app/screens/portfolio/controller/portfolio_controller.dart';
import 'package:omega_flutter_app/screens/profile/controller/profile_detail_controller.dart';
import 'package:omega_flutter_app/screens/transaction/model/local_database_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/routes_name.dart';
import '../../../utils/custom_widgets/custom_widget.dart';
import '../../../utils/shared_preference_helper.dart';

Widget customDrawer(DashboardController dashboardController) {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final dashboardController = Get.find<DashboardController>();
  return Drawer(
    key: scaffoldKey,
    backgroundColor: Colors.white,
    elevation: 10,
    child: SafeArea(
      bottom: true,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(
                          30,
                        )),
                    height: 50,
                    width: 50,
                  ),
                  TextWidget16(
                      text: "Welcome\nBack", fontWeight: FontWeight.bold),
                ],
              ),
              IconButton(
                  onPressed: () async {
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.clear();
                    // boxLocalDatabase.values.map((e) => null)
                    boxLocalDatabase?.clear();
                    // Hive.box('currencyDataBody').delete(key);

                    Get.offAllNamed(Routes.loginScreen);
                  },
                  icon: const Icon(Icons.logout_outlined))
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            // height: Get.height * .72,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: dashboardController.drawerItemList.length,
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 8, top: 0),
                  child: Divider(),
                );
              },
              itemBuilder: (context, index) {
                var drawerList = dashboardController.drawerItemList[index];
                var drawerIconList = dashboardController.drawerIconList[index];
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 0, bottom: 6),
                  child: GestureDetector(
                    onTap: () {
                      if (scaffoldKey.currentState?.isDrawerOpen ?? true) {
                        Get.back();
                      }
                      if (index == 7) {
                        Get.toNamed(Routes.transactionScreen);
                      } else if (index == 4) {
                        Get.find<ProfileDetailController>().getProfileDetail();
                        Get.find<PortfolioController>().getPortfolioDetails();
                        Get.toNamed(Routes.investScreen);
                      } else if (index == 0) {
                        // dashboardController.
                        dashboardController.selectedIcon.value = 0;
                        dashboardController.controller.animateToPage(0,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear);
                      } else if (index == 1) {
                        dashboardController.selectedIcon.value = 3;
                        Get.find<ProfileDetailController>().getProfileDetail();
                        dashboardController.controller.animateToPage(3,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear);
                      } else if (index == 6) {
                        dashboardController.selectedIcon.value = 1;
                        Get.find<PortfolioController>().getPortfolioDetails();
                        dashboardController.controller.animateToPage(1,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear);
                      } else if (index == 8) {
                        dashboardController.selectedIcon.value = 2;
                        Get.find<OrdersController>().closeOrderHistory();
                        Get.find<OrdersController>().openOrderHistory();
                        dashboardController.controller.animateToPage(2,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear);
                      } else if (index == 5) {
                        InvestBinding().dependencies();
                        Get.to(() => WithdrawalMoneyScreen());
                      }
                    },
                    child: Row(
                      children: [
                        // SvgPicture.asset(drawerIconList,
                        //     height: 25, width: 26, color: Colors.black),
                        Image.asset(
                          drawerIconList,
                          height: 25,
                          width: 25,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(drawerList,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ),
  );
}
