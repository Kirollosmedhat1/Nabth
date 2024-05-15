import 'package:application5/pages/homepage.dart';
import 'package:application5/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});
  
  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
     Get.off(const LoginPage(), arguments: (route) => false);
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 30,
          ),
          const Row(
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
            title: const Text(
              'Settings',
              style: TextStyle(
                color: Color(0xff184F27),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset("images/notification.png"),
            title: const Text(
              'Notifications',
              style: TextStyle(
                color: Color(0xff184F27),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset("images/appearance.png"),
            title: const Text(
              'Appearance',
              style: TextStyle(
                color: Color(0xff184F27),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset("images/edit.png"),
            title: const Text(
              'Edit account',
              style: TextStyle(
                color: Color(0xff184F27),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset("images/language.png"),
            title: const Text(
              'Language',
              style: TextStyle(
                color: Color(0xff184F27),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset("images/Security.png"),
            title: const Text(
              'Privacy and Security',
              style: TextStyle(
                color: Color(0xff184F27),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {},
          ),
          const Spacer(),
          ListTile(
            leading: Image.asset("images/logout.png"),
            title: const Text(
              'Logout',
              style: TextStyle(
                color: const Color(0xff184F27),
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
    );
  }
}
