
import 'package:application5/controller/cont/cart_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPage extends StatelessWidget {
  final CartController _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          
            return ListView.builder(
              itemCount: _cartController.ongoinglists.length,
              itemBuilder: (context, index) {
                return Text("${_cartController.ongoinglists[index]["total"]}");
              },
            );

        }),
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  final QueryDocumentSnapshot orderData;

  const OrderItem({Key? key, required this.orderData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extracting order details
    String orderId = orderData.id;
    String orderDateTime = orderData['dateTime'].toString();
    double orderTotal = orderData['total'];

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text('Order ID: $orderId'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: $orderDateTime'),
            Text('Total: EGP $orderTotal'),
          ],
        ),
        onTap: () {
          // You can add navigation or further actions here
        },
      ),
    );
  }
}








// import 'package:application5/controller/cont/cart_controller.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class OrdersPage extends StatelessWidget {
//   final cartController = Get.put(CartController()); 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      // appBar: AppBar(
      //   title: Text('My Orders'),
      // ),
      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection('orders').snapshots(),
      //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (snapshot.hasData) {
      //       return ListView.builder(
      //         itemCount: cartController.ongoinglist.length,
      //         itemBuilder: (context, index) {
      //           // var order = snapshot.data!.docs[index];
      //           // var orderData = order.data() as Map<String, dynamic>;
      //           // List<dynamic> productsList = orderData['products'];
      //           // double total = orderData['total'];
      //           // bool couponApplied = orderData['couponApplied'];
      //           // String couponCode = orderData['couponCode'];
      //           // Map<String, dynamic> shippingDetails =
      //           //     orderData['shippingDetails'];
      //           // Build order item widget
      //           return Card(
      //             margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      //             child: Padding(
      //               padding: EdgeInsets.all(15),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     'Order ${index + 1}',
      //                     style: TextStyle(
      //                       fontSize: 18,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                   SizedBox(height: 10),
      //                   Text('Total: EGP ${cartController.ongoinglist[index]["total"]}'),
      //                   SizedBox(height: 10),
      //                   Text('Coupon Applied: ${couponApplied ? 'Yes' : 'No'}'),
      //                   if (couponApplied) Text('Coupon Code: $couponCode'),
      //                   SizedBox(height: 10),
      //                   Text(
      //                     'Shipping Details:',
      //                     style: TextStyle(
      //                       fontSize: 16,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                   SizedBox(height: 5),
      //                   Text('Building Name: ${shippingDetails['buildingName']}'),
      //                   Text('Apartment No: ${shippingDetails['apartmentNo']}'),
      //                   Text('Floor No: ${shippingDetails['floorNo']}'),
      //                   Text('Street Name: ${shippingDetails['streetName']}'),
      //                   if (shippingDetails['additionalDirection'].isNotEmpty)
      //                     Text(
      //                       'Additional Direction: ${shippingDetails['additionalDirection']}',
      //                     ),
      //                   Text('Phone: ${shippingDetails['phone']}'),
      //                   SizedBox(height: 10),
      //                   Text(
      //                     'Products:',
      //                     style: TextStyle(
      //                       fontSize: 16,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                   Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: productsList
      //                         .map((product) => Padding(
      //                               padding: EdgeInsets.symmetric(vertical: 5),
      //                               child: Row(
      //                                 mainAxisAlignment:
      //                                     MainAxisAlignment.spaceBetween,
      //                                 children: [
      //                                   Text('${product['name']}'),
      //                                   Text('Quantity: ${product['quantity']}'),
      //                                   Text('Price: EGP ${product['price']}'),
      //                                 ],
      //                               ),
      //                             ))
      //                         .toList(),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           );
      //         },
      //       );
      //     } else {
      //       return Center(child: CircularProgressIndicator());
      //     }
      //   },
      // ),
//     );
//   }
// }
