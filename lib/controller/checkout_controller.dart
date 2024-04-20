// import 'package:application5/controller/cont/orders_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class CheckoutController extends GetxController {
//   final buildingNumberController = TextEditingController();
//   final apartmentNoController = TextEditingController();
//   final floorNoController = TextEditingController();
//   final streetNameController = TextEditingController();
//   final phoneNoController = TextEditingController();
//   final additionalDirectionsController = TextEditingController();

//   final formKey = GlobalKey<FormState>();

//   Future<void> submitCheckout() async {
//     if (formKey.currentState?.validate() == true) {
//       final ordersController = Get.find<OrdersController>();

//       // Create a new order using the input from the form and save it
//       final order = ordersController.createOrder(
//         buildingNumberController.text,
//         apartmentNoController.text,
//         floorNoController.text,
//         streetNameController.text,
//         phoneNoController.text,
//         additionalDirectionsController.text,
//       );

//       // Navigate to the My Orders page after saving the order
//       // Implement your own navigation logic here
//       // For example:
//       // Get.to(MyOrdersPage());

//       // Clear the form fields after submission
//       buildingNumberController.clear();
//       apartmentNoController.clear();
//       floorNoController.clear();
//       streetNameController.clear();
//       phoneNoController.clear();
//       additionalDirectionsController.clear();
//     }
//   }

//   @override
//   void onClose() {
//     // Dispose of the controllers when the page is closed
//     buildingNumberController.dispose();
//     apartmentNoController.dispose();
//     floorNoController.dispose();
//     streetNameController.dispose();
//     phoneNoController.dispose();
//     additionalDirectionsController.dispose();
//     super.onClose();
//   }
// }
