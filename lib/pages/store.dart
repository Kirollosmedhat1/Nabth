import 'package:application5/controller/constant/imgs.dart';
import 'package:application5/controller/cont/cart_controller.dart';
import 'package:application5/widgets/myDrawer.dart';
import 'package:application5/widgets/productsItem.dart';
import 'package:application5/widgets/store_Appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:application5/controller/cont/product_controller.dart';
import 'package:application5/pages/category_page.dart';
import 'package:google_fonts/google_fonts.dart';

class Store extends StatelessWidget {
  Store({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CartController());
    return Scaffold(
      appBar: StoreAppbar(),
      drawer: const Mydrawer(),
      body: Container(
        color: const Color(0xffF1FCF3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text(
                        "Categories",
                        style: GoogleFonts.workSans(
                          color: const Color.fromRGBO(24, 79, 39, 1),
                          fontSize: 25,
                          letterSpacing: -0.24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.only(left: 57),
                    alignment: Alignment.topLeft,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  const SizedBox(height: 30),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "All Products",
                            style: GoogleFonts.workSans(
                              color: const Color.fromRGBO(24, 79, 39, 1),
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
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 20),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                                mainAxisSpacing: 42,
                                crossAxisSpacing: 90,
                              ),
                              itemCount: controller.productlist.length,
                              itemBuilder: (context, i) {
                                return ProductItemsWidget(
                                  img: "${controller.productlist[i]["img"]}",
                                  name: "${controller.productlist[i]["name"]}",
                                  price:
                                      "${controller.productlist[i]["price"]}",
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryContainer(
      {required String image, required String categoryName}) {
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
        const SizedBox(
          height: 10,
        ),
        Text(
          categoryName,
          style: GoogleFonts.workSans(
            color: const Color.fromRGBO(26, 116, 49, 1),
            fontSize: 17,
            letterSpacing: -0.24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
