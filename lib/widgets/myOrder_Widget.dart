import 'package:application5/widgets/payment_summry_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrder_Widget extends StatelessWidget {
  const MyOrder_Widget({
    super.key,
    required this.orderID,
    required this.orderState,
    this.onTap,
  });

  final String orderID;
  final String orderState;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    String imageToShow = 'orderOngoing.png';
    String iconToShow = 'IconOngoing.png'; // Default image for ongoing orders

    // Determine which image to display based on the order state
    if (orderState == 'Deliverd') {
      imageToShow = 'orderDelivered.png';
      iconToShow = 'IconDeliverd.png';
    } else if (orderState == 'Canceled') {
      imageToShow = 'orderCanceld.png';
      iconToShow = 'IconCanceled.png';
    }

    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          height: 110,
          width: 370,
          padding: const EdgeInsets.fromLTRB(5, 5, 30, 5),
          decoration: BoxDecoration(
              color: const Color(0xffF1FCF3),
              borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(10), right: Radius.circular(10)),
              border: Border.all(color: const Color(0xffB7D7BE))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'images/$imageToShow',
                            ),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 175,
                          child: 
                          Text(
                            "Order $orderID",
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 20, color: Color(0xff1A7431)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/$iconToShow',
                              height: 16,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              orderState,
                              style: const TextStyle(
                                  fontSize: 21,
                                  color: Color(0xff1A7431),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "WorkSans"),
                            ),
                            // SizedBox(
                            //   width: 40,
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                 const ImageIcon(
                  AssetImage('images/IconForward.png'),
                  size: 15, // adjust size as needed
                ),
              ],
            ),
          
        ),
      ),
    );
  }
}
