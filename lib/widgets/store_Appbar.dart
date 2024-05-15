import 'package:application5/controller/cont/cart_controller.dart';
import 'package:application5/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class StoreAppbar extends StatelessWidget implements PreferredSizeWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Color(0xffF1FCF3),
        actions: [
          IconButton(onPressed: () {}, icon: Image.asset("images/search.png")),
          Stack(
            alignment: Alignment(2.9, -1),
            children: [
              Container(
                height: 18,
                margin: EdgeInsets.only(top: 5, left: 5),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  //  radius: 8,
                  child: Obx(() {
                    int? totalQuantity = cartController.totalQuantity.value;
                    return Text(
                      '$totalQuantity',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: totalQuantity == 0
                            ? Color.fromARGB(0, 255, 255, 255)
                            : Colors.red,
                      ),
                    );
                  }),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Get.to(CartPage());
                  },
                  icon: Image.asset("images/cart.png")),
            ],
          ),
        ],
      );
  }
}