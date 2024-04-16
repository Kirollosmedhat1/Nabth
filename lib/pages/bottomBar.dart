// ignore_for_file: prefer_const_constructors
import 'package:application5/pages/Porfile_Page2.dart';
import 'package:application5/pages/community.dart';
import 'package:application5/pages/homepage.dart';
import 'package:application5/pages/scan.dart';
import 'package:application5/pages/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    Store(),
    ScanPage(),
    CommunityPage(),
    Porfile_Page2(),
  ];
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
      appBar: AppBar(
        backgroundColor: Color(0xffF1FCF3),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  " Agri",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff184F27)),
                ),
                Text(
                  "livia",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff2CBB50)),
                ),
              ],
            ),
            Container(
              height: 50,
            ),
            ListTile(
              leading: Image.asset("images/settings.png"),
              title: Text(
                'Settings',
                style: TextStyle(
                  color: Color(0xff184F27),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset("images/notification.png"),
              title: Text(
                'Notifications',
                style: TextStyle(
                  color: Color(0xff184F27),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset("images/appearance.png"),
              title: Text(
                'Appearance',
                style: TextStyle(
                  color: Color(0xff184F27),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset("images/edit.png"),
              title: Text(
                'Edit account',
                style: TextStyle(
                  color: Color(0xff184F27),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset("images/language.png"),
              title: Text(
                'Language',
                style: TextStyle(
                  color: Color(0xff184F27),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset("images/Security.png"),
              title: Text(
                'Privacy and Security',
                style: TextStyle(
                  color: Color(0xff184F27),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Spacer(),
            ListTile(
              leading: Image.asset("images/logout.png"),
              title: Text(
                'Logout',
                style: TextStyle(
                  color: Color(0xff184F27),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                signOutFromApp();
              },
            ),
          ],
        ),
      ),
      body: Container(child: _pages[_selectedIndex]),
    );
  }
}
