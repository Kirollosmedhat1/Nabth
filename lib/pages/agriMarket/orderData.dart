import 'package:application5/controller/cont/cart_controller.dart';
import 'package:application5/widgets/heading_with_back.dart';
import 'package:application5/widgets/payment_summry_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class Orderdata extends StatelessWidget {
  final QueryDocumentSnapshot orderData;
  Orderdata({Key? key, required this.orderData}) : super(key: key);
  final CartController controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    double subTotal = orderData["total"] + orderData["couponDiscount"];
    List<dynamic> items = orderData['products'];
    DateTime orderDateTime = (orderData['timestamp'] as Timestamp).toDate();
    String orderId = orderData.id;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const HeadingWithBack(
                  title: "Shipping Process", fontFamily: "WorkSans"),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Reciept',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    width: 170,
                    child: Text(
                      "Order ID $orderId",
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1A7431)),
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Payment Summary",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1B602D),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: items.map<Widget>((item) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 150,
                                child: Text(
                                  '${item["name"]}',
                                  maxLines: 1,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(
                                '${item["quantity"]}', // Adjust the format as needed
                                style: const TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 70,
                                child: Text(
                                  '${item["price"]}', // Adjust the format as needed
                                  style: const TextStyle(color: Colors.black),
                                  textAlign: TextAlign.right,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            children: [
                              Text(
                                '\nTotal Order\nCoupon Discount\nShipping',
                                style: TextStyle(
                                    color: Color(0xff1B602D),
                                    fontSize: 14,
                                    height: 1.7),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "\n${subTotal.toStringAsFixed(2)}\n-${orderData["couponDiscount"]}\nFree",
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                    color: Color(0xff1B602D),
                                    fontSize: 14,
                                    height: 1.7),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff1B602D)),
                          ),
                          Text(
                            " EGP ${orderData["total"].toStringAsFixed(2)}",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Color(0xff1B602D)),
                          )
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            children: [
                              Text(
                                'Confirmation Date \nPayment Method\nPayment Status',
                                style: TextStyle(
                                    color: Color(0xff1B602D),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    height: 2),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                               "${DateFormat('yyy,MM,dd, h,m,s').format(orderDateTime)}\n kk\ndf",
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                    color: Color(0xff1B602D),
                                    fontSize: 14,
                                    height: 2.3),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
