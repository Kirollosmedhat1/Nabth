// ignore_for_file: file_names

import 'package:application5/controller/cont/cart_controller.dart';
import 'package:application5/pages/agriMarket/cart_page.dart';
import 'package:application5/widgets/homeSearch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreAppbar extends StatelessWidget implements PreferredSizeWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: const Color(0xffF1FCF3),
        actions: [
          SearchHome(),
          Stack(
            alignment: const Alignment(2.9, -1),
            children: [
              Container(
                height: 18,
                margin: const EdgeInsets.only(top: 5, left: 5),
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
                            ? const Color.fromARGB(0, 255, 255, 255)
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
                  icon: Image.asset("images/IconCart.png",height: 40,)),
            ],
          ),
        ],
      );
  }
}