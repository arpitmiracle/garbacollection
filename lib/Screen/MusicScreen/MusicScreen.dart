import 'package:custom_element/custom_elements.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garbacollection/Route/Routes.dart';
import 'package:garbacollection/Screen/MusicScreen/MusicPageController.dart';
import 'package:garbacollection/Screen/MusicScreen/GarbaCategory.dart';
import 'package:garbacollection/translations/appString.dart';
import 'package:garbacollection/utils/AdsHelper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicScreen extends StatelessWidget {
  MusicPageController controller = Get.put(MusicPageController());
  AdsHelper adsHelper = AdsHelper();

  @override
  Widget build(BuildContext context) {
    controller.getData();
    AdsHelper.loadInterstitialAd();
    adsHelper.loadBannerAd();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.music_categories.tr,
          style: TextStyle(
              fontSize: 22, fontFamily: GoogleFonts.alata().fontFamily,color: Colors.white),
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
      body: FutureBuilder<List<GarbaCategory>>(
        future: controller.garbaCategories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return Container(
              padding: EdgeInsets.all(15.0),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 15,mainAxisSpacing: 5,childAspectRatio: 2/2.4),
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final category = snapshot.data![index];
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            AdsHelper.showInterstitialAd();
                            Get.toNamed(Routes.songListScreen, arguments: category);
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              // child: CachedNetworkImage(
                              //   imageUrl: category.albumPoster,
                              //   placeholder: (context, url) => CircularProgressIndicator(),
                              // ),
                            child: Image.asset(category.albumPoster,height: 150,fit: BoxFit.cover,),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          category.category,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: GoogleFonts.alatsi().fontFamily),
                        ),
                      ],
                    );
                  }),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: adsHelper.showBannerAd(),
    );
  }


}
