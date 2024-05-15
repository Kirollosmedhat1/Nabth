import 'package:flutter/material.dart';

class Ship2_Edit extends StatefulWidget {
  

  Ship2_Edit({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
  });
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;

  @override
  State<Ship2_Edit> createState() => _Ship2_EditState();
}

class _Ship2_EditState extends State<Ship2_Edit> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Confirmation Date ",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff1B602D),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Payment Method ",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff1B602D),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Payment Status ",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff1B602D),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Transaction ID",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff1B602D),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Arrived Date  ",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff1B602D),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( widget.text1 ,
                  style: const TextStyle(fontSize: 14, color: Color(0xff1B602D)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.text2,
                  style: const TextStyle(fontSize: 14, color: Color(0xff1B602D)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.text3,
                  style: const TextStyle(fontSize: 14, color: Color(0xff1B602D)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.text4,
                  style: const TextStyle(fontSize: 14, color: Color(0xff1B602D)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.text5,
                  style: const TextStyle(fontSize: 14, color: Color(0xff1B602D)),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
