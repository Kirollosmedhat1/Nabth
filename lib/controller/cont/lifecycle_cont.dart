import 'package:application5/controller/cont/cycleController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class container_in_life extends StatelessWidget {
   container_in_life({super.key, required this.img, required this.name});
     final String img;
     final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          width: 400,
          height: 210,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffCAEDCF)),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(img,
                  height: 100,
                  ),
                  SizedBox(
                    width: 15,
                    
                  ),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color(0xff1A7431),
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "2 Reminder set",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Color(0xff4F795B),
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xff1E9B3D),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child:  const Text(
                          "More info",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff1E9B3D)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  )
                ],
              ),
              const Divider(
                color: Color(0xffCAEDCF),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5),
                child:  Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      "images/IconWatering.png",
                      height: 38,
                      width: 27,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      "images/IconHarvesting.png",
                      height: 40,
                      width: 40,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
