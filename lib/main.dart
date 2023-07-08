import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/routes/routes_name.dart';

import 'screens/splash/binding/splash_binding.dart';
import 'screens/splash/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "galano-grotesque-alt-cufonfonts",
      ),
      initialBinding: SplashBinding(),
      home: SplashScreen(),
    );
  }
}
