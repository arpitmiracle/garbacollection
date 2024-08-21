import 'package:custom_element/custom_elements.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garbacollection/Constants/ImagePath.dart';
import 'package:garbacollection/translations/appString.dart';
import 'package:garbacollection/utils/AdsHelper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAppScreen extends StatelessWidget {
  AdsHelper adsHelper = AdsHelper();

  @override
  Widget build(BuildContext context) {
    adsHelper.loadBannerAd();
    AdsHelper.loadInterstitialAd();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
        ),
        title: Text(
          AppStrings.about_app.tr,
          style: TextStyle(
              fontSize: 22, fontFamily: GoogleFonts.alata().fontFamily,color: Colors.white,),
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [CustomColors.primary, CustomColors.secondary]),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 4.h,),
                Image.asset(ImagePath.imgLogo, height: 35.w),
                SizedBox(height: 1.h,),
                CustomText(
                  text: AppStrings.garba_collection.tr,
                  fontSize: 18.sp,
                  color: CustomColors.white,
                ),
                Padding(
                  padding: EdgeInsets.all(6.w),
                  child: Column(
                    children: [
                      CustomText(
                        text: "✨ Extensive Collection: Explore a vast library of Garba songs to keep you dancing all night.",
                        fontSize: 12.sp,
                        maxLines: 8,
                        color: CustomColors.white,
                      ),
                      SizedBox(height: 5,),
                      CustomText(
                        text: "✨ Lyrics and Meaning: Understand the essence of each song with lyrics and translations. ",
                        fontSize: 12.sp,
                        maxLines: 8,
                        color: CustomColors.white,
                      ),
                      SizedBox(height: 5,),
                      CustomText(
                        text: "✨ Countdown to Navratri: Stay updated with the countdown to the most awaited festival.",
                        fontSize: 12.sp,
                        maxLines: 8,
                        color: CustomColors.white,
                      ),
                      SizedBox(height: 15,),
                      CustomText(
                        text: "📱 Download the Garba Collection app now and make this Navratri unforgettable! 💃🎶",
                        fontSize: 12.sp,
                        maxLines: 8,
                        color: CustomColors.white,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(thickness: 1, height: 3.h, color: CustomColors.white,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: CustomText(
                        text: "${AppStrings.version.tr} 1.0.0",
                        color: CustomColors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                    // Divider(color: AppColors.white30, thickness: 1,heig![](C:/Users/a/AppData/Local/Temp/screenshot_2023-04-07-15-34-26-24_0dc14b924a74202c539ddbda6a72f266.jpg)ht: 3.h,),
                    // getListItem(MyStrings.contact_us,onTap: () {
                    //   launchUrl(Uri.parse("tel:${MyStrings.contact_number}"));
                    // },),
                    // Divider(color: AppColors.white30, thickness: 1,height: 3.h,),
                    // getListItem(MyStrings.visit_website,onTap: () {
                    //   launchUrl(Uri.parse(MyStrings.website_url));
                    // },),
                    Divider(thickness: 1, height: 3.h, color: CustomColors.white,),
                    getListItem(AppStrings.privacy_policy.tr, onTap: () {
                      AdsHelper.showInterstitialAd();
                      launchUrl(Uri.parse(""));
                    },),
                    // Divider(color: AppColors.white30, thickness: 1,height: 3.h,),
                    // getListItem(MyStrings.term,onTap: () {
                    //   launchUrl(Uri.parse(MyStrings.website_url));
                    // },),
                    Divider(thickness: 1, height: 3.h, color: CustomColors.white,),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 6.w, vertical: 3.w),
                  child: CustomText(
                    text: "©Copyright 2024 by The King Developers",
                    fontSize: 12.sp,
                    color: CustomColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: adsHelper.showBannerAd(),
    );
  }

  Widget getListItem(String title,{VoidCallback? onTap}){
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: CustomText(
            text: title,
            fontSize: 16.sp,
            color: CustomColors.white,
          ),
        ),
      ),
    );
  }
}
