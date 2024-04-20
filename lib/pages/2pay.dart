// import 'package:application5/controller/cont/PaymentMethodController.dart';
// import 'package:application5/pages/2check.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class PaymentMethodPage extends StatelessWidget {
//   final PaymentMethodController paymentMethodController = Get.put(PaymentMethodController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment Method'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Obx(() {
//               return CheckboxListTile(
//                 title: Text('Cash'),
//                 value: paymentMethodController.isCash.value,
//                 onChanged: (value) {
//                   if (value != null) {
//                     paymentMethodController.selectCash();
//                   }
//                 },
//               );
//             }),
//             Obx(() {
//               return CheckboxListTile(
//                 title: Text('Credit Card'),
//                 value: !paymentMethodController.isCash.value,
//                 onChanged: (value) {
//                   if (value != null) {
//                     paymentMethodController.selectCreditCard();
//                   }
//                 },
//               );
//             }),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to checkout page after selecting payment method
//                 Get.to(CheckoutPage());
//               },
//               child: Text('Continue'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
