// import 'package:application5/controller/cont/orders_controller.dart';
// import 'package:application5/model/order_model.dart';
// import 'package:application5/pages/2details.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MyOrdersPage extends StatelessWidget {
//   final OrdersController ordersController = Get.put(OrdersController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Orders'),
//       ),
//       body: Obx(() {
//         // Separate ongoing and completed orders
//         final ongoingOrders = ordersController.ordersList.where((order) => order.status == 'Ongoing').toList();
//         final completedOrders = ordersController.ordersList.where((order) => order.status != 'Ongoing').toList();

//         return ListView(
//           children: [
//             // Display ongoing orders
//             if (ongoingOrders.isNotEmpty)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Text('Ongoing Orders', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                   ),
//                   ...ongoingOrders.map((order) => OrderCard(order: order)).toList(),
//                   SizedBox(height: 20),
//                 ],
//               ),
//             // Display completed orders
//             if (completedOrders.isNotEmpty)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Text('Order History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                   ),
//                   ...completedOrders.map((order) => OrderCard(order: order)).toList(),
//                 ],
//               ),
//           ],
//         );
//       }),
//     );
//   }
// }

// class OrderCard extends StatelessWidget {
//   final Order order;

//   OrderCard({required this.order});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//       child: ListTile(
//         title: Text('Order ID: ${order.orderId}'),
//         subtitle: Text('Total: EGP ${order.totalPrice.toStringAsFixed(2)}'),
//         trailing: Text(order.status),
//         onTap: () {
//           Get.to(OrderDetailsPage(order: order));
//         },
//       ),
//     );
//   }
// }
