import 'package:flutter/material.dart';

class payment_summary_pro extends StatefulWidget {
  final int num1;
  final int num2;
  final int num3;
  final int num4;
  final int num5;

  const payment_summary_pro({
    super.key,
    required this.num1,
    required this.num2,
    required this.num3,
    required this.num4,
    required this.num5,
  });

  @override
  State<payment_summary_pro> createState() => _payment_summary_proState();
}

class _payment_summary_proState extends State<payment_summary_pro> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment Summary",
          style: TextStyle(
              fontSize: 20,
              color: Color(0xff1B602D),
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order Total",
                  style: TextStyle(fontSize: 14, color: Color(0xff1B602D)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Items Discount",
                  style: TextStyle(fontSize: 14, color: Color(0xff1B602D)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Coupon Discount",
                  style: TextStyle(fontSize: 14, color: Color(0xff1B602D)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Shipping",
                  style: TextStyle(fontSize: 14, color: Color(0xff1B602D)),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.num1}',
                  style: TextStyle(fontSize: 14, color: Color(0xff1B602D)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${widget.num2}',
                  style: TextStyle(fontSize: 14, color: Color(0xff1B602D)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${widget.num3}',
                  style: TextStyle(fontSize: 14, color: Color(0xff1B602D)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${widget.num4}',
                  style: TextStyle(fontSize: 14, color: Color(0xff1B602D)),
                ),
              ],
            ),
          ],
        ),
        Divider(
          color: Color(0xffB7D7BE),
          height: 30,
          indent: 1,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total",
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff1B602D),
                    fontWeight: FontWeight.bold)),
            Text("EGP: ${widget.num5}",
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff1B602D),
                    fontWeight: FontWeight.bold)),
          ],
        )
      ],
    );
  }
}
