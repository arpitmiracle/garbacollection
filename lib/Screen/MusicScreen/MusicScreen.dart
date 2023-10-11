import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garbacollection/Route/Routes.dart';
import 'package:garbacollection/Screen/MusicScreen/MusicPageController.dart';
import 'package:garbacollection/Screen/MusicScreen/GarbaCategory.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicScreen extends StatefulWidget {
  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  MusicPageController controller = Get.put(MusicPageController());

  @override
  void initState() {
    controller.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<GarbaCategory>>(
        future: controller.garbaCategories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return Container(
              padding: EdgeInsets.all(12.0),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, ),
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
                                height: 140,
                                width: 140,
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
