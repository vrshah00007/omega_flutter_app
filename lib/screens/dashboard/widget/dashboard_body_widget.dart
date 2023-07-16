import 'package:flutter/material.dart';
import 'package:omega_flutter_app/screens/profile/view/profile_detail_screen/profile_detail_screen.dart';

class DashboardScreenWidget extends StatelessWidget {
  PageController pageController;

  DashboardScreenWidget({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: Get.height,
      child: PageView(
        controller: pageController,

        physics: const NeverScrollableScrollPhysics(),
        // dragStartBehavior: DragStartBehavior.down,
        children: [
          // Add widgets here
          const Center(child: Text("Watch List")),
          const Center(child: Text("Portfolio")),
          const Center(child: Text("Orders")),
          ProfileDetailScreen(),
        ],
      ),
    );
  }
}
