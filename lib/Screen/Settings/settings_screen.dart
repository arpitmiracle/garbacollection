import 'package:custom_element/custom_elements.dart';
import 'package:flutter/material.dart';
import 'package:garbacollection/Constants/HiveStoreUtil.dart';
import 'package:garbacollection/Constants/ImagePath.dart';
import 'package:garbacollection/Screen/Settings/AboutAppScreen.dart';
import 'package:garbacollection/translations/appString.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.settings.tr,
          style: TextStyle(
              fontSize: 26, fontFamily: GoogleFonts.alata().fontFamily),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [CustomColors.primary, CustomColors.secondary]),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: <Widget>[
          getCustomListTile(AppStrings.about_app.tr,ImagePath.aboutIcon,onTap: () {
            Get.to(() => AboutAppScreen());
          },),
          getCustomListTile(AppStrings.share_app.tr,ImagePath.shareAppIcon,onTap: () {
            Share.share("Get ready to groove to the beats of Garba with the Garba Collection app! \n Download Now : https://play.google.com/store/apps/details?id=com.miracle.garbacollection");
          },),
          getCustomListTile(AppStrings.rate_us.tr,ImagePath.rateUsIcon,onTap: () {
            launch("https://play.google.com/store/apps/details?id=com.miracle.garbacollection");
          },),
          getCustomListTile(AppStrings.change_language.tr,ImagePath.changeLanguageIcon,onTap: () {
            Get.dialog(LanguageDialog());
          },),
        ],
      ),
    );
  }

  getCustomListTile(String title,String image,{required VoidCallback onTap}){
    return InkWell(
      onTap: onTap,
      child: Container(
        color: CustomColors.songListColor,
        height: 60,
        margin: EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                image,
                width: 30,
                height: 30,
              ),
            ),
            Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: CustomColors.tittleColor,
                          fontSize: 18,
                          fontFamily: GoogleFonts.alatsi().fontFamily
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class LanguageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(AppStrings.select_language.tr),
      children: [
        ListTile(
          title: Text('English'),
          onTap: () {
            HiveStoreUtil.setString(HiveStoreUtil.languageCodeKey, "en");
            Get.updateLocale(Locale('en'));
            Get.back(); // Close the dialog
          },
        ),
        ListTile(
          title: Text('ગુજરાતી'),
          onTap: () {
            HiveStoreUtil.setString(HiveStoreUtil.languageCodeKey, "gu");
            Get.updateLocale(Locale('gu'));
            Get.back(); // Close the dialog
          },
        ),
        // Add more language options here
      ],
    );
  }
}