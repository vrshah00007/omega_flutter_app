import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/sign_in_screen/controller/login_controller.dart';
import 'package:omega_flutter_app/utils/custom_textform_filed.dart';
import 'package:omega_flutter_app/utils/custom_widgets/custom_button.dart';

import '../../../utils/color_const.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({Key? key}) : super(key: key);
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(hintText: "Email address",borderRadius: 16),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(hintText: "Password", isPassword: true, borderRadius: 16,),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Obx(
                () => Checkbox(
                  activeColor: blueColor,
                  value: loginController.isChecked.value,
                  onChanged: (value) {
                    loginController.isChecked.value = value!;
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width * .7,
                    child: RichText(
                      text: const TextSpan(
                        text:
                            'I confirm that i am not a U.S citizen resident, or affiliate.',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        // children: [
                        //   TextSpan(
                        //       text: "See why this is important",
                        //       recognizer: TapAndPanGestureRecognizer()
                        //         ..onTapDown = (details) {
                        //           print("lksjdj fkdhgjfgj");
                        //         },
                        //       style: TextStyle(
                        //         color: blueColor,
                        //       )),
                        // ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 36,
          ),
          SizedBox(
            height: 48,
            child: CustomButton(
              title: "Login",
              color: yellowButtonColor,
              textColor: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
