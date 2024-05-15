// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:application5/controller/cont/cart_controller.dart';
import 'package:application5/pages/Porfile_Page2.dart';
import 'package:application5/pages/cart_page.dart';
import 'package:application5/pages/community.dart';
import 'package:application5/pages/communtiy.dart';
import 'package:application5/pages/empty_cart.dart';
import 'package:application5/pages/homepage.dart';
import 'package:application5/pages/scan.dart';
import 'package:application5/pages/store.dart';
import 'package:application5/widgets/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class BottomBar extends StatefulWidget {
  final int selectedIndex;
  BottomBar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState(selectedIndex);
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex;
  final CartController cartController = Get.find<CartController>();
  _BottomBarState(this._selectedIndex);

  late List<Widget> _pages;

  @override
  void initState() {
  super.initState();
  _pages = [
    HomePage(
      onTabChanged: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    ),
    Store(),
    ScanPage(),
    Communtiy(),
    Porfile_Page2(),
  ];
}

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
    } catch (error) {}
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       extendBody: true,
      bottomNavigationBar: MoltenBottomNavigationBar(
        selectedIndex: _selectedIndex,
        domeHeight: 25,
        onTabChange: (Index) {
          setState(() {
            _selectedIndex = Index;
          });
        },
        borderColor: Color(0xff1E9B3D),
        barColor: Colors.white,
        domeCircleColor: Color(0xffCAEDCF),
        tabs: [
          MoltenTab(
            icon: Image.asset(
              _selectedIndex == 0
                  ? 'images/home-selected.png'
                  : 'images/home.png',
            ),
            selectedColor: Color(0xff1E9B3D),
            title: Text(
              'home',
              style: TextStyle(color: Color(0xff1E9B3D)),
            ),
          ),
          MoltenTab(
            icon: Image.asset(
              _selectedIndex == 1
                  ? 'images/store-selected.png'
                  : 'images/store.png',
            ),
            selectedColor: Color(0xff1E9B3D),
            title: Text(
              'AgriMarket',
              style: TextStyle(color: Color(0xff1E9B3D)),
            ),
          ),
          MoltenTab(
            icon: Image.asset(
              _selectedIndex == 2
                  ? 'images/scan-selected.png'
                  : 'images/scan.png',
            ),
            selectedColor: Color(0xff1E9B3D),
            title: Text(
              'Scan',
              style: TextStyle(color: Color(0xff1E9B3D)),
            ),
          ),
          MoltenTab(
            icon: Image.asset(
              _selectedIndex == 3
                  ? 'images/community-selected.png'
                  : 'images/community.png',
            ),
            selectedColor: Color(0xff1E9B3D),
            title: Text(
              'Community',
              style: TextStyle(color: Color(0xff1E9B3D)),
            ),
          ),
          MoltenTab(
            icon: Image.asset(
              _selectedIndex == 4
                  ? 'images/profile-selected.png'
                  : 'images/profile.png',
            ),
            selectedColor: Color(0xff1E9B3D),
            title: Text(
              'Account',
              style: TextStyle(color: Color(0xff1E9B3D)),
            ),
          ),
        ],
      ),
      drawer: Mydrawer(),
      body: _pages[_selectedIndex]
    );
  }
}
