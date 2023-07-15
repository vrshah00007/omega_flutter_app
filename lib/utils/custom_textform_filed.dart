import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'color_const.dart';

class CustomTextFormField extends StatelessWidget {
  String hintText;
  String? title = "";
  bool? isPassword;
  double borderRadius = 0.0;
  TextEditingController? textEditingController;
  List<TextInputFormatter>? inputFormatter;

  CustomTextFormField({
    Key? key,
    required this.hintText,
    this.isPassword,
    this.title,
    required this.borderRadius,
    this.textEditingController,
    this.inputFormatter,
  }) : super(key: key);
  final RxBool _showPassword = true.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      print(_showPassword.value);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != "")
            Text(title ?? '',
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            controller: textEditingController,
            obscureText: (isPassword != null && isPassword == true)
                ? _showPassword.value
                : false,
            inputFormatters: inputFormatter,
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
              enabledBorder: buildOutlineInputBorder(borderRadius),
              disabledBorder: buildOutlineInputBorder(borderRadius),
              errorBorder: buildOutlineInputBorder(borderRadius),
              focusedBorder: buildOutlineInputBorder(borderRadius),
              focusedErrorBorder: buildOutlineInputBorder(borderRadius),
            ),
          ),
        ],
      );
    });
  }

  OutlineInputBorder buildOutlineInputBorder(double? radius) =>
      OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 0.0),
          borderSide: BorderSide(color: borderGreyColor));
}
