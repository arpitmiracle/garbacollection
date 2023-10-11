import 'package:custom_element/custom_elements.dart';
import 'package:flutter/material.dart';
import 'package:garbacollection/Route/Routes.dart';
import 'package:get/get.dart';

import 'Route/Screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context,orientation,deviceType){
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          getPages: Screens.routes,
          initialRoute: Routes.splashPage,
        );
      }
    );
  }
}
