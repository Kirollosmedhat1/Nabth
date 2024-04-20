// import 'package:application5/model/cart_model.dart';

// class Order {
//   String orderId; // Auto-generated ID
//   String userId; // The ID of the user who placed the order
//   String buildingNumber;
//   String apartmentNo;
//   String floorNo;
//   String streetName;
//   String phoneNo;
//   String? additionalDirections;
//   String paymentMethod; // "Cash" or "Credit Card"
//   String status; // "Ongoing", "Delivered", "Canceled"
//   List<CartItem> items; // List of cart items in the order
//   double totalPrice;

//   Order({
//     required this.orderId,
//     required this.userId,
//     required this.buildingNumber,
//     required this.apartmentNo,
//     required this.floorNo,
//     required this.streetName,
//     required this.phoneNo,
//     required this.paymentMethod,
//     required this.status,
//     required this.items,
//     required this.totalPrice,
//     this.additionalDirections,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'orderId': orderId,
//       'userId': userId,
//       'buildingNumber': buildingNumber,
//       'apartmentNo': apartmentNo,
//       'floorNo': floorNo,
//       'streetName': streetName,
//       'phoneNo': phoneNo,
//       'additionalDirections': additionalDirections,
//       'paymentMethod': paymentMethod,
//       'status': status,
//       'items': items.map((item) => item.toMap()).toList(),
//       'totalPrice': totalPrice,
//     };
//   }

//   // Convert from a Map to an Order object
//   Order.fromMap(Map<String, dynamic> data)
//       : orderId = data['orderId'],
//         userId = data['userId'],
//         buildingNumber = data['buildingNumber'],
//         apartmentNo = data['apartmentNo'],
//         floorNo = data['floorNo'],
//         streetName = data['streetName'],
//         phoneNo = data['phoneNo'],
//         additionalDirections = data['additionalDirections'],
//         paymentMethod = data['paymentMethod'],
//         status = data['status'],
//         items = (data['items'] as List)
//             .map((itemData) => CartItem.fromMap(itemData))
//             .toList(),
//         totalPrice = data['totalPrice'].toDouble();
// }
