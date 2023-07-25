import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/orders/controller/orders_controller.dart';
import 'package:omega_flutter_app/utils/color_const.dart';

import '../../../utils/constants_labels.dart';

class OrderTabBarWidget extends StatelessWidget {
  const OrderTabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: blueColor,
      indicatorColor: blueColor,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      tabs: [
        Tab(
          child: Text(ConstantsLabels.labelOpenOrder.toUpperCase()),
        ),
        Tab(
          child: Text(ConstantsLabels.labelCloseOrder.toUpperCase()),
        ),
      ],
      onTap: (value) {
        if (value == 0) {
        } else {
          Get.find<OrdersController>().closeOrderHistory();
        }
      },
    );
  }
}
