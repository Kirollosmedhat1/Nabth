import 'package:application5/pages/Porfile_Page2.dart';
import 'package:application5/pages/communtiy.dart';
import 'package:application5/pages/homepage.dart';
import 'package:application5/pages/scan.dart';
import 'package:application5/pages/store.dart';
import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class MyBotttomnaNigationBar extends StatefulWidget {
  final int selectedIndex;
   const MyBotttomnaNigationBar({super.key, required this.selectedIndex});
  @override
  State<MyBotttomnaNigationBar> createState() => _MyBotttomnaNigationBarState(selectedIndex);
  
}

class _MyBotttomnaNigationBarState extends State<MyBotttomnaNigationBar> {
 int _selectedIndex;
  _MyBotttomnaNigationBarState(this._selectedIndex);

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

 

  @override
  Widget build(BuildContext context) {
    return MoltenBottomNavigationBar(
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
                  ? 'images/IconAccountSelected.png'
                  : 'images/IconAccount.png',
                  ),
            selectedColor: Color(0xff1E9B3D),
            title: Text(
              'Account',
              style: TextStyle(color: Color(0xff184F27)),
            ),
          ),
        ],
      );
  }
}