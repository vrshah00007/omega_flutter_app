import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoNetworkConnectivity extends StatefulWidget {
  NoNetworkConnectivity({
    Key? key,
  }) : super(key: key);

  @override
  State<NoNetworkConnectivity> createState() => _NoNetworkConnectivityState();
}

class _NoNetworkConnectivityState extends State<NoNetworkConnectivity> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: const Scaffold(
        body: Center(
          child: Text(
            "No internet connection",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
