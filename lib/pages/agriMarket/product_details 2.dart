import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:application5/controller/cont/product_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetails extends StatelessWidget {
  final String img;
  final String? name;
  final String? price;

  ProductDetails({
    super.key,
    required this.img,
    this.name,
    this.price,
  });

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1FCF3),
      appBar: AppBar(
        backgroundColor: Color(0xFFF1FCF3),
        // leading: Image.asset(
        //   "images/back.png",
        //   height: 8,
        //   width: ,
        // ),
        actions: [
          Image.asset(
            "images/cart.png",
            height: 40,
            width: 40,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 400,
                  height: 350,
                  child: PageView.builder(
                    controller:controller.indecator ,
                      scrollDirection: Axis.horizontal,
                      
                      itemCount: 3,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 350,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: NetworkImage(img),
                            fit: BoxFit.fitHeight
                            )
                          ),
                          
                        );
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: SmoothPageIndicator(
                      axisDirection: Axis.horizontal,
                        effect: WormEffect(dotHeight: 10,activeDotColor: Colors.green,dotWidth: 10),

                        controller: controller.indecator, count: 3)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 15, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name ?? 'no name',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1E9B3D),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "4.9",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff1E9B3D),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          // Image.asset(
                          //   "images/Star.png",
                          //   height: 16,
                          // ),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          // Image.asset(
                          //   "images/Star.png",
                          //   height: 16,
                          // ),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          // Image.asset(
                          //   "images/Star.png",
                          //   height: 16,
                          // ),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          // Image.asset(
                          //   "images/Star.png",
                          //   height: 16,
                          // ),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          // Image.asset(
                          //   "images/emptystar.png",
                          //   height: 16,
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: "Product Details\n",
                          style: TextStyle(
                            color: Color(0xff1E9B3D),
                            fontFamily: "worksansbold",
                            fontSize: 24,
                            letterSpacing: -0.24,
                            fontWeight: FontWeight.w500,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  "Basil seedlings, are perfect for home gardening and culinary use. These seedlings are grown organically, ensuring healthy and robust plants for your herb garden",
                              style: TextStyle(
                                fontFamily: "WorkSans",
                                color: Color(0xff60625F),
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Price",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff1E9B3D),
                                ),
                              ),
                              Text(
                                "${price} LE" ?? "4.9",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 192,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xff1A7431)),
                            child: Center(
                              child: Text(
                                "Add to Cart",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
