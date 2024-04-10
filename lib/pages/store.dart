import 'dart:io';

import 'package:application5/logic/controller/product_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Store extends StatelessWidget {
  Store({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            width: 46,
            height: 49,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 2, 64, 4).withOpacity(.4),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 35,
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("data"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      width: 95,
                      height: 95,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Text("data"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 95,
                      height: 95,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Text("data"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 95,
                      height: 95,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Text("data"),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("All product"),
            SizedBox(
              height: 400,
              child: Obx(() => GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 60,
                        crossAxisSpacing: 90),
                    itemCount: controller.productlist.length,
                    padding: EdgeInsets.all(12),
                    itemBuilder: (context, i) {
                      return Container(
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffD9D9D9),width: 1,),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: Colors.black,
                        ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                imageUrl: controller.productlist[i]
                                    ["img"], // Firebase Storage URL
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                height:
                                  89, // Adjust the height and width as needed
                                width: 135,
                              ),
                              Text(
                                "${controller.productlist[i]["name"]}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                "${controller.productlist[i]["price"]}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
