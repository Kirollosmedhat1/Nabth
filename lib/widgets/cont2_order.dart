import 'package:flutter/material.dart';

class myOrderEdit2 extends StatelessWidget {
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
            "images/image2.png",
            height: 150,
          ),
          SizedBox(
            width: 50,
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Order #790903254",
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
                    "  Cancelled",
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
