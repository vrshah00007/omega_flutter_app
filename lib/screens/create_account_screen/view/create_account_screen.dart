import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/screens/dashboard/view/dashboard.dart';
import 'package:omega_flutter_app/utils/color_const.dart';
import 'package:omega_flutter_app/utils/custom_textform_filed.dart';
import 'package:omega_flutter_app/utils/custom_widgets/custom_button.dart';

import '../../dashboard/controller/dashboard_binding.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: blueColor,
        title: const Text(
          "Create Account",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
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
