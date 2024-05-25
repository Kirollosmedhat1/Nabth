import 'package:application5/controller/cont/cart_controller.dart';
import 'package:application5/pages/Shipping_Process.dart';
import 'package:application5/pages/orderData.dart';
import 'package:application5/widgets/heading_with_back.dart';
import 'package:application5/widgets/myDrawer.dart';
import 'package:application5/widgets/myOrder_Widget.dart';
import 'package:application5/widgets/titleWith_Shadow.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrderss extends StatelessWidget {
  MyOrderss({Key? key}) : super(key: key);
  final CartController controller = Get.find<CartController>();

  int historyIndex = 0; // Declare historyIndex as a field of the class

  @override
  Widget build(BuildContext context) {
    int itemCount;
    bool historyDisplayed = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF1FCF3),
      ),
      drawer: const Mydrawer(),
      body: ListView(
        children: [
          Container(
            color: const Color(0xffF1FCF3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const HeadingWithBack(title: "My Orders", fontFamily: '',),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.fromLTRB(21, 13, 0, 0),
                          child: const TitleWithShadow(title: "Processing")),
                      const Divider(
                        color: Color(0xffB7D7BE),
                        indent: 2,
                      ),
                      Obx(() {
                        controller.ongoing();

                        if (controller.ongoinglists.isNotEmpty) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.ongoinglists.length,
                            itemBuilder: (constex, i) {
                              // Display ongoing orders
                              return OrderItem(
                                  orderData: controller.ongoinglists[i]);
                            },
                          );
                        } else {
                          return const Center(
                            child: Text("Empty ongoing list"),
                          );
                        }
                      }),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(21, 13, 0, 0),
                          child: const TitleWithShadow(title: "History")),
                      const Divider(
                        color: Color(0xffB7D7BE),
                        indent: 2,
                      ),
                      Obx(() {
                        controller.getHistory();

                        if (controller.historyList.isNotEmpty) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.historyList.length,
                            itemBuilder: (constex, i) {
                              // Display ongoing orders
                              return OrderItem(
                                  orderData: controller.historyList[i]);
                            },
                          );
                        } else {
                          return const Center(
                            child: Text("Empty history"),
                          );
                        }
                      }),
                    ],
                  ),
                ),
              ],
            ),
            // ),
          ),
        ],
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  final QueryDocumentSnapshot orderData;
  const OrderItem({Key? key, required this.orderData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extracting the list of items from orderDetails
    List<dynamic> productsList = orderData['products'];
    DateTime orderDateTime = (orderData['timestamp'] as Timestamp).toDate();
    String orderId = orderData.id;

    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        InkWell(
          onTap: () {
            Get.to(Orderdata(orderData: orderData));
          },
          child: MyOrder_Widget(
            orderID: '$orderId',
            orderState: '${orderData["state"]}',
          ),
        ),
      ],
    );
  }
}
