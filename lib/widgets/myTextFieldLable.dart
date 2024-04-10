import 'package:flutter/material.dart';

class MyTextFieldLable extends StatelessWidget {
  const MyTextFieldLable({super.key, required this.lable});
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Text(
      lable,
      style: TextStyle(
        color: Color(0xff1A7431),
        fontSize: 15,
        fontWeight: FontWeight.w600,
        fontFamily: "WorkSans"
      ),
    );
  }
}
