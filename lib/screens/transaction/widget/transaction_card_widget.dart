import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/utils/color_const.dart';

class TransactionCardWidget extends StatelessWidget {
  String? leadingTitle;
  String? trailingTitle;

  TransactionCardWidget({
    super.key,
    this.leadingTitle,
    this.trailingTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Stack(
        children: [
          Container(
            height: 53,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 1, right: 1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(leadingTitle ?? ""),
                  Text("\$ ${trailingTitle ?? ""}")
                ]),
          ),
        ],
      ),
    );
  }
}
