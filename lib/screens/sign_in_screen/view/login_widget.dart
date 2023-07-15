import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/sign_in_screen/controller/login_controller.dart';
import 'package:omega_flutter_app/utils/custom_textform_filed.dart';
import 'package:omega_flutter_app/utils/custom_widgets/custom_button.dart';

import '../../../utils/color_const.dart';
import '../../../utils/custom_widgets/custom_widget.dart';

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
          CustomTextFormField(
            hintText: "Email address",
            borderRadius: 16,
            textEditingController: loginController.emailController.value,
            inputFormatter: [FilteringTextInputFormatter.deny(" ")],
          ),
          CustomTextFormField(
            hintText: "Password",
            isPassword: true,
            inputFormatter: [FilteringTextInputFormatter.deny(" ")],
            borderRadius: 16,
            textEditingController: loginController.passwordController.value,
          ),
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
          Obx(
            () => SizedBox(
                height: 48,
                child: loginController.isLoading.value
                    ? const Center(child: CommonLoading())
                    : CustomButton(
                        clickCallback: () {
                          loginController.loginCheck();
                        },
                        title: "Login",
                        color: yellowButtonColor,
                        textColor: Colors.black,
                      )),
          )
        ],
      ),
    );
  }
}
