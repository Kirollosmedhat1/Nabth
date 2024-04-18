import 'package:application5/pages/Payment_Page2.dart';
import 'package:application5/widgets/myACCRow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Porfile_Page2 extends StatefulWidget {
  Porfile_Page2({super.key});

  @override
  State<Porfile_Page2> createState() => _Porfile_PageState();
}

class _Porfile_PageState extends State<Porfile_Page2> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1FCF3),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 800,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              Positioned(
                top: -50,
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("images/user.png"),
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      "Camelia Waheeb",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A7431)),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 150,
                left: -15,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Color(0xffCAEDCF),
                                  child: Image.asset(
                                    "images/favourites.png",
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Favourites",
                                  style: TextStyle(
                                    color: Color(0xff1E9B3D),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("images/arrow.png"))),
                              // icon: Image.asset("images/arrow.png")
                            ),
                          ],
                        ),
                        SizedBox(height: 9),
                        Divider(
                          color: Color.fromARGB(255, 163, 204, 166),
                        ),
                        SizedBox(height: 9),

                        MyACCrow(iconImage: "images/payment.png", title: "Payment Method",onPressed: () {
                          navigator?.pushNamed("paymentpage2");
                        },),

                        SizedBox(height: 9),

                        Divider(color: Color.fromARGB(255, 163, 204, 166),),

                        SizedBox(height: 9),
                        MyACCrow(iconImage: "images/support.png", title: "Help & Support"),
                        SizedBox(height: 9),
                        Divider(
                          color: Color.fromARGB(255, 163, 204, 166),
                        ),
                        SizedBox(height: 9),
                        MyACCrow(iconImage: "images/about.png", title: "About App"),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
