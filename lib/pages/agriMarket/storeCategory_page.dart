import 'package:application5/pages/homepage.dart';
import 'package:application5/pages/login.dart';
import 'package:application5/widgets/heading_with_back.dart';
import 'package:application5/widgets/myDrawer.dart';

import 'package:application5/widgets/productsItem.dart';
import 'package:application5/widgets/store_Appbar.dart';
import 'package:application5/widgets/titleWith_Shadow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:application5/controller/cont/product_controller.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class CategoryPage extends StatelessWidget {
  final String category;
  int _selectedIndex = 0;
  CategoryPage({required this.category});

  final ProductController controller = Get.find<ProductController>();
  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      Get.off(const LoginPage());
      // Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
    } catch (error) {}
  }
 
  @override
  Widget build(BuildContext context) {
    List<dynamic> categoryList = [];

    if (category == "Seedlings") {
      categoryList = controller.productlist
          .where((product) => product["cat"] == "Seedlings")
          .toList();
    } else if (category == "Fertilizers") {
      categoryList = controller.productlist
          .where((product) => product["cat"] == "Fertilizers")
          .toList();
    } else if (category == "Farming Tools") {
      categoryList = controller.productlist
          .where((product) => product["cat"] == "Farming Tools")
          .toList();
    }

    return Scaffold(
      drawer: const Mydrawer(),
      appBar: StoreAppbar(),
      body: Container(
        color: const Color(0xffF1FCF3),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              HeadingWithBack(title: category, fontFamily: "WorkSans"),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 46, top: 18),
                      child: TitleWithShadow(title: "AgriProducts"),
                    ),
                    GridView.builder(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 20),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        mainAxisSpacing: 42,
                        crossAxisSpacing: 90,
                      ),
                      itemCount: categoryList.length,
                      itemBuilder: (context, i) {
                        return ProductItemsWidget(
                          img: "${categoryList[i]["img"]}",
                          name: "${categoryList[i]["name"]}",
                          price: "${categoryList[i]["price"]}",
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}