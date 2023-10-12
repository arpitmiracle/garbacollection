import 'package:get/get.dart';

import 'en.dart';
import 'gu.dart';


class AppStrings {
  static String about_app = "about_app";
  static String garba_collection = "garba_collection";
  static String privacy_policy = "privacy_policy";
  static String version = "version";
  static String settings = "settings";
  static String share_app = "share_app";
  static String rate_us = "rate_us";
  static String search_by_name = "search_by_name";
  static String music_categories = "music_categories";
  static String music = "music";
  static String search = "search";
  static String user = "user";
  static String select_language = "select_language";
  static String change_language = "change_language";
}

class LanguagesTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': En().messages,
    'gu': Gu().messages
  };
}
