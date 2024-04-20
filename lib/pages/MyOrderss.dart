

import 'package:application5/pages/Shipping_Process.dart';
import 'package:application5/widgets/myOrder_Widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrderss extends StatelessWidget {
  GlobalKey<FormState> fromstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF1FCF3),
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
                // signOutFromApp();
              },
            ),
          ],
        ),
      ),
        body: Container(
          // padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(2),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Image.asset(
                            "images/back.png",
                            height: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "My Orders",
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xff1B602D),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 800,
                    width: 800,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(10),
                          right: Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Processing",
                          style: TextStyle(
                            color: Color(0xff1A7431),
                            fontSize: 24,
                            // fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.grey, // Shadow color
                                offset: Offset(0, 3), // Shadow offset
                                // blurRadius: 2, // Shadow blur radius
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Color(0xffB7D7BE),
                          height: 30,
                          indent: 1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MyOrder_Widget(image: "images/image1.png",orderID: "#387283274",orderIcon: "images/Icon (1).png",orderState:"On going" ,onTap: () {
                          Get.to(Shipping_Process());
                        },),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "History",
                          style: TextStyle(
                            color: Color(0xff1A7431),
                            fontSize: 24,
                            shadows: [
                              Shadow(
                                color: Colors.grey, // Shadow color
                                offset: Offset(0, 3), // Shadow offset
                                // blurRadius: 2, // Shadow blur radius
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Color(0xffB7D7BE),
                          height: 30,
                          indent: 1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MyOrder_Widget(image: "images/image2.png",orderID: "#387283274",orderIcon: "images/Icon (1).png",orderState:"On going" ,),
                        SizedBox(
                          height: 30,
                        ),
                        MyOrder_Widget(image: "images/image3.png",orderID: "#387283274",orderIcon: "images/Icon (1).png",orderState:"On going" ,),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}







