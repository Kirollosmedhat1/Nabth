import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChange;

  const MyBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onTabChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MoltenBottomNavigationBar(
      selectedIndex: selectedIndex,
      domeHeight: 25,
      domeCircleSize: 45,
      onTabChange: onTabChange,
      borderColor: Color(0xff1E9B3D),
      barColor: Colors.white,
      domeCircleColor: Color(0xffCAEDCF),
      tabs: [
        MoltenTab(
          icon: Container(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              selectedIndex == 0
                  ? 'images/IconHomeSelected.png'
                  : 'images/IconHome.png',
              fit: BoxFit.contain,
            ),
          ),
          selectedColor: Color(0xff1E9B3D),
          title: Text(
            'home',
            style: TextStyle(color: Color(0xff1E9B3D)),
          ),
        ),
        MoltenTab(
          icon: Container(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              selectedIndex == 1
                  ? 'images/IconStoreSelected.png'
                  : 'images/IconStore.png',
              fit: BoxFit.contain,
            ),
          ),
          selectedColor: Color(0xff1E9B3D),
          title: Text(
            'AgriMarket',
            style: TextStyle(color: Color(0xff1E9B3D)),
          ),
        ),
        MoltenTab(
          icon: Container(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              selectedIndex == 2
                  ? 'images/IconScanSelected.png'
                  : 'images/IconScan.png',
              fit: BoxFit.contain,
            ),
          ),
          selectedColor: Color(0xff1E9B3D),
          title: Text(
            'Scan',
            style: TextStyle(color: Color(0xff1E9B3D)),
          ),
        ),
        MoltenTab(
          icon: Container(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              selectedIndex == 3
                  ? 'images/IconCommunitySelected.png'
                  : 'images/IconCommunity.png',
              fit: BoxFit.contain,
            ),
          ),
          selectedColor: Color(0xff1E9B3D),
          title: Text(
            'Community',
            style: TextStyle(color: Color(0xff1E9B3D)),
          ),
        ),
        MoltenTab(
          icon: Container(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              selectedIndex == 4
                  ? 'images/IconAccountSelected.png'
                  : 'images/IconAccount.png',
              fit: BoxFit.contain,
            ),
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