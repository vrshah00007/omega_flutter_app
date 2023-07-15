import 'package:flutter/material.dart';
import 'package:omega_flutter_app/screens/dashboard/controller/dashboard_controller.dart';

import '../../../utils/custom_widgets/custom_widget.dart';

Widget customDrawer(DashboardController dashboardController) {
  return Drawer(
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
            height: 16,
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
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 6, bottom: 6),
                  child: Text(drawerList,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                );
              },
            ),
          )
        ],
      ),
    ),
  );
}
