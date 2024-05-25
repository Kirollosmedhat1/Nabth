import 'package:application5/controller/cont/cart_controller.dart';
import 'package:application5/pages/checkout.dart';
import 'package:application5/pages/success_page.dart';
import 'package:application5/widgets/myButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PaymentSummaryPro extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  final TextEditingController couponController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Payment Summary",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xff1B602D),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Order Total",
              style: TextStyle(fontSize: 14, color: Color(0xff1B602D)),
            ),
            Obx(() => Text(
                  '${cartController.total.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 14, color: Color(0xff1B602D)),
                )),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Coupon Discount",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff1B602D),
                fontWeight: FontWeight.w400,
              ),
            ),
            Obx(() {
              bool couponApplied = cartController.couponApplied.value;
              return Text(
                 couponApplied? "-${cartController.Discount.value.toStringAsFixed(2)}":"0.00" ,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff1B602D),
                  fontWeight: FontWeight.w400,
                ),
              );
            }),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFB7D7BE),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: couponController,
                  decoration: const InputDecoration(
                    hintText: "Enter coupon code",
                    hintStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    // You can add validation or other logic here if needed
                  },
                ),
              ),
              Obx(() {
                bool couponApplied = cartController.couponApplied.value;
                return InkWell(
                  onTap: () {
                    String couponCode = couponController.text.trim();
                    if (couponCode.isNotEmpty && !couponApplied) {
                      cartController.applyCoupon(couponCode);
                      FocusScope.of(context).unfocus();
                    } else if (couponApplied) {
                      cartController.removeDiscount();
                      couponController.clear();
                    }
                  },
                  child: Text(
                    couponApplied ? "CANCEL" : "APPLY",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: couponApplied
                          ? const Color.fromARGB(255, 205, 39, 39)
                          : const Color(0xff1A7431),
                    ),
                  ),
                );
              }),
              
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Shipping",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff1B602D),
                fontWeight: FontWeight.w400,
              ),
            ),

            Text(
              'Free', // Add your shipping amount here
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff1B602D),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const Divider(
          color: Color(0xffB7D7BE),
          height: 30,
          indent: 1,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff1B602D),
                fontWeight: FontWeight.bold,
              ),
            ),
            Obx(() => Text(
                  "EGP: ${cartController.total.value.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xff1B602D),
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
        const SizedBox(height: 20),
        Center(
          child: MyButton(
            lable: "Continue",
            onPressed: () {
              
              Get.to(const checkout());
              
            },
          ),
        ),
      ],
    );
  }
}
