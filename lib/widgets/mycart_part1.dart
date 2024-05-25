import 'package:application5/controller/cont/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyCartPart1 extends StatefulWidget {
  MyCartPart1({required this.text, required this.number});
  final String text;
  final String number;
  final CartController cartController = Get.put(CartController());
  @override
  State<MyCartPart1> createState() => _MyCartPart1State();
}

class _MyCartPart1State extends State<MyCartPart1> {
  int _selectedIndex = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffD9D9D9), width: 2),
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset(
                    "images/photo.png",
                    fit: BoxFit.contain,
                  )),
              const SizedBox(
                width: 25,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.text),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(widget.number)
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: 70,
                      ),
                      IconButton(
                          iconSize: 20,
                          onPressed: () {},
                          icon: Image.asset(
                            "images/x.png",
                            height: 15,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffB7D7BE)),
                      color: const Color(0xffF1FCF3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.remove,
                              color: Color(0xff1A7431),
                              size: 15,
                            )),

                        const Text(
                          '0',
                          style: TextStyle(fontSize: 15),
                        ),
                        // SizedBox(width: 1),
                        InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.add,
                              color: Color(0xff1A7431),
                              size: 15,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
