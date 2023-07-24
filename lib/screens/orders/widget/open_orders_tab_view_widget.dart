import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/utils/constants_labels.dart';

import '../controller/orders_controller.dart';

class OpenOrdersTabViewWidget extends StatelessWidget {
  OpenOrdersTabViewWidget({Key? key}) : super(key: key);
  final orderController = Get.find<OrdersController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      itemCount:
          orderController.orderHistoryOpen.value.buySellData?.length ?? 0,
      itemBuilder: (context, index) {
        var openOrder =
            orderController.orderHistoryOpen.value.buySellData?[index];
        return Material(
          elevation: 2,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(ConstantsLabels.labelCurrencyName),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(openOrder?.currencyName ?? ""),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(ConstantsLabels.labelCurrencyBuyPrice),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(openOrder?.currencyName ?? ""),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
