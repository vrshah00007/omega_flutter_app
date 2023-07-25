import 'package:flutter/material.dart';

class OpenOrderListTile extends StatelessWidget {
  String? title;

  String? subTitle;

  OpenOrderListTile({
    super.key,
    this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: ListTile(
        contentPadding: const EdgeInsets.only(bottom: 0),
        title: Text(title ?? "",
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            )),
        trailing: Text(subTitle ?? "",
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            textAlign: TextAlign.center),
      ),
    );
  }
}