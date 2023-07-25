import 'package:flutter/material.dart';

import '../../../utils/constants_labels.dart';

class OrderTabBarWidget extends StatelessWidget {
  const OrderTabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: const [
        Tab(
          child: Text(ConstantsLabels.labelOpenOrder),
        ),
        Tab(
          child: Text(ConstantsLabels.labelCancelOrder),
        ),
      ],
      onTap: (value) {

      },
    );
  }
}