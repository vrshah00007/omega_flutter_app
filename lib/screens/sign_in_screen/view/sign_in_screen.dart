import 'package:flutter/material.dart';
import 'package:omega_flutter_app/screens/sign_in_screen/view/sign_up_widget.dart';
import 'package:omega_flutter_app/utils/color_const.dart';

import 'login_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: blueColor,
              )),
          bottom: TabBar(
            labelColor: blueColor,
            // dividerColor: blueColor,
            indicatorColor: blueColor,

            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(child: Text("SIGN UP")),
              Tab(child: Text("LOG IN")),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            SignUpWidget(),
            LoginWidget(),
          ],
        ),
      ),
    );
  }
}
