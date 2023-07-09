import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/sign_in_screen/controller/sign_up_controller.dart';
import 'package:omega_flutter_app/utils/color_const.dart';
import 'package:omega_flutter_app/utils/custom_textform_filed.dart';
import 'package:omega_flutter_app/utils/custom_widgets/custom_button.dart';

class SignUpWidget extends StatelessWidget {
  SignUpWidget({Key? key}) : super(key: key);
  final signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ListView(
        shrinkWrap: true,
        children: [
          CustomTextFormField(
            hintText: "First Name",
            isPassword: false,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: "Last Name",
            isPassword: false,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: "Email",
            isPassword: false,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: "Password",
            isPassword: true,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Obx(
                () => Checkbox(
                  activeColor: blueColor,
                  value: signUpController.isChecked.value,
                  onChanged: (value) {
                    signUpController.isChecked.value = value!;
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
                      text: TextSpan(
                        text:
                            'I confirm that i am not a U.S citizen resident, or affiliate.',
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                              text: "See why this is important",
                              recognizer: TapAndPanGestureRecognizer()
                                ..onTapDown = (details) {
                                  print("lksjdj fkdhgjfgj");
                                },
                              style: TextStyle(
                                color: blueColor,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 54,
            child: CustomButton(
              title: "SIGN UP",
              color: yellowButtonColor,
              textColor: Colors.black,
              clickCallback: () {},
            ),
          )
        ],
      ),
    );
  }
}
