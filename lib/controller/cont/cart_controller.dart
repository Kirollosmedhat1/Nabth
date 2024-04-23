import 'package:application5/model/productModel.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var productMap = <CartItem, int>{}.obs;

  void addProduct(CartItem cartItem) {
    bool found = false;
    for (var item in productMap.keys) {
      if (item.name == cartItem.name) {
        // Product with the same name already exists in cart
        productMap[item] = productMap[item]! + 1;
        found = true;
        break;
      }
    }

    if (!found) {
      // If product is not found, add it with quantity 1
      productMap[cartItem] = 1;
    }
  }

  void removeProductFromCart(CartItem cartItem) {
    if (productMap.containsKey(cartItem) && productMap[cartItem]! > 1) {
      // If product exists in cart and its quantity is greater than 1, reduce quantity
      productMap[cartItem] = productMap[cartItem]! - 1;
    } else {
      // If quantity is 1 or less, remove the product from cart
      productMap.remove(cartItem);
    }
  }

  void removeItem(CartItem cartItem) {
    productMap.remove(cartItem);
  }

  double get total {
    // Calculate total price of all products in the cart
    return productMap.entries
        .map((entry) => entry.key.price * entry.value)
        .fold(0, (prev, amount) => prev + amount);
  }
}




//   @override
//   void onInit() {
//     super.onInit();
//   } 

  // void addProduct(ProductModel product) {
  //   if (cartItems.containsKey(product.name)) {
  //     // If product already exists in cart, update the quantity
  //     final existingItem = cartItems[product.name]!;
  //     existingItem.price += product.price;
  //     cartItems[product.name] = existingItem;
  //   } else {
  //     // If product is not in cart, add it
  //     cartItems[product.name] = product;
  //   }
  //   update();
  // }

//   void removeProduct(ProductModel product) {
//     cartItems.remove(product.name);
//     update();
//   }

//   void updateQuantity(ProductModel product, int quantity) {
//     if (cartItems.containsKey(product.name)) {
//       // If product exists in cart, update the quantity
//       final existingItem = cartItems[product.name]!;
//       existingItem.price = product.price * quantity;
//       if (quantity <= 0) {
//         cartItems.remove(product.name);
//       } else {
//         cartItems[product.name] = existingItem;
//       }
//     }
//     update();
//   }

//   double get totalPrice {
//     double total = 0.0;
//     for (final item in cartItems.values) {
//       total += item.price;
//     }
//     return total;
//   }

//   Future<void> addProductToFirestore(ProductModel product) async {
//     try {
//       await FirebaseFirestore.instance.collection('products').add(product.toJson());
//       print('Product added to Firestore successfully!');
//     } catch (e) {
//       print('Error adding product to Firestore: $e');
//     }
//   }
// }






// import 'package:application5/model/cart_model.dart';
// import 'package:application5/model/productModel.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';

// class CartController extends GetxController {
//   final cartItems = <CartItem>[].obs;
//   RxList<ProductModel>productModel=<ProductModel>[].obs;
//   @override
//   void onInit() {
//     super.onInit();
    
//   }
//   void addProduct(ProductModel product) {
//     final existingItem =
//         cartItems.firstWhereOrNull((item) => item.product.name == product.name);
//     if (existingItem != null) {
//       existingItem.quantity++;
//     } else {
//       cartItems.add(CartItem(product: product));
//     }
//   }

//   void removeProduct(ProductModel product) {
//     cartItems.removeWhere((item) => item.product.name == product.name);
//   }
  

//   void updateQuantity(ProductModel product, int quantity) {
//     final existingItem =
//         cartItems.firstWhereOrNull((item) => item.product.name == product.name);
//     if (existingItem != null) {
//             existingItem.quantity.value = quantity;
//             if (quantity <= 0) {
//                 cartItems.remove(existingItem);
//             }
//         }
//         update();
//   }

//   double get totalPrice {
//     double total = 0.0;
//     for (final item in cartItems) {
//       total += item.product.price * item.quantity.value;
//     }
//     return total;
//   }
  

// }


