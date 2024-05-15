// ignore_for_file: prefer_const_constructors

import 'package:application5/controller/cont/cycleController.dart';
import 'package:application5/pages/agri_Tips.dart';
import 'package:application5/pages/bottom_Bar.dart';
import 'package:application5/widgets/myDrawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
   final Function(int) onTabChanged; // Callback function

  const HomePage({Key? key, required this.onTabChanged}) : super(key: key);

  void changeSelectedIndex() {
    // Call the callback function to change the selected index to 2
    onTabChanged(2);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/HomeBackground.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              CustomAppBar(
                title: Text(''),
                onMenuPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 60),
                // color: Colors.black,
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "HI, Camelia",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: "WorkSans",
                        fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: "\nFind Your Desire Agriculture\nSolution.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontFamily: "WorkSans",
                        fontWeight: FontWeight.w600),
                  )
                ])),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            changeSelectedIndex();
                          },
                          child: Container(
                            height: 45,
                            width: 275,
                            margin: EdgeInsets.only(top: 28),
                            decoration: BoxDecoration(
                              color: Color(0xff1B602D),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  height: 22,
                                  width: 24,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "images/Home_Scan_Button.png"))),
                                ),
                                Text(
                                  "Detect your plant Disease",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "WorkSans"),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 270,
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0xffEDEDED),
                              ),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                const BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(0, 0),
                                    color: Colors.black26)
                              ]),
                        ),
                        Container(
                          height: 191,
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0xffEDEDED),
                              ),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                const BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(0, 0),
                                    color: Colors.black26)
                              ]),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(AgryCycle());
                          },
                          child: Container(
                            height: 100,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

FirebaseAuth auth = FirebaseAuth.instance;
var googleSignIn = GoogleSignIn();

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Function()? onMenuPressed; // Callback to open drawer
  // Add any other app bar properties you want to customize

  CustomAppBar({required this.title, this.onMenuPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: title,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
        onPressed: onMenuPressed,
      ),
      actions: [
        CircleAvatar(),
        Container(
          width: 20,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
