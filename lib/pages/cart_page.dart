import 'package:application5/controller/cont/cart_controller.dart';
import 'package:application5/model/productModel.dart';
import 'package:application5/pages/empty_cart.dart';
import 'package:application5/widgets/cart_widget.dart';
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
      appBar: AppBar(
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
        onTabChange: (index) {},
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
                        Row(
                          children: [
                            Text(
                              " Items in your cart",
                              style: TextStyle(
                                color: Color(0xff1B602D),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            InkWell(
                              child: Row(
                                children: [
                                  Icon(Icons.add),
                                  Text("data",
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
                        Expanded(
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
                        payment_summary_pro(
                            num2: cartController.total.toString(),
                            num3: "${cartController.total * 0.9}",
                            num4: "")
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











// import 'package:application5/controller/cont/cart_controller.dart';
// import 'package:application5/model/productModel.dart';
// import 'package:application5/pages/empty_cart.dart';
// import 'package:application5/widgets/product_widget.dart';
// import 'package:application5/widgets/productsItem.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

// class CartPage extends StatelessWidget {
//   final CartController cartController = Get.put(CartController());
//   int _selectedIndex = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: Image.asset(
//             "images/back.png",
//             height: 20,
//           ),
//         ),
//         title: Text('Cart'),
//       ),
//       bottomNavigationBar: MoltenBottomNavigationBar(
//         selectedIndex: _selectedIndex,
//         domeHeight: 25,
//         onTabChange: (index) {},
//         borderColor: Color(0xff1E9B3D),
//         barColor: Colors.white,
//         domeCircleColor: Color(0xffCAEDCF),
//         tabs: [
//           MoltenTab(
//             icon: Image.asset(
//               _selectedIndex == 0 ? 'images/home-selected.png' : 'images/home.png',
//             ),
//             selectedColor: Color(0xff1E9B3D),
//             title: Text(
//               'home',
//               style: TextStyle(color: Color(0xff1E9B3D)),
//             ),
//           ),
//           MoltenTab(
//             icon: Image.asset(
//               _selectedIndex == 1 ? 'images/store-selected.png' : 'images/store.png',
//             ),
//             selectedColor: Color(0xff1E9B3D),
//             title: Text(
//               'AgriMarket',
//               style: TextStyle(color: Color(0xff1E9B3D)),
//             ),
//           ),
//           MoltenTab(
//             icon: Image.asset(
//               _selectedIndex == 2 ? 'images/scan-selected.png' : 'images/scan.png',
//             ),
//             selectedColor: Color(0xff1E9B3D),
//             title: Text(
//               'Scan',
//               style: TextStyle(color: Color(0xff1E9B3D)),
//             ),
//           ),
//           MoltenTab(
//             icon: Image.asset(
//               _selectedIndex == 3 ? 'images/community-selected.png' : 'images/community.png',
//             ),
//             selectedColor: Color(0xff1E9B3D),
//             title: Text(
//               'Community',
//               style: TextStyle(color: Color(0xff1E9B3D)),
//             ),
//           ),
//           MoltenTab(
//             icon: Image.asset(
//               _selectedIndex == 4 ? 'images/profile-selected.png' : 'images/profile.png',
//             ),
//             selectedColor: Color(0xff1E9B3D),
//             title: Text(
//               'Account',
//               style: TextStyle(color: Color(0xff1E9B3D)),
//             ),
//           ),
//         ],
//       ),
//       body: Obx(
//         () {
//           final cartController = Get.find<CartController>();
//           if (cartController.productMap.isEmpty) {
//             // Show empty cart page if cart is empty
//             return Empty_Cart();
//           } else {
//             return ListView.builder(itemBuilder: (contexrt ,i ){
//               final  cartItem = cartController.productMap.keys.toList()[i];

//               return CartItemsWidget(cartItem:cartItem, i: i,);

//             });



            // return Column(
            //   children: [
            //     Expanded(
            //       child: ListView.builder(
            //         itemCount: cartController.productMap.length,
            //         itemBuilder: (context, index) {
            //           final product = cartController.productMap[index];
            //           return Column(
            //             children: [
            //               Container(
            //                 margin: EdgeInsets.all(20),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Row(
            //                       children: [
            //                         Container(
            //                           width: 70,
            //                           height: 70,
            //                           decoration: BoxDecoration(
            //                             border: Border.all(color: Color(0xffD9D9D9), width: 2),
            //                             borderRadius: BorderRadius.circular(15),
            //                           ),
            //                           child: Image.network(
            //                             CartItem.image,
            //                             fit: BoxFit.contain,
            //                           ),
            //                         ),
            //                         SizedBox(width: 25),
            //                         Column(
            //                           mainAxisAlignment: MainAxisAlignment.start,
            //                           crossAxisAlignment: CrossAxisAlignment.start,
            //                           children: [
            //                             Text(product?.name ?? ''),
            //                             SizedBox(height: 20),
            //                             Text('EGP ${product?.price.toStringAsFixed(2) ?? ''}'),
            //                           ],
            //                         ),
            //                       ],
            //                     ),
            //                     Row(
            //                       children: [
            //                         Column(
            //                           mainAxisAlignment: MainAxisAlignment.center,
            //                           crossAxisAlignment: CrossAxisAlignment.center,
            //                           children: [
            //                             Row(
            //                               mainAxisAlignment: MainAxisAlignment.end,
            //                               children: [
            //                                 SizedBox(width: 70),
            //                                 InkWell(
            //                                   child: Container(
            //                                     child: Image.asset("images/x.png"),
            //                                   ),
            //                                   onTap: () {
            //                                     // cartController.removeProduct(product!);
            //                                   },
            //                                 ),
            //                               ],
            //                             ),
            //                             SizedBox(height: 10),
            //                             Container(
            //                               width: 70,
            //                               decoration: BoxDecoration(
            //                                 border: Border.all(color: Color(0xffB7D7BE)),
            //                                 color: Color(0xffF1FCF3),
            //                               ),
            //                               child: Row(
            //                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
            //                                 children: [
            //                                   InkWell(
            //                                     onTap: () {
            //                                       // cartController.updateQuantity(product!, product!.quantity - 1);
            //                                     },
            //                                     child: Icon(
            //                                       Icons.remove,
            //                                       color: Color(0xff1A7431),
            //                                       size: 15,
            //                                     ),
            //                                   ),
            //                                   Text(
            //                                      '${product?.quantity ?? 0}',
            //                                     style: TextStyle(fontSize: 15),
            //                                   ),
            //                                   InkWell(
            //                                     onTap: () {
            //                                       // cartController.updateQuantity(product!, product!.quantity + 1);
            //                                     },
            //                                     child: Icon(
            //                                       Icons.add,
            //                                       color: Color(0xff1A7431),
            //                                       size: 15,
            //                                     ),
            //                                   ),
            //                                 ],
            //                               ),
            //                             ),
            //                           ],
            //                         ),
            //                       ],
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           );


  //                   }}
  //                 ),
  //               );
  // }}






// import 'package:application5/controller/cont/cart_controller.dart';
// import 'package:application5/pages/2check.dart';
// import 'package:application5/pages/checkout.dart';
// import 'package:application5/pages/empty_cart.dart';
// import 'package:application5/widgets/payment_summry.dart';
// import 'package:application5/widgets/payment_summry_pro.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

// class CartPage extends StatelessWidget {
//   final CartController cartController = Get.put(CartController());
//   int _selectedIndex = 1;
//   int kiro = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//                 onPressed: () {
//                   Get.back();
//                 },
//                 icon: Image.asset(
//                   "images/back.png",
//                   height: 20,
//                 )),
//         title: Text('Cart'),
//       ),
//       bottomNavigationBar: MoltenBottomNavigationBar(
//         selectedIndex: _selectedIndex,
//         domeHeight: 25,
//         onTabChange: (index) {
          
//         },
//         borderColor: Color(0xff1E9B3D),
//         barColor: Colors.white,
//         domeCircleColor: Color(0xffCAEDCF),
//         tabs: [
//           MoltenTab(
//             icon: Image.asset(
//               _selectedIndex == 0
//                   ? 'images/home-selected.png'
//                   : 'images/home.png',
//             ),
//             selectedColor: Color(0xff1E9B3D),
//             title: Text(
//               'home',
//               style: TextStyle(color: Color(0xff1E9B3D)),
//             ),
//           ),
//           MoltenTab(
//             icon: Image.asset(
//               _selectedIndex == 1
//                   ? 'images/store-selected.png'
//                   : 'images/store.png',
//             ),
//             selectedColor: Color(0xff1E9B3D),
//             title: Text(
//               'AgriMarket',
//               style: TextStyle(color: Color(0xff1E9B3D)),
//             ),
//           ),
//           MoltenTab(
//             icon: Image.asset(
//               _selectedIndex == 2
//                   ? 'images/scan-selected.png'
//                   : 'images/scan.png',
//             ),
//             selectedColor: Color(0xff1E9B3D),
//             title: Text(
//               'Scan',
//               style: TextStyle(color: Color(0xff1E9B3D)),
//             ),
//           ),
//           MoltenTab(
//             icon: Image.asset(
//               _selectedIndex == 3
//                   ? 'images/community-selected.png'
//                   : 'images/community.png',
//             ),
//             selectedColor: Color(0xff1E9B3D),
//             title: Text(
//               'Community',
//               style: TextStyle(color: Color(0xff1E9B3D)),
//             ),
//           ),
//           MoltenTab(
//             icon: Image.asset(
//               _selectedIndex == 4
//                   ? 'images/profile-selected.png'
//                   : 'images/profile.png',
//             ),
//             selectedColor: Color(0xff1E9B3D),
//             title: Text(
//               'Account',
//               style: TextStyle(color: Color(0xff1E9B3D)),
//             ),
//           ),
//         ],
//       ),
//        body: Obx(
//         () {
//           final cartController = Get.find<CartController>();
//           if (cartController.cartItems.isEmpty) {
//             // Show empty cart page if cart is empty
//             return Empty_Cart();
//           } else {
//             return Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cartController.cartItems.length,
//                     itemBuilder: (context, index) {
//                       final cartItem = cartController.cartItems[index];
//                       return Column(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.all(20),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Container(
//                                       width: 70,
//                                       height: 70,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(color: Color(0xffD9D9D9), width: 2),
//                                         borderRadius: BorderRadius.circular(15),
//                                       ),
//                                       child: Image.network(
//                                         cartItem.product.image,
//                                         fit: BoxFit.contain,
//                                       ),
//                                     ),
//                                     SizedBox(width: 25),
//                                     Column(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(cartItem.product.name),
//                                         SizedBox(height: 20),
//                                         Text('EGP ${cartItem.product.price} x ${cartItem.quantity}'),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Column(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment: MainAxisAlignment.end,
//                                           children: [
//                                             SizedBox(width: 70),
//                                             InkWell(
//                                               child: Container(
//                                                 child: Image.asset("images/x.png"),
//                                               ),
//                                               onTap: () {
//                                                 cartController.removeProduct(cartItem.product);
//                                               },
//                                             ),
//                                           ],
//                                         ),
//                                         SizedBox(height: 10),
//                                         Container(
//                                           width: 70,
//                                           decoration: BoxDecoration(
//                                             border: Border.all(color: Color(0xffB7D7BE)),
//                                             color: Color(0xffF1FCF3),
//                                           ),
//                                           child: Row(
//                                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                             children: [
//                                               InkWell(
//                                                 onTap: () {
//                                                   int newQuantity = cartItem.quantity.value - 1;
//                                                   cartController.updateQuantity(cartItem.product, newQuantity);
//                                                 },
//                                                 child: Icon(
//                                                   Icons.remove,
//                                                   color: Color(0xff1A7431),
//                                                   size: 15,
//                                                 ),
//                                               ),
//                                               Text(
//                                                 '${cartItem.quantity.value}',
//                                                 style: TextStyle(fontSize: 15),
//                                               ),
//                                               InkWell(
//                                                 onTap: () {
//                                                   int newQuantity = cartItem.quantity.value + 1;
//                                                   cartController.updateQuantity(cartItem.product, newQuantity);
//                                                 },
//                                                 child: Icon(
//                                                   Icons.add,
//                                                   color: Color(0xff1A7431),
//                                                   size: 15,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.fromLTRB(30, 10, 30, 0),
//                   child: Column(
//                     children: [
//                       payment_summary_pro(num2: 12, num3: 14, num4: 0),
//                       SizedBox(height: 10),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           foregroundColor: Colors.white,
//                           backgroundColor: Color(0xFF1B602D),
//                           padding: EdgeInsets.symmetric(
//                             vertical: 10,
//                             horizontal: 100,
//                           ),
//                         ),
//                         onPressed: () {
//                           Get.to(checkout());
//                         },
//                         child: const Text("continue", style: TextStyle(fontSize: 15)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
// }




