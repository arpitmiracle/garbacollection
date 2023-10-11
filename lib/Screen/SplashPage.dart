import 'package:flutter/material.dart';
import 'package:garbacollection/Constants/ImagePath.dart';
import 'package:garbacollection/Route/Routes.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Get.offNamed(Routes.homeScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Image.asset(
      ImagePath.splashScreen,
      width: double.maxFinite,
      height: double.maxFinite,
          fit: BoxFit.fill,
    ));
  }
}
