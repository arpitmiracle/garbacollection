import 'package:custom_element/custom_elements.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garbacollection/Constants/ImagePath.dart';
import 'package:garbacollection/Route/Routes.dart';
import 'package:garbacollection/Screen/MusicScreen/GarbaCategory.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SongListScreen extends StatefulWidget {
  @override
  State<SongListScreen> createState() => _SongListScreenState();
}

class _SongListScreenState extends State<SongListScreen> {
  GarbaCategory garbaCategory = Get.arguments;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          toolbarHeight: 60,
          centerTitle: true,
          title: Text(
            garbaCategory.category,
            style: TextStyle(
                fontSize: 26, fontFamily: GoogleFonts.alata().fontFamily,color: CustomColors.white),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [CustomColors.primary, CustomColors.secondary]),
            ),
          ),
          automaticallyImplyLeading: false,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: CustomColors.white,
                  size: 25,
                ),
                onPressed: () {
                  Get.back();
                },
              );
            },
          ),
        ),
        body: ListView.builder(
            itemCount: garbaCategory.videos.length,
          itemBuilder: (context, index) {
              return Container(
                color: CustomColors.songListColor,
                height: 80,
                margin: EdgeInsets.symmetric(vertical: 8),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          ImagePath.alumb,
                          width: 50,
                          height: 50,
                        )),
                    Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              garbaCategory.videos[index].name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: CustomColors.tittleColor,
                                fontSize: 18,
                                fontFamily: GoogleFonts.alatsi().fontFamily
                              ),
                            ),
                            Text(
                              "Unknown",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: CustomColors.author,
                                  fontSize: 16,
                                  fontFamily: GoogleFonts.alatsi().fontFamily
                              ),
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () async {
                           await Get.toNamed(Routes.playSongScreen, arguments: garbaCategory.videos[index].link);
                           Future.delayed(Duration(milliseconds: 500),() {
                             setState(() {});
                           },);
                          },
                          child: Image.asset(
                            ImagePath.play,
                            width: 30,
                            height: 30,
                          ),
                        ))
                  ],
                ),
              );
          }),
      ),
    );
  }
}
