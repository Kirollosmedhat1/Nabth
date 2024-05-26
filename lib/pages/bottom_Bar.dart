// ignore_for_file: prefer_const_constructors


import 'package:application5/controller/cont/cart_controller.dart';
import 'package:application5/pages/Porfile_Page2.dart';
import 'package:application5/pages/community/communtiy.dart';
import 'package:application5/pages/homepage.dart';
import 'package:application5/pages/scan.dart';
import 'package:application5/pages/agriMarket/store.dart';
import 'package:application5/widgets/myBotttomNavigationBar.dart';
import 'package:application5/widgets/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class BottomBar extends StatefulWidget {
  final int selectedIndex;
  const BottomBar({Key? key, required this.selectedIndex}) : super(key: key);

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
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      drawer: Mydrawer(),
      body: _pages[_selectedIndex]
    );
  }
}
