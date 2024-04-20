// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:application5/model/order_model.dart';

// class OrderDetailsPage extends StatelessWidget {
//   final Order order;

//   OrderDetailsPage({required this.order});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order Details'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Order ID: ${order.orderId}'),
//             Text('Total: EGP ${order.totalPrice.toStringAsFixed(2)}'),
//             Text('Status: ${order.status}'),
//             SizedBox(height: 20),
//             Text('Items:', style: TextStyle(fontWeight: FontWeight.bold)),
//             ...order.items.map((item) => Text('${item.product.name} - ${item.quantity}')),
//             SizedBox(height: 20),
//             Text('Shipping Info:', style: TextStyle(fontWeight: FontWeight.bold)),
//             Text('Building Number: ${order.buildingNumber}'),
//             Text('Apartment No: ${order.apartmentNo}'),
//             Text('Floor No: ${order.floorNo}'),
//             Text('Street Name: ${order.streetName}'),
//             Text('Phone No: ${order.phoneNo}'),
//             Text('Additional Directions: ${order.additionalDirections ?? 'N/A'}'),
//             SizedBox(height: 20),
//             Text('Payment Method: ${order.paymentMethod}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
