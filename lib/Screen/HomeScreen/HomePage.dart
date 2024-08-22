import 'package:custom_element/custom_elements.dart';
import 'package:flutter/material.dart';
import 'package:garbacollection/Constants/ImagePath.dart';
import 'package:garbacollection/Screen/HomeScreen/MenuItems.dart';
import 'package:garbacollection/Screen/MusicScreen/MusicScreen.dart';
import 'package:garbacollection/Screen/SearchScreen/SearchScreen.dart';
import 'package:garbacollection/Screen/Settings/settings_screen.dart';
import 'package:garbacollection/translations/appString.dart';
import 'package:get/get.dart';
import 'package:upgrader/upgrader.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final menuItemList = <MenuItems>[
    MenuItems(text: AppStrings.music.tr, imgIcon: ImagePath.music),
    MenuItems(text: AppStrings.search.tr, imgIcon: ImagePath.search),
    MenuItems(text: AppStrings.user.tr, imgIcon: ImagePath.setting),
  ];
  final _buildBody = <Widget>[MusicScreen(), SearchScreen(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      child: Scaffold(
        backgroundColor: CustomColors.white,
        body: _buildBody[index],
        bottomNavigationBar: _createBottomNavigationBar(),
      ),
    );
  }

  Widget _createBottomNavigationBar() {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [CustomColors.primary, CustomColors.secondary],
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        showUnselectedLabels: false,
        showSelectedLabels: false,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        unselectedItemColor: CustomColors.white,
        selectedItemColor: CustomColors.assets,
        iconSize: 25,
        items: menuItemList
            .map((e) => BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(e.imgIcon)), label: e.text))
            .toList(),
      ),
    );
  }
}
