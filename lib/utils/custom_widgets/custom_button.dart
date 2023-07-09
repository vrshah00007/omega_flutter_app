import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  VoidCallback? clickCallback;
  String title;
  Color color;
  Color textColor;

  CustomButton(
      {Key? key,
      this.clickCallback,
      required this.title,
      required this.color,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: clickCallback,
      style: ButtonStyle(
          elevation: MaterialStatePropertyAll(0),
          backgroundColor: MaterialStatePropertyAll(color),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)))),
      child: Text(
        title,
        style: TextStyle(
            color: textColor, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
