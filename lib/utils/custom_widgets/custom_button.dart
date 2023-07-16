import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  VoidCallback? clickCallback;
  String title;
  Color color;
  Color textColor;
  double? radius;

  CustomButton(
      {Key? key,
      this.clickCallback,
      required this.title,
      required this.color,
      this.radius,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: clickCallback,
      style: ButtonStyle(
          elevation: MaterialStatePropertyAll(0),
          backgroundColor: MaterialStatePropertyAll(color),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 4)))),
      child: Text(
        title,
        style: TextStyle(
            color: textColor, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  VoidCallback? clickCallback;
  String title;
  Color color;
  Color textColor;
  double? radius;

  CustomOutlinedButton(
      {this.clickCallback,
      required this.title,
      required this.color,
      required this.textColor,
      this.radius,
      super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: clickCallback,
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: color),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 4))),
        child: Text(
          title,
          style: TextStyle(color: textColor),
        ));
  }
}
