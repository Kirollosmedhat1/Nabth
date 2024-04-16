// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyHeading extends StatelessWidget {
  const MyHeading({super.key, required this.lable});
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Text(
      lable,
      style: TextStyle(
        color: Color(0xff000000),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
