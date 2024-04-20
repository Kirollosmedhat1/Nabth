

import 'package:application5/controller/cont/cart_controller.dart';
import 'package:application5/pages/2check.dart';
import 'package:application5/pages/checkout.dart';
import 'package:application5/widgets/payment_summry.dart';
import 'package:application5/widgets/payment_summry_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  int _selectedIndex = 1;
  int kiro = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Image.asset(
                  "images/back.png",
                  height: 20,
                )),
        title: Text('Cart'),
      ),
      bottomNavigationBar: MoltenBottomNavigationBar(
        selectedIndex: _selectedIndex,
        domeHeight: 25,
        onTabChange: (index) {
          
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
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              final cartController = Get.find<CartController>();
              return ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartController.cartItems[index];
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffD9D9D9), width: 2),
                                          borderRadius: BorderRadius.circular(15)),
                                      child: Image.network(
                                        cartItem.product.image,
                                        fit: BoxFit.contain,
                                      )),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(cartItem.product.name),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                          'EGP ${cartItem.product.price} x ${cartItem.quantity}')
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: 70,
                                          ),
                                          InkWell(
                                              child: Container(
                                                child: Image.asset("images/x.png"),
                                              ),
                                              onTap: () {
                                                cartController.removeProduct(
                                                    cartItem.product);
                                              }),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 70,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Color(0xffB7D7BE)),
                                          color: Color(0xffF1FCF3),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  int newQuantity =
                                                      cartItem.quantity.value - 1;
                                                  cartController.updateQuantity(
                                                      cartItem.product,
                                                      newQuantity);
                                                },
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Color(0xff1A7431),
                                                  size: 15,
                                                )),
                        
                                            Text(
                                              '${cartItem.quantity.value}',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            // SizedBox(width: 1),
                                            InkWell(
                                                onTap: () {
                                                  int newQuantity =
                                                      cartItem.quantity.value + 1;
                                                  cartController.updateQuantity(
                                                      cartItem.product,
                                                      newQuantity);
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  color: Color(0xff1A7431),
                                                  size: 15,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  });
            }),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Column(
              children: [
                payment_summary_pro( num2: 12, num3: 14, num4: 0,),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF1B602D),
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 100,
                    ),
                  ),
                  onPressed: () {
                    Get.to(checkout());
                  },
                  child: const Text("continue", style: TextStyle(fontSize: 15)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}






    // return Scaffold(
    //   backgroundColor: Color(0xffF1FCF3),
    //   appBar: AppBar(
    //     backgroundColor: Color(0xffF1FCF3),
    //     title: Container(
    //         child: IconButton(onPressed: () {}, icon: Icon(Icons.menu))),
    //     actions: [
    //       Row(
    //         children: [
    //           Container(
    //             padding: EdgeInsets.symmetric(horizontal: 5),
    //             child: IconButton(
    //               onPressed: () {},
    //               icon: Image.asset("images/search.png"),
    //             ),
    //           ),
    //           SizedBox(
    //             height: 10,
    //           ),
    //           Container(
    //               child: IconButton(
    //                 onPressed: () {},
    //                 icon: Image.asset("images/cart.png"),
    //               ),
    //               decoration: BoxDecoration(
    //                 boxShadow: [
    //                   BoxShadow(
    //                     color: Colors.black.withOpacity(0.0),
    //                     spreadRadius: 1,
    //                     blurRadius: 5,
    //                     offset: Offset(0, 0),
    //                   ),
    //                 ],
    //               )),
    //         ],
    //       ),
    //     ],
    //   ),
    //   body: ListView(
    //     children: [
    //       Container(
    //         padding: EdgeInsets.symmetric(horizontal: 30),
    //         child: Column(
    //           children: [
                
    //             SizedBox(
    //               height: 20,
    //             ),
    //             Row(
    //               children: [
    //                 Text(
    //                   "Payment Summary",
    //                   style:
    //                       TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //                 ),
    //               ],
    //             ),
    //             payment_summary(),
    //             payment_summary(),
    //             payment_summary(),
    //             payment_summary(),
    //             SizedBox(
    //               height: 10,
    //             ),
    //             Divider(
    //               color: Color(0xffB7D7BE),
    //             ),
    //             Column(
    //               children: [
    //                 SizedBox(
    //                   height: 10,
    //                 ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Row(
    //                       children: [
    //                         Text("  Total",
    //                             style: TextStyle(
    //                                 fontSize: 15,
    //                                 fontWeight: FontWeight.bold,
    //                                 color: Color(0xff184F27))),
    //                       ],
    //                     ),
    //                     Row(
    //                       children: [
    //                         Text(
    //                           "LE 150.40",
    //                           style: TextStyle(
    //                               fontWeight: FontWeight.bold,
    //                               color: Color(0xff184F27)),
    //                         ),
    //                       ],
    //                     )
    //                   ],
    //                 ),
    //                 SizedBox(
    //                   height: 10,
    //                 ),
    //                 ElevatedButton(
    //                   style: ElevatedButton.styleFrom(
    //                     foregroundColor: Colors.white,
    //                     backgroundColor: Color(0xFF1B602D),
    //                     padding: EdgeInsets.symmetric(
    //                       vertical: 10,
    //                       horizontal: 100,
    //                     ),
    //                   ),
    //                   onPressed: () {},
    //                   child: const Text("continue",
    //                       style: TextStyle(fontSize: 17)),
    //                 )
    //               ],
    //             )
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
     
    // );
 

// Image.asset("images/image 65.png"),

// Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Mint Seedling"),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text("LE.20")
//                     ],
//                   ),
