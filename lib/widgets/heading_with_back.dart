import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HeadingWithBack extends StatelessWidget {
  const HeadingWithBack({super.key, required this.title, required this.fontFamily});
  final String title;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return  Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back_ios_new),
                        iconSize: 18,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        title,
                        style: TextStyle(
                          color: Color(0xff1B602D),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          fontFamily: fontFamily,
                        ),
                      ),
                    ],
                  ),
                );
  }
}