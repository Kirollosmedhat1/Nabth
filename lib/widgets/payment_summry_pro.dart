import 'package:application5/controller/cont/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class payment_summary_pro extends StatelessWidget {
   payment_summary_pro({
    super.key,
   
    required this.num2,
    required this.num3,
    required this.num4,
  });

  final int num2;
  final int num3;
  final int num4;
  final CartController cartController = Get.put(CartController());

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
                  '${cartController.totalPrice}',
                  style: TextStyle(fontSize: 14, color: Color(0xff1B602D)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '$num2',
                  style: TextStyle(fontSize: 14, color: Color(0xff1B602D)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '$num3',
                  style: TextStyle(fontSize: 14, color: Color(0xff1B602D)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '$num4',
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
            Text("EGP: ${(cartController.totalPrice-(num2+num3)+num4)}",
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
