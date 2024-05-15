import 'package:flutter/material.dart';

class myOrderEdit2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: const Color(0xffF1FCF3),
          borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(10), right: Radius.circular(10)),
          border: Border.all(color: const Color(0xffB7D7BE))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "images/image2.png",
            height: 150,
          ),
          const SizedBox(
            width: 50,
          ),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Order #790903254",
                style: TextStyle(fontSize: 20, color: Color(0xff1A7431)),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Image.asset(
                    "images/cancel.png",
                    height: 20,
                  ),
                  const Text(
                    "  Cancelled",
                    style: TextStyle(fontSize: 20, color: Color(0xff1A7431)),
                  ),
                  const SizedBox(
                    width: 40,
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
