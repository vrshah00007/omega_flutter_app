import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/sign_in_screen/controller/sign_up_controller.dart';
import 'package:omega_flutter_app/utils/color_const.dart';
import 'package:omega_flutter_app/utils/custom_textform_filed.dart';
import 'package:omega_flutter_app/utils/custom_widgets/custom_button.dart';

import '../../create_account_screen/view/create_account_screen.dart';
import '../../dashboard/controller/dashboard_binding.dart';
import '../../dashboard/view/dashboard.dart';

class SignUpWidget extends StatelessWidget {
  SignUpWidget({Key? key}) : super(key: key);
  final signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: ListView(
        shrinkWrap: true,
        children: [
          // CustomTextFormField(
          //   hintText: "First Name",
          //   isPassword: false,
          //   borderRadius: 16,
          // ),
          // CustomTextFormField(
          //   hintText: "Last Name",
          //   isPassword: false,
          //   borderRadius: 16,
          // ),
          // CustomTextFormField(
          //   hintText: "Email",
          //   isPassword: false,
          //   borderRadius: 16,
          // ),
          // CustomTextFormField(
          //   hintText: "Password",
          //   isPassword: true,
          //   borderRadius: 16,
          // ),
          // const SizedBox(
          //   height: 16,
          // ),
          // Row(
          //   children: [
          //     Obx(
          //       () => Checkbox(
          //         activeColor: blueColor,
          //         value: signUpController.isChecked.value,
          //         onChanged: (value) {
          //           signUpController.isChecked.value = value!;
          //         },
          //       ),
          //     ),
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         SizedBox(
          //           width: Get.width * .7,
          //           child: RichText(
          //             text: TextSpan(
          //               text:
          //                   'I confirm that i am not a U.S citizen resident, or affiliate.',
          //               style: const TextStyle(
          //                 color: Colors.black,
          //               ),
          //               children: [
          //                 TextSpan(
          //                     text: "See why this is important",
          //                     recognizer: TapAndPanGestureRecognizer()
          //                       ..onTapDown = (details) {
          //                         print("lksjdj fkdhgjfgj");
          //                       },
          //                     style: TextStyle(
          //                       color: blueColor,
          //                     )),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 16,
          // ),
          // SizedBox(
          //   height: 54,
          //   child: CustomButton(
          //     title: "SIGN UP",
          //     color: yellowButtonColor,
          //     textColor: Colors.black,
          //     clickCallback: () {
          //       Get.to(() => CreateAccountScreen());
          //     },
          //   ),
          // )
          SizedBox(height: 16,),
          const Text("Add your details to sign up"),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: "Enter username",
            borderRadius: 8,
            title: "User name",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            hintText: "Enter email id",
            borderRadius: 8,
            title: "Email Address",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            hintText: "Enter mobile number",
            borderRadius: 8,
            title: "Mobile Number",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            hintText: "Enter city name",
            borderRadius: 8,
            title: "City",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            hintText: "Enter state name",
            borderRadius: 8,
            title: "State",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            hintText: "Select Country",
            borderRadius: 8,
            title: "Country",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            hintText: "Select and upload",
            borderRadius: 8,
            title: "Upload Front Aadhaar card",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            hintText: "Select and upload",
            borderRadius: 8,
            title: "Upload backside Aadhaar card",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            hintText: "Enter PAN card number",
            borderRadius: 8,
            title: "PAN Card",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            hintText: "Bank Name",
            borderRadius: 8,
            title: "Enter bank name",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            hintText: "Bank Account No.",
            borderRadius: 8,
            title: "Enter bank account number",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            hintText: "Enter IFSC code",
            borderRadius: 8,
            title: "IFSC Code",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            hintText: "Enter password",
            borderRadius: 8,
            title: "Password",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            hintText: "Re-Enter Password",
            borderRadius: 8,
            title: "Confirm Password",
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 48,
            child: CustomButton(
                title: "Sign Up",
                color: blackButtonColor,
                clickCallback: () {
                  Get.to(
                    () => Dashboard(),
                    binding: DashboardBinding(),
                  );
                },
                textColor: Colors.white),
          ),
          const SizedBox(
            height: 22,
          ),
          Divider(
            color: dividerButtonColor,
          ),
          const SizedBox(
            height: 22,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                // width: Get.width * .7,
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      color: borderGreyColor,
                    ),
                    children: [
                      TextSpan(
                          text: "LOG IN",
                          recognizer: TapAndPanGestureRecognizer()
                            ..onTapDown = (details) {
                              print("lksjdj fkdhgjfgj");
                            },
                          style: TextStyle(
                            color: blackButtonColor,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
