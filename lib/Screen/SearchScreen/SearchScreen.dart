import 'package:custom_element/custom_elements.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garbacollection/Route/Routes.dart';
import 'package:garbacollection/Screen/SearchScreen/SearchPageController.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/ImagePath.dart';

class SearchScreen extends StatelessWidget {
  SearchPageController controller = Get.put(SearchPageController());
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.getData();
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.white,
        body: Container(
          padding: EdgeInsets.all(15),
          child: GetBuilder<SearchPageController>(
            builder: (controller) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    controller: searchController,
                    hint: "search by name and artist",
                    filled: true,
                    isDense: true,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                    onChange: (val) {
                      controller.update();
                    },
                  ),
                ),
                SizedBox(height: 3.w,),
                Expanded(child: controller.videoLinks.isEmpty ? Center(child: CircularProgressIndicator(),) : ListView.builder(
                    itemCount: controller.videoLinks.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if(controller.videoLinks[index].name.contains(searchController.text.trim())){
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
                                        controller.videoLinks[index].name,
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
                                      await Get.toNamed(Routes.playSongScreen, arguments: controller.videoLinks[index].link);
                                      Future.delayed(Duration(milliseconds: 500),() {
                                        SystemChrome.setPreferredOrientations([
                                          DeviceOrientation.portraitDown,
                                          DeviceOrientation.portraitUp,
                                        ]);
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
                      }
                      return Container();
                    })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
