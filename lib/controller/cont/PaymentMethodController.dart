import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  var isCash = true.obs;

  void selectCash() {
    isCash.value = true;
  }

  void selectCreditCard() {
    isCash.value = false;
  }

  String get paymentMethod => isCash.value ? 'Cash' : 'Credit Card';
}
