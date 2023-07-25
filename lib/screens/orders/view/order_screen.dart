import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/orders/controller/orders_controller.dart';

import '../widget/open_orders_tab_view_widget.dart';
import '../widget/order_tab_bar_widget.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({Key? key}) : super(key: key);
  final orderController = Get.find<OrdersController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: orderController.initialIndex.value,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: OrderTabBarWidget(),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            OpenOrdersTabViewWidget(),
            Text("Close Orders"),
          ],
        ),
      ),
    );
  }
}
