import 'package:flutter/material.dart';

class coummuntiyEdit extends StatefulWidget {
  final String image;
  final String text;
  final String text2;
  coummuntiyEdit({
    required this.image,
    required this.text,
    required this.text2,
  });
  @override
  State<coummuntiyEdit> createState() => _coummuntiyEditState();
}

class _coummuntiyEditState extends State<coummuntiyEdit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Color(0xffF1FCF3),
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(10), right: Radius.circular(10)),
          border: Border.all(color: Color(0xffB7D7BE))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "images/${widget.image}",
            height: 130,
            width: 90,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "${widget.text}",
                style: TextStyle(fontSize: 20, color: Color(0xff1A7431)),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Image.asset(
                    "images/cancel.png",
                    height: 20,
                  ),
                  Text(
                    "     ${widget.text2}",
                    style: TextStyle(fontSize: 20, color: Color(0xff1A7431)),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
