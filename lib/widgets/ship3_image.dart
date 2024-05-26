import 'package:flutter/material.dart';

class ship3 extends StatefulWidget {
  final String imageName;
  final String text;
  ship3({super.key, required this.imageName, required this.text});

  @override
  State<ship3> createState() => _ship3State();
}

class _ship3State extends State<ship3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Column(
          children: [
            Image.asset(
              "images/${widget.imageName}",
              height: 120,
            ),
            Text(
              "${widget.text}",
              style: TextStyle(fontSize: 23),
            )
          ],
        ),
      ),
    );
  }
}
