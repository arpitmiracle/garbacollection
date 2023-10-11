import 'dart:convert';
import 'package:custom_element/custom_elements.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garbacollection/Constants/AppStrings.dart';
import 'package:garbacollection/Route/Routes.dart';
import 'package:garbacollection/Screen/MusicScreen/MusicPageController.dart';
import 'package:garbacollection/Screen/MusicScreen/GarbaCategory.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicScreen extends StatelessWidget {
  MusicPageController controller = Get.put(MusicPageController());

  @override
  Widget build(BuildContext context) {
    controller.getData();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Music Categories",
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
                            Get.toNamed(Routes.songListScreen, arguments: category);
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                category.albumPoster,

                              )),
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
    );
  }


}
