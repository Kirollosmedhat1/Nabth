import 'package:application5/controller/cont/cart_controller.dart';
import 'package:application5/pages/myTextFromField.dart';
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

  final String num2;
  final String num3;
  final String num4;
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
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Order Total",
            style: TextStyle(fontSize: 14, color: Color(0xff1B602D)),
          ),
          Text(
            '${cartController.total}',
            style: TextStyle(fontSize: 14, color: Color(0xff1B602D)),
          ),
        ]),
        SizedBox(
          height: 10,
        ),
        Row(
          
          children: [
            myTextFromFiled(hintText: "enter your copon"),
            
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              "Shipping",
              style: TextStyle(fontSize: 14, color: Color(0xff1B602D)),
            ),
            Text(
              '$num4',
              style: TextStyle(fontSize: 14, color: Color(0xff1B602D)),
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
            Text("EGP: ${(cartController.total)}",
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
