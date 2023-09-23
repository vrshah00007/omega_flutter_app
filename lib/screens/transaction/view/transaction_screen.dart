import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:omega_flutter_app/screens/profile/widget/profile_detail_card_widget.dart';
import 'package:omega_flutter_app/screens/transaction/controller/transaction_controller.dart';
import 'package:omega_flutter_app/utils/color_const.dart';
import 'package:omega_flutter_app/utils/constants_labels.dart';

import '../widget/transaction_card_widget.dart';
import '../widget/transaction_history_stack_widget.dart';

class TransactionScreen extends StatelessWidget {
  TransactionScreen({super.key});

  final transactionController = Get.find<TransactionController>();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text(ConstantsLabels.labelTransaction,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: blackAppbarTitle)),
        centerTitle: false,
      ),
      body: Obx(() => ListView(
            children: [
              TransactionCardWidget(
                trailingTitle: transactionController
                        .transactionList.value.invest
                        .toString() ??
                    "",
                leadingTitle: ConstantsLabels.labelTotalInvest,
              ),
              TransactionCardWidget(
                trailingTitle: transactionController
                        .transactionList.value.withdrawal
                        .toString() ??
                    "",
                leadingTitle: ConstantsLabels.labelTotalWithdrawal,
              ),
              TransactionCardWidget(
                trailingTitle: transactionController
                        .transactionList.value.profit
                        .toString() ??
                    "",
                leadingTitle: ConstantsLabels.labelTotalProfit,
              ),
              TransactionCardWidget(
                trailingTitle: transactionController
                        .transactionList.value.loss
                        .toString() ??
                    "",
                leadingTitle: ConstantsLabels.labelTotalLoss,
              ),
              const SizedBox(
                height: 20,
              ),
              TransactionHistoryStackWidget(transactionController: transactionController, formatter: formatter),
            ],
          )),
    );
  }
}

