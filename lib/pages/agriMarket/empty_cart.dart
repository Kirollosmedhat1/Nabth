import 'package:application5/pages/bottom_Bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Empty_Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF1FCF3),
        body: Container(
          padding: const EdgeInsets.only(top: 20),
          // color: Color(0xffF1FCF3),
          color: Colors.amber,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              color: Colors.white,
              child: Center(
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "0 Items in your cart",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff184F27)),
                          ),
                          InkWell(
                            onTap: () {
                              Get.off(const BottomBar(selectedIndex: 1));
                            },
                            child: const Row(children: [
                              Icon(Icons.add),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Add more",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff184F27)),
                              ),
                            ]),
                          )
                        ]),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Your Cart is Empty",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "WorkSans",
                                fontWeight: FontWeight.w500,
                                color: Color(0xff8E8E93)),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(142.5),
                              border: Border.all(color: Colors.grey),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "images/empty_cart.gif"),
                                  fit: BoxFit.fill),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
