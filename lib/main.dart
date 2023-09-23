import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:omega_flutter_app/routes/routes_name.dart';
import 'package:omega_flutter_app/screens/transaction/model/local_database_model.dart';
import 'package:omega_flutter_app/utils/custom_widgets/custom_widget.dart';
import 'package:path_provider/path_provider.dart';


import 'screens/splash/binding/splash_binding.dart';
import 'screens/splash/view/splash.dart';

void main() async{
  runApp(const MyApp());
  Directory appDocDirectory = await getApplicationDocumentsDirectory();

  Directory(appDocDirectory.path+'/'+'dir').create(recursive: true)
// The created directory is returned as a Future.
      .then((Directory directory) async{
    // print('Path of New Dir: '+directory.path);
    var path = directory.path;
    Hive
      ..init(path)
      ..registerAdapter(WatchListDataAdapter());
    // print(box);
    // await box.add(value)
    boxLocalDatabase =await Hive.openBox('currencyDataBody');
    boxLocalDatabaseSearch =await Hive.openBox('currencyDataBodySelected');
  });

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: GetMaterialApp(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'Omega',
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
          cardColor: Colors.white,
          appBarTheme: const AppBarTheme(color: Colors.white),
          fontFamily: "galano-grotesque-alt-cufonfonts",
        ),
        initialBinding: SplashBinding(),
        getPages: getPages,
        home: SplashScreen(),
      ),
    );
  }
}
