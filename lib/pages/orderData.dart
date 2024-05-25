import 'package:application5/controller/cont/cart_controller.dart';
import 'package:application5/pages/code';
import 'package:application5/widgets/heading_with_back.dart';
import 'package:application5/widgets/payment_summry_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Orderdata extends StatelessWidget {
  final QueryDocumentSnapshot orderData;
  Orderdata({Key? key, required this.orderData}) : super(key: key);
  final CartController controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    List<dynamic> items = orderData['products'];
    DateTime orderDateTime = (orderData['timestamp'] as Timestamp).toDate();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40,),
           const HeadingWithBack(title: "Shipping Process ", fontFamily: "WorkSans"),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Order Date',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
                ),
                Text(
                  " ${(orderDateTime)}",
                  // " ${DateFormat('yyyy-MM-dd').format(orderDateTime)}",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                )
              ],
            ),
          ),
          
          const Divider(),
          GetBuilder<CartController>(
            init: CartController(),
            builder: (_) {
            return Row(
            children: [
              MaterialButton(
                color: Colors.amber, 
                onPressed: () {
                DocumentSnapshot orderDoc =
                                            controller.ongoinglists[0];
                                        controller.markOrderAsCancel(orderDoc);
                                        Get.back();
              },),
              MaterialButton(
                color: Colors.amber,
                onPressed: () {
                DocumentSnapshot orderDoc =
                                            controller.ongoinglists[0];
                                        controller.markOrderAsDeliverd(orderDoc);
                                         Get.back();
              },),
            ],
          );
          },),
        
          Container(
          
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(.5)),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Price',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      " EGP ${orderData["total"].toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    )
                  ],
                ),
                Text(
                  "${orderData['products']}",
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Status',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 21,
                      width: 87,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "${orderData['couponApplied']}",
                        style: TextStyle(color: Colors.grey.withOpacity(1)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
           Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(.5)),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: items.map<Widget>((item) {
                    return ListTile(
                      title: Text(
                        '$item', // Adjust the format as needed
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
