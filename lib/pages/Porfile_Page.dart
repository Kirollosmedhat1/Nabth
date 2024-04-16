// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class Porfile_Page extends StatefulWidget {
  Porfile_Page({super.key});

  @override
  State<Porfile_Page> createState() => _Porfile_PageState();
}

class _Porfile_PageState extends State<Porfile_Page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Color.fromRGBO(241, 252, 243, 1),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 60),
        child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              // Container(
              //   height: 1000,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(20),
              //       topRight: Radius.circular(20),
              //     ),
              //   ),
              // ),
              // Positioned(),
              Expanded(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: true,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
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
                    SizedBox(height: 20),
                  ],
                ),
                
                    )
                    )
                    ])
                    ,),
              Positioned(
                top: 150,
                left: 20,
                right: 0,
                child: Container(
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
                                radius: 25.5,
                                backgroundColor: Color(0xffCAEDCF),
                                child: Image.asset(
                                  "images/favourites.png",
                                  height: 31.62,
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
                              IconButton(
                                  onPressed: () {},
                                  icon: Image.asset("images/arrow.png")),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 9),
                      Divider(
                        color: Color.fromARGB(255, 163, 204, 166),
                      ),
                      SizedBox(height: 9),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xffCAEDCF),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Colors.white,
                                BlendMode.modulate,
                              ),
                              child: Image.asset(
                                "images/payment.png",
                                width: 70,
                                height: 70,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              "Payment Method",
                              style: TextStyle(
                                color: Color(0xff1E9B3D),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed("paymentpage2");
                              },
                              icon: Image.asset("images/arrow.png"))
                        ],
                      ),
                      SizedBox(height: 9),
                      Divider(
                        color: Color.fromARGB(255, 163, 204, 166),
                      ),
                      SizedBox(height: 9),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xffCAEDCF),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Colors.white,
                                BlendMode.modulate,
                              ),
                              child: Image.asset(
                                "images/support.png",
                                width: 70,
                                height: 70,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              "Help & Support",
                              style: TextStyle(
                                color: Color(0xff1E9B3D),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset("images/arrow.png")),
                        ],
                      ),
                      SizedBox(height: 9),
                      Divider(
                        color: Color.fromARGB(255, 163, 204, 166),
                      ),
                      SizedBox(height: 9),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xffCAEDCF),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Colors.white,
                                BlendMode.modulate,
                              ),
                              child: Image.asset(
                                "images/about.png",
                                width: 70,
                                height: 70,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              "About App",
                              style: TextStyle(
                                color: Color(0xff1E9B3D),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset("images/arrow.png")),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
