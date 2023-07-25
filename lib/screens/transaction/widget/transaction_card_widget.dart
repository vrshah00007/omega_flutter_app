import 'package:flutter/material.dart';

class TransactionCardWidget extends StatelessWidget {
  String? leadingTitle;
  String? trailingTitle;

  TransactionCardWidget({
    super.key,
    this.leadingTitle,
    this.trailingTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      child: Material(
        elevation: 6,
        child: Container(
          height: 52,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(leadingTitle ?? ""),
                Text("\$ ${trailingTitle ?? ""}")
              ]),
        ),
      ),
    );
  }
}