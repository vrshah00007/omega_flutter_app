import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt selectedIcon = 0.obs;
  Rx<ZoomDrawerController> zoomController = ZoomDrawerController().obs;
  final PageController controller = PageController();

  void toggleDrawer() {
    zoomController.value.toggle!.call();
    update();
  }
}
