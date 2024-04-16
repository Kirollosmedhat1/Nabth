import 'package:application5/controller/constant/imgs.dart';
import 'package:application5/widgets/productsItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:application5/controller/cont/product_controller.dart';
import 'package:application5/pages/categorypage.dart';
import 'package:google_fonts/google_fonts.dart';

class Store extends StatelessWidget {
  Store({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
              "Categories",
              style: GoogleFonts.workSans(
                color: Color.fromRGBO(24, 79, 39, 1),
                fontSize: 25,
                letterSpacing: -0.24,
                fontWeight: FontWeight.w500,
              ),
            ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(left: 57),
            alignment: Alignment.topLeft,
      
          ),
          SizedBox(
            height: 9,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCategoryContainer(
                image: seedling,
                categoryName: "Seedlings",
              ),
              _buildCategoryContainer(
                image: Tools,
                categoryName: "Farming Tools",
              ),
              _buildCategoryContainer(
                image: fertilizer,
                categoryName: "Fertilizers",
              ),
            ],
          ),
          SizedBox(height: 30),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 18),
                  child: Text(
                    "All Products",
                    style: GoogleFonts.workSans(
                      color: Color.fromRGBO(24, 79, 39, 1),
                      fontSize: 21,
                      letterSpacing: -0.24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 428,
                  child: Obx(() {
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 48,
                        crossAxisSpacing: 58,
                      ),
                      itemCount: controller.productlist.length,
                      itemBuilder: (context, i) {
                        return ProductItemsWidget(
                          img: "${controller.productlist[i]["img"]}",
                          name: "${controller.productlist[i]["name"]}",
                          price: "${controller.productlist[i]["price"]}",
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategoryContainer({required String image, required String categoryName}) {
    return Column(
      children: [
        Container(
          child: GestureDetector(
            onTap: () {
              Get.to(CategoryPage(category: categoryName));
            },
            child: Container(
              width: 95,
              height: 95,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          categoryName,
          style: GoogleFonts.workSans(
            color: Color.fromRGBO(26, 116, 49, 1),
            fontSize: 17,
            letterSpacing: -0.24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
