import 'package:application5/controller/cont/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedTextField extends StatelessWidget {
  final ProductController _controller = Get.put(ProductController());

  AnimatedTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: _controller.isExpanded.value ? 200 : 0,
            child: _controller.isExpanded.value
                ? TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter text',
                      border: OutlineInputBorder(),
                    ),
                  )
                : null,
          ),
          
        ],
      );
    });
  }
}