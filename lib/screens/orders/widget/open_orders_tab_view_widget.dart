import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:omega_flutter_app/utils/color_const.dart';
import 'package:omega_flutter_app/utils/constants_labels.dart';
import 'package:omega_flutter_app/utils/custom_widgets/custom_button.dart';

import '../controller/orders_controller.dart';
import 'order_list_tile_widget.dart';

class OpenOrdersTabViewWidget extends StatelessWidget {
  OpenOrdersTabViewWidget({Key? key}) : super(key: key);
  final orderController = Get.find<OrdersController>();

  final DateFormat formatter = DateFormat('dd-MM-yyyy-HH:mm');

  @override
  Widget build(BuildContext context) {
    return Obx(() => (orderController.orderHistoryOpen.value.buySellData !=
                null &&
            orderController.orderHistoryOpen.value.buySellData!.isNotEmpty)
        ? ListView.builder(
            padding: const EdgeInsets.only(top: 8),
            itemCount:
                orderController.orderHistoryOpen.value.buySellData?.length ?? 0,
            itemBuilder: (context, index) {
              var openOrder =
                  orderController.orderHistoryOpen.value.buySellData?[index];
              return Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 50.0, right: 8, left: 8),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OpenOrderListTile(
                              title: ConstantsLabels.labelCurrencyName,
                              subTitle: openOrder?.currencyName,
                            ),
                            OpenOrderListTile(
                              title: ConstantsLabels.labelCurrencyBuyPrice,
                              subTitle: openOrder?.ask,
                            ),
                            OpenOrderListTile(
                              title: ConstantsLabels.labelOrderedDate,
                              subTitle: formatter.format(
                                  DateTime.parse(openOrder?.date ?? "")),
                            ),
                            OpenOrderListTile(
                              title: ConstantsLabels.labelOrderID,
                              subTitle: openOrder?.orderId,
                            ),
                            OpenOrderListTile(
                              title: ConstantsLabels.labelOrderAmount,
                              subTitle: "\$ ${openOrder?.amountt}",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 25,
                      right: 40,
                      left: 40,
                      child: SizedBox(
                        height: 52,
                        child: CustomButton(
                            title: ConstantsLabels.labelSell,
                            color: redColor,
                            radius: 12,
                            textColor: whiteColor),
                      ))
                ],
              );
            },
          )
        : const Center(child: Text("No data available")));
  }
}
