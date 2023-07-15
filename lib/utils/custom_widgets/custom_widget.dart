import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/utils/color_const.dart';

class CustomWidget {
  customSnackBar({String? message}) {
    return Get.rawSnackbar(
      padding: EdgeInsets.zero,
      titleText: Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 8, top: 12),
        child: Text(
          message ?? '',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      messageText: const SizedBox(height: 0, child: Text("")),
    );
  }

  customToast(String msg) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

class CommonLoading extends StatelessWidget {
  const CommonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: yellowButtonColor,
    );
  }
}


class TextWidget16 extends StatelessWidget {
  String text;
  FontWeight fontWeight;

  TextWidget16({
    super.key,
    required this.text,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 16, fontWeight: fontWeight));
  }
}