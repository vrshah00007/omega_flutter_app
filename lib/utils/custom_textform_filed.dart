import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color_const.dart';

class CustomTextFormField extends StatelessWidget {
  String hintText;
  bool? isPassword;

  CustomTextFormField({
    Key? key,
    required this.hintText,
    this.isPassword,
  }) : super(key: key);
  final RxBool _showPassword = true.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      print(_showPassword.value);
      return TextFormField(
        obscureText: (isPassword != null && isPassword == true)
            ? _showPassword.value
            : false,
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          border: InputBorder.none,
          suffixIcon: (isPassword != null && isPassword!)
              ? IconButton(
                  onPressed: () {
                    _showPassword.value = !_showPassword.value;
                  },
                  icon: (_showPassword.value)
                      ? const Icon(
                          Icons.visibility_outlined,
                        )
                      : const Icon(Icons.visibility_off_outlined))
              : null,
          hintText: hintText,
          enabledBorder: buildOutlineInputBorder(),
          disabledBorder: buildOutlineInputBorder(),
          errorBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          focusedErrorBorder: buildOutlineInputBorder(),
        ),
      );
    });
  }

  OutlineInputBorder buildOutlineInputBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: borderGreyColor));
}
