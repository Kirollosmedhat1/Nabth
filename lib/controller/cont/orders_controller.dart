// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:application5/model/order_model.dart';

// class OrdersController extends GetxController {
//   final ordersList = <Order>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchOrders();
//   }

//   Future<void> fetchOrders() async {
//     try {
//       QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('orders').get();
//       ordersList.value = querySnapshot.docs.map((doc) => Order.fromMap(doc.data() as Map<String, dynamic>)).toList();
//     } catch (e) {
//       print('Error fetching orders: $e');
//     }
//   }

//   Future<void> saveOrder(Order order) async {
//     try {
//       DocumentReference docRef = await FirebaseFirestore.instance.collection('orders').add(order.toMap());
//       order.orderId = docRef.id;
//       ordersList.add(order);
//     } catch (e) {
//       print('Error saving order: $e');
//     }
//   }

//   Future<void> updateOrderStatus(Order order, String status) async {
//     try {
//       order.status = status;
//       await FirebaseFirestore.instance.collection('orders').doc(order.orderId).update({'status': status});
//       ordersList.refresh();
//     } catch (e) {
//       print('Error updating order status: $e');
//     }
//   }
// }
