import 'package:application5/widgets/coummuntyEdit.dart';
import 'package:application5/widgets/container_comm.dart';
import 'package:flutter/material.dart';
import 'package:phone_input/phone_input_package.dart';

class Communtiy extends StatefulWidget {
  @override
  State<Communtiy> createState() => _communtiyState();
}

class _communtiyState extends State<Communtiy> {
  GlobalKey<FormState> fromstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF1FCF3),
        title: Container(
          child: Column(
            children: [
              IconButton(
                  onPressed: () {}, icon: Image.asset("images/menu.png")),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Image.asset("images/search.png"))
        ],
      ),
      body: ListView(
        children: [
          Container(
              color: Color(0xff000000),
              child: Column(children: [
                Column(
                  children: [
                    Text(
                      "  Communities",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: "WorkSans",
                        color: Color(0xff1B602D),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 0, 0, 27),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 27,
                      ),
                      
                    ],
                  ),
                ),
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft:  Radius.circular(40), topRight: Radius.circular(40)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25,),
                      Container(
                        padding: EdgeInsets.only(left: 40),
                        child: Text(
                          "Agricommunity",
                          style: TextStyle(
                            color: Color(0xff1A7431),
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            fontFamily: "WorkSans",
                            shadows: [
                              Shadow(
                                blurRadius: 14,
                                color: Colors.grey,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          
                          children: [
                            container_comm(
                              image: "images/image6.png",
                              text1: "Permaculture Practitioners",
                              text2: "4.300 Members",
                            ),
                            container_comm(
                              image: "images/image6.png",
                              text1: "Permaculture Practitioners",
                              text2: "4.300 Members",
                            ),
                            container_comm(
                              image: "images/image6.png",
                              text1: "Permaculture Practitioners",
                              text2: "4.300 Members",
                            ),
                            container_comm(
                              image: "images/image6.png",
                              text1: "Permaculture Practitioners",
                              text2: "4.300 Members",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(27),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "My Communities",
                              style: TextStyle(
                                color: Color(0xff1A7431),
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                fontFamily: "WorkSans",
                                shadows: [
                                  Shadow(
                                    blurRadius: 14,
                                    color: Colors.grey,
                                    offset: Offset(0, 6),
                                  ),

                                ],
                              ),
                            ),
                             SizedBox(
                        height: 20,
                      ),
                      coummuntiyEdit(
                        image: "image8.png",
                        text: "Aromatic Plant Growing",
                        text2: "10k Members",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      coummuntiyEdit(
                        image: "image8.png",
                        text: "Aromatic Plant Growing",
                        text2: "10k Members",
                      ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]))
        ],
      ),
    );
  }
}
