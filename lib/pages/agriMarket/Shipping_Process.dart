import 'package:application5/widgets/Ship2_Edit.dart';
import 'package:application5/widgets/payment_summry_pro.dart';
import 'package:application5/widgets/ship3_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Shipping_Process extends StatefulWidget {
  const Shipping_Process({super.key});

  @override
  State<Shipping_Process> createState() => _Shipping_ProcessState();
}

class _Shipping_ProcessState extends State<Shipping_Process> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Image.asset(
                  "images/back.png",
                  height: 15,
                )) ,
        title: const Text(
              "Shipping Process ",
              style: TextStyle(
                  color: Color(0xff1A7431),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "Reciept",
                  style: TextStyle(
                      color: Color(0xff1A7431),
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 60,
                ),
                Text(
                  " Order ID #387283274",
                  style: TextStyle(
                    color: Color(0xff1A7431),
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Color(0xffB7D7BE),
              height: 30,
              indent: 1,
            ),
            Column(
              children: [
                // payment_summary_pro(
                  
                //   num2: 80,
                //   num3: 80,
                //   num4: 80,
                // ),
                const Divider(
                  color: Color(0xff1B602D),
                  height: 30,
                  endIndent: 1,
                  indent: 5,
                ),
                const Ship2_Edit(
                    text1: "April 26,2024|10:00AM",
                    text2: "Credit Card",
                    text3: 'Paid ',
                    text4: '#MNFG3435tss4',
                    text5: 'April 30,2024|9:00PM'),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ship3(imageName: "Tracking.png", text: "Tracking"),
                    ship3(
                      imageName: "order.png",
                      text: "Cancel Order",
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


