import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CustomWidget {
  customSnackBar({String? message}) {
    return Get.rawSnackbar(
      padding: EdgeInsets.zero,
      titleText: Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 8, top: 12),
        child: Text(
          message ?? '',
          style: TextStyle(color: Colors.white),
        ),
      ),
      messageText: SizedBox(height: 0, child: Text("")),
    );
  }

  customToast(String msg){
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
