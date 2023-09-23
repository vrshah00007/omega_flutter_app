import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:omega_flutter_app/screens/orders/widget/order_list_tile_widget.dart';
import 'package:omega_flutter_app/utils/constants_labels.dart';

import '../../../utils/color_const.dart';
import '../controller/orders_controller.dart';

class CloseOrderTabViewWidget extends StatelessWidget {
  CloseOrderTabViewWidget({super.key});

  final orderController = Get.find<OrdersController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        itemCount:
            orderController.orderHistoryClose.value.buySellData?.length ?? 0,
        itemBuilder: (context, index) {
          var closeOrder =
              orderController.orderHistoryClose.value.buySellData?[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 2, right: 8, left: 8),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        OpenOrderListTile(
                          title: ConstantsLabels.labelCurrencyName,
                          subTitle: closeOrder?.currencyName ?? "",
                        ),
                        OpenOrderListTile(
                          title: ConstantsLabels.labelOrderedDate,
                          subTitle: closeOrder?.date ?? "",
                        ),
                        OpenOrderListTile(
                          title: ConstantsLabels.labelOrderID,
                          subTitle: closeOrder?.orderId ?? "",
                        ),
                        OpenOrderListTile(
                          title: ConstantsLabels.labelOrderAmount,
                          subTitle: double.parse(closeOrder?.amount ?? "0.0")
                              .toStringAsFixed(0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
