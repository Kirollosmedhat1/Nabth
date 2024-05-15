import 'package:application5/model/productModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var productMap = <CartItem, int>{}.obs;
  RxDouble total = 0.0.obs;
  RxBool couponApplied = false.obs;
  RxString couponCode = ''.obs;
  RxInt totalQuantity = 0.obs;
  RxDouble Discount = 0.0.obs;
 

  var ongoinglists = [].obs;
  void ongoing() async {
    final user = FirebaseAuth.instance.currentUser!;
    try {
      if (user != null) {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection("orders")
            .where("userId", isEqualTo: user.uid)
            .where("state", isEqualTo: 'ongoing')
            .get();
        ongoinglists.assignAll(querySnapshot.docs);
        print(ongoinglists);
      }
    } catch (e) {
      print("Error fetching ongoing orders: $e");
    }
  }

  Future<void> placeOrder() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userid = user?.uid;
    final username = user?.displayName;
    String orderId = '';
    if (userid != null && username != null) {
      List<Map<String, dynamic>> productsList = productMap.entries.map((entry) {
        return {
          'quantity': entry.value,
          'name': entry.key.name,
          'price': entry.key.price,
        };
      }).toList();

      // Create an order object with the necessary details
      Map<String, dynamic> orderData = {
        "userId": userid,
        "username": username,
        'dateTime': DateTime.now(),
        'products': productsList,
        'total': total.value,
        'couponApplied': couponApplied.value,
        'couponCode': couponCode.value,
        'timestamp': FieldValue.serverTimestamp(),
        "state": "ongoing",
      };

      final CollectionReference ordersCollection =
          FirebaseFirestore.instance.collection('orders');

      DocumentReference orderRef = await ordersCollection.add(orderData);

      // Get the ID of the newly added order
      orderId = orderRef.id;

      clearCart();
    }
  }

  Future<void> markOrderAsCancel(DocumentSnapshot orderDoc) async {
    try {
      await orderDoc.reference.update({'state': 'Canceled'});
      ongoing(); 
      update();
    } catch (e) {
      print("$e Error: to mark order as done");
    }
  }

  Future<void> markOrderAsDeliverd(DocumentSnapshot orderDoc) async {
    try {
      await orderDoc.reference.update({'state': 'Deliverd'});

      ongoing();
      update();
    } catch (e) {
      print("$e Error: to mark order as done");
    }
  }

  // Clear the cart after placing an order
  void clearCart() {
    productMap.clear();
    total.value = 0.0;
    couponApplied.value = false;
    couponCode.value = '';
    totalQuantity.value = 0;
    Discount.value = 0.0; // Reset discount to zero
  }

  var historyList=[].obs;
  void getHistory() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection("orders")
            .where('userId', isEqualTo: user.uid)
            .where("state", whereIn: ["Canceled", "Deliverd"])
            // .where("state", isEqualTo: "done")
            .get();

        historyList.assignAll(querySnapshot.docs);
      }
    } catch (e) {
      print("$e Error: to get products");
    }
  }

  void addProduct(CartItem cartItem) {
    bool found = false;
    for (var item in productMap.keys) {
      if (item.name == cartItem.name) {
        productMap[item] = productMap[item]! + 1;
        found = true;
        break;
      }
    }

    if (!found) {
      productMap[cartItem] = 1;
    }
    total.value = calculateTotal();
    totalQuantity.value = calculateTotalQuantity();
  }

  void removeProductFromCart(CartItem cartItem) {
    if (productMap.containsKey(cartItem) && productMap[cartItem]! > 1) {
      productMap[cartItem] = productMap[cartItem]! - 1;
    } else {
      productMap.remove(cartItem);
    }
    total.value = calculateTotal();
    totalQuantity.value = calculateTotalQuantity();
  }

  void removeItem(CartItem cartItem) {
    productMap.remove(cartItem);
    total.value = calculateTotal();
    totalQuantity.value = calculateTotalQuantity();
  }

  void applyDiscount(double discountAmount) {
    total.value -= discountAmount;
    couponApplied.value = true;
    Discount.value = discountAmount; // Set Discount to the applied amount
  }

  void removeDiscount() {
    total.value = calculateTotal();
    couponApplied.value = false;
    couponCode.value = '';
    Discount.value = 0.0; // Reset Discount to zero
  }

  double calculateTotal() {
    return productMap.entries
        .map((entry) => entry.key.price * entry.value)
        .fold(0, (prev, amount) => prev + amount);
  }

  int calculateTotalQuantity() {
    return productMap.values.fold(0, (prev, quantity) => prev + quantity);
  }

  void applyCoupon(String code) {
    if (code == 'kiro10') {
      applyDiscount(total.value * 0.1);
      couponCode.value = code;
    } else if (code == 'kiro15') {
      applyDiscount(total.value * 0.15);
      couponCode.value = code;
    } else if (code == 'mtarek25') {
      if (total.value > 200) {
        applyDiscount(50);
      } else {
        applyDiscount(total.value * 0.25);
        couponCode.value = code;
      }
    }
  }
}

