import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:garbacollection/Screen/MusicScreen/GarbaCategory.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  List<Video> videoLinks = [];

  getData() async{
    final String jsonString = await rootBundle.loadString('assets/i18n/song.json');
    List<dynamic> jsonData = json.decode(jsonString);
    videoLinks = [];
    for (var category in jsonData) {
      for (var video in category["videos"]) {
        videoLinks.add(Video(name: video["name"], link: video["link"]));
      }
    }
    update();
  }

}
