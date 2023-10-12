import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:garbacollection/Screen/MusicScreen/GarbaCategory.dart';
import 'package:get/get.dart';

class MusicPageController extends GetxController {
  late Future<List<GarbaCategory>> garbaCategories;

  getData(){
    garbaCategories = loadGarbaData();
  }

  Future<List<GarbaCategory>> loadGarbaData() async {
    final String jsonString = await rootBundle.loadString('assets/i18n/${Get.locale?.languageCode == "en" ? "song.json" : "song_gu.json"}');
    final List<dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse.map((i) => GarbaCategory.fromJson(i)).toList();
  }
}
