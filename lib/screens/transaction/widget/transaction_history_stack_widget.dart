import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/color_const.dart';
import '../../../utils/constants_labels.dart';
import '../controller/transaction_controller.dart';

class TransactionHistoryStackWidget extends StatelessWidget {
  const TransactionHistoryStackWidget({
    super.key,
    required this.transactionController,
    required this.formatter,
  });

  final TransactionController transactionController;
  final DateFormat formatter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.6,
      child: Stack(children: [
        Positioned(
          top: 0,
          right: 8,
          left: 8,
          child: Container(
            height: Get.height * 0.15,
            width: Get.width,
            decoration: BoxDecoration(
                color: greyColor,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8), topLeft: Radius.circular(8))),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  Text(
                    "Type",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  Text(
                    ConstantsLabels.labelOrderAmount,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 60,
          right: 8,
          left: 8,
          // left: 150,
          // right: 150,
          child: Container(
            // height: 60,

            // width: 60,
            width: Get.width,
            height: Get.height * 0.5,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8), topLeft: Radius.circular(8))),
            alignment: Alignment.center,
            child: ListView.builder(
              itemCount:
                  transactionController.transactionList.value.data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                var transactionData =
                    transactionController.transactionList.value.data?[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          formatter.format(
                              DateTime.parse(transactionData?.date ?? "")),
                          style: TextStyle(fontWeight: FontWeight.w400)),
                      Text(transactionData?.currencyName ?? ""),
                      Text("\$ ${double.parse(transactionData?.amount ?? "0").toStringAsFixed(2) ?? " "}")
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ]),
    );
  }
}
