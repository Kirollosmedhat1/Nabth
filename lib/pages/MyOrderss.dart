import 'package:application5/widgets/cont2_order.dart';
import 'package:application5/widgets/myOrderEdit3.dart';
import 'package:application5/widgets/myOrderEdittt.dart';
import 'package:flutter/material.dart';

import 'package:phone_input/phone_input_package.dart';

class MyOrderss extends StatefulWidget {
  @override
  State<MyOrderss> createState() => _MyOrderssState();
}

class _MyOrderssState extends State<MyOrderss> {
  GlobalKey<FormState> fromstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF1FCF3),
        appBar: AppBar(
            backgroundColor: Color(0xffF1FCF3),
            title: Container(
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {}, icon: Image.asset("images/menu.png")),
                ],
              ),
            )),
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
                          onPressed: () {},
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
                        myOrderEdit(),
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
                        myOrderEdit2(),
                        SizedBox(
                          height: 30,
                        ),
                        myOrderEdit3(),
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
