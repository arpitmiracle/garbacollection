import 'package:custom_element/custom_elements.dart';
import 'package:flutter/material.dart';
import 'package:garbacollection/Constants/AppStrings.dart';
import 'package:garbacollection/Constants/ImagePath.dart';
import 'package:garbacollection/Screen/HomeScreen/MenuItems.dart';
import 'package:garbacollection/Screen/MusicScreen/MusicScreen.dart';
import 'package:garbacollection/Screen/SearchScreen/SearchScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final menuItemList = <MenuItems>[
    MenuItems(text: "Music", imgIcon: ImagePath.music),
    MenuItems(text: "Search", imgIcon: ImagePath.search),
    MenuItems(text: "User", imgIcon: ImagePath.setting),
  ];
  final _buildBody = <Widget>[MusicScreen(), SearchScreen(), MusicScreen()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          toolbarHeight: 60,
          centerTitle: true,
          title: Text(
            AppStrings.home,
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
        body: _buildBody[index],
        bottomNavigationBar: _createBottomNavigationBar(),
      ),
    );
  }

  Widget _createBottomNavigationBar() {
    return Container(
      height: 70,
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
        iconSize: 28,
        items: menuItemList
            .map((e) => BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(e.imgIcon)), label: e.text))
            .toList(),
      ),
    );
  }
}
