import 'package:application5/controller/cont/cart_controller.dart';
import 'package:application5/pages/bottom_Bar.dart';
import 'package:application5/pages/agriMarket/empty_cart.dart';
import 'package:application5/widgets/cart_widget.dart';
import 'package:application5/widgets/payment_summry_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  int _selectedIndex = 1;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset(
            "images/back.png",
            height: 20,
          ),
        ),
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Color(0xff1B602D),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () {
                  final cartController = Get.find<CartController>();
                  if (cartController.productMap.isEmpty) {
                    // Show empty cart page if cart is empty
                    return Empty_Cart();
                  } else {
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                 "${cartController.totalQuantity.value} Items in your cart",
                                style: const TextStyle(
                                  color: Color(0xff1B602D),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.off(BottomBar(selectedIndex: _selectedIndex = 1));
                                },
                                child: const Row(
                                  children: [
                                    Icon(Icons.add),
                                    Text("Add more",
                                        style: TextStyle(
                                          color: Color(0xff1B602D),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        
                        Expanded (
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return CartItemsWidget(
                                index: index,
                                cartItem: cartController.productMap.keys
                                    .toList()[index],
                                quantity: cartController.productMap.values
                                    .toList()[index],
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                            itemCount: cartController.productMap.length,
                          ),
                        ),
                        PaymentSummaryPro(),
                      ],
                    );
                  }
                },
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}







