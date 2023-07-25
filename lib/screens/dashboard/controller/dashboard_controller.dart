import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/constants_labels.dart';

class DashboardController extends GetxController {
  RxInt selectedIcon = 0.obs;

  final PageController controller = PageController();



  List drawerItemList = [
    "Watchlist",
    "Profile",
    "Chart",
    "Calendar",
    "Invest",
    "Withdraw",
    "Portfolio",
    "Transaction",
    "Order",
  ];
  List drawerIconList=[
    'assets/drawer_icons/Watchlist.png',
    'assets/drawer_icons/Personal information.png',
    'assets/drawer_icons/Graph.png',
    'assets/drawer_icons/Appointment.png',
    'assets/drawer_icons/Stock market.png',
    'assets/drawer_icons/Bank.png',
    'assets/drawer_icons/Briefcase.png',
    'assets/drawer_icons/Negotiating.png',
    'assets/drawer_icons/Fulfillment.png',

  ];

  List appbarTitle = [
    ConstantsLabels.homeLabel,
    ConstantsLabels.portfolioLabel,
    ConstantsLabels.orderLabel,
    ConstantsLabels.profileLabel,
  ];
}
