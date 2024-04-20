import 'package:application5/widgets/payment_summry_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrder_Widget extends StatelessWidget {
  const MyOrder_Widget({
    super.key,
    required this.image,
    required this.orderID,
    required this.orderState,
    required this.orderIcon, this.onTap,
  });
  final String image;
  final String orderID;
  final String orderState;
  final String orderIcon;
  final void Function()?  onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: Color(0xffF1FCF3),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10), right: Radius.circular(10)),
            border: Border.all(color: Color(0xffB7D7BE))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
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
                  "Order $orderID",
                  style: TextStyle(fontSize: 20, color: Color(0xff1A7431)),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Image.asset(
                      orderIcon,
                      height: 20,
                    ),
                    Text(
                      "  $orderState",
                      style: TextStyle(
                          fontSize: 21,
                          color: Color(0xff1A7431),
                          fontWeight: FontWeight.w500,
                          fontFamily: "WorkSans"),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Image.asset(
                      "images/go.png",
                      height: 20,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
