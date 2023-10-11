import 'package:garbacollection/Route/Routes.dart';
import 'package:garbacollection/Screen/HomeScreen/HomePage.dart';
import 'package:garbacollection/Screen/PlaySongScreen/PlaySongScreen.dart';
import 'package:garbacollection/Screen/SearchScreen/SearchScreen.dart';
import 'package:garbacollection/Screen/SongListScreen/SongListScreen.dart';
import 'package:garbacollection/Screen/SplashPage.dart';
import 'package:get/get.dart';

///  this class contains all screens navigation.
///  it helps to centralize all pages with namedRoute.

class Screens {

  static final routes = [
    GetPage(
      name: Routes.splashPage,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.songListScreen,
      page: () => SongListScreen(),
    ),
    GetPage(
      name: Routes.playSongScreen,
      page: () => PlaySongScreen(),
    ),
    GetPage(
      name: Routes.searchScreen,
      page: () => SearchScreen(),
    )
  ];

}
