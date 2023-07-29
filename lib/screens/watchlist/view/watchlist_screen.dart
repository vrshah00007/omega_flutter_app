import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color_const.dart';
import '../../../utils/constants_labels.dart';
import '../widget/watchlist_tabbar_view.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            bottom: TabBar(
              labelColor: blueColor,
              indicatorColor: blueColor,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  child: Text(ConstantsLabels.labelWatchList,
                      style: GoogleFonts.inter()),
                ),
                const Tab(
                  child: Text(""),
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            WatchlistTabBarView(),
            WatchlistTabBarView(),
          ],
        ),
      ),
    );
  }
}
