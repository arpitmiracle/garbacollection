import 'package:custom_element/custom_elements.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_ad/flutter_native_ad.dart';
import 'package:garbacollection/Constants/HiveStoreUtil.dart';
import 'package:garbacollection/Route/Routes.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Route/Screens.dart';
import 'translations/appString.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('GarbaCollection');
  FlutterNativeAd.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context,orientation,deviceType){
        return GetMaterialApp(
          title: 'Garba Collection 2024',
          debugShowCheckedModeBanner: false,
          getPages: Screens.routes,
          initialRoute: Routes.splashPage,
          translationsKeys: LanguagesTranslation().keys,
          locale:  HiveStoreUtil.getString(HiveStoreUtil.languageCodeKey) == "gu" ? Locale('gu') : Locale('en'),
          fallbackLocale: Locale('en'),
        );
      }
    );
  }
}
