

import 'package:application5/model/cart_model.dart';
import 'package:application5/model/productModel.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final cartItems = <CartItem>[].obs;
  @override
  void onInit() {
    super.onInit();
  }
  void addProduct(ProductModel product) {
    final existingItem =
        cartItems.firstWhereOrNull((item) => item.product.name == product.name);
    if (existingItem != null) {
      existingItem.quantity++;
    } else {
      cartItems.add(CartItem(product: product));
    }
  }

  void removeProduct(ProductModel product) {
    cartItems.removeWhere((item) => item.product.name == product.name);
  }

  void updateQuantity(ProductModel product, int quantity) {
    final existingItem =
        cartItems.firstWhereOrNull((item) => item.product.name == product.name);
    if (existingItem != null) {
            existingItem.quantity.value = quantity;
            if (quantity <= 0) {
                cartItems.remove(existingItem);
            }
        }
  }

  double get totalPrice {
    double total = 0.0;
    for (final item in cartItems) {
      total += item.product.price * item.quantity.value;
    }
    return total;
  }
}








// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// class ProductController extends GetxController {
//   var productMap = {}.obs;

//   void addProductToCart (){}
//   void removeProductFromCart (){}
//   void removeOneProduct (){}
//   void clearAll (){}
//   // var total
//   // var subTotal

// }