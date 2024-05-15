import 'package:flutter/material.dart';

class TitleWithShadow extends StatelessWidget {
  const TitleWithShadow({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: Color(0xff1A7431),
          fontSize: 24,
          fontWeight: FontWeight.w500,
          fontFamily: "WorkSans",
          shadows: [
            BoxShadow(
                blurRadius: 12, offset: Offset(0, 8), color: Colors.black38)
          ]),
    );
  }
}
