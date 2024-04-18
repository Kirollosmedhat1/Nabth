import 'package:application5/model/productModel.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CartItem {
  final ProductModel product;
  RxInt quantity;

  CartItem({
    required this.product,
    int quantity = 1,
  }) : quantity = quantity.obs;
}
