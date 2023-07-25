import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/orders/controller/orders_controller.dart';

import '../../../utils/constants_labels.dart';

class OrderTabBarWidget extends StatelessWidget {
  const OrderTabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: const [
        Tab(
          child: Text(ConstantsLabels.labelOpenOrder),
        ),
        Tab(
          child: Text(ConstantsLabels.labelCloseOrder),
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
