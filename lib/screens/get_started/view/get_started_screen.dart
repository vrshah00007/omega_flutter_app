import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/sign_in_screen/view/sign_in_screen.dart';

import '../../../utils/color_const.dart';
import '../../../utils/custom_widgets/custom_button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Image.asset(
                "assets/splash/get_started.png",
                fit: BoxFit.cover,
              ),
            ),
            const Text(
                "Trade with confidence and benefit from the reliability of a trusted broker with a proven record of security and liquidity.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                )),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: Get.width,
              height: 48,
              child: CustomButton(
                clickCallback: () {
                  Get.to(
                    () => const SignInScreen(),
                  );
                },
                title: 'LET’S GET STARTED',
                textColor: Colors.black,
                color: yellowButtonColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
