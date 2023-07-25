import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/dashboard/controller/dashboard_controller.dart';

import '../../../routes/routes_name.dart';
import '../../../utils/custom_widgets/custom_widget.dart';

Widget customDrawer(DashboardController dashboardController) {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  return Drawer(
    key: scaffoldKey,
    backgroundColor: Colors.white,
    elevation: 10,
    child: SafeArea(
      bottom: true,
      child: Column(
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
              TextWidget16(text: "Welcome\nBack", fontWeight: FontWeight.bold),
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
