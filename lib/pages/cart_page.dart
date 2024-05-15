import 'package:application5/controller/cont/cart_controller.dart';
import 'package:application5/pages/bottom_Bar.dart';
import 'package:application5/pages/checkout.dart';
import 'package:application5/pages/empty_cart.dart';
import 'package:application5/widgets/cart_widget.dart';
import 'package:application5/widgets/myButton.dart';
import 'package:application5/widgets/payment_summry_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

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
        title: Text(
          'Cart',
          style: TextStyle(
            color: Color(0xff1B602D),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      bottomNavigationBar: MoltenBottomNavigationBar(
        selectedIndex: _selectedIndex,
        domeHeight: 25,
        onTabChange: (index) {
          Get.to(BottomBar(selectedIndex: 1));
        },
        borderColor: Color(0xff1E9B3D),
        barColor: Colors.white,
        domeCircleColor: Color(0xffCAEDCF),
        tabs: [
          MoltenTab(
            icon: Image.asset(
              _selectedIndex == 0
                  ? 'images/home-selected.png'
                  : 'images/home.png',
            ),
            selectedColor: Color(0xff1E9B3D),
            title: Text(
              'home',
              style: TextStyle(color: Color(0xff1E9B3D)),
            ),
            
          ),
          MoltenTab(
            icon: Image.asset(
              _selectedIndex == 1
                  ? 'images/store-selected.png'
                  : 'images/store.png',
            ),
            selectedColor: Color(0xff1E9B3D),
            title: Text(
              'AgriMarket',
              style: TextStyle(color: Color(0xff1E9B3D)),
            ),
          ),
          MoltenTab(
            icon: Image.asset(
              _selectedIndex == 2
                  ? 'images/scan-selected.png'
                  : 'images/scan.png',
            ),
            selectedColor: Color(0xff1E9B3D),
            title: Text(
              'Scan',
              style: TextStyle(color: Color(0xff1E9B3D)),
            ),
          ),
          MoltenTab(
            icon: Image.asset(
              _selectedIndex == 3
                  ? 'images/community-selected.png'
                  : 'images/community.png',
            ),
            selectedColor: Color(0xff1E9B3D),
            title: Text(
              'Community',
              style: TextStyle(color: Color(0xff1E9B3D)),
            ),
          ),
          MoltenTab(
            icon: Image.asset(
              _selectedIndex == 4
                  ? 'images/profile-selected.png'
                  : 'images/profile.png',
            ),
            selectedColor: Color(0xff1E9B3D),
            title: Text(
              'Account',
              style: TextStyle(color: Color(0xff1E9B3D)),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
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
                          margin: EdgeInsets.fromLTRB(18, 0, 18, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                 "${cartController.totalQuantity.value} Items in your cart",
                                style: TextStyle(
                                  color: Color(0xff1B602D),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.off(BottomBar(selectedIndex: _selectedIndex = 1));
                                },
                                child: Row(
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
                            separatorBuilder: (context, index) => SizedBox(
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







