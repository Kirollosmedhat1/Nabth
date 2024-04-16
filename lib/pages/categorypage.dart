import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:application5/controller/cont/product_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryPage extends StatelessWidget {
  final String category;

  CategoryPage({required this.category});

  final ProductController controller = Get.find<ProductController>();

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
      appBar: AppBar(
        title: Text(category),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 48,
          crossAxisSpacing: 58,
        ),
        itemCount: categoryList.length,
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.all(10),
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffD9D9D9), width: 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
            height: 70,
            
            decoration: BoxDecoration(
              
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage(categoryList[i]["img"]))
            ),
            
          ),
                Text(
                  "${categoryList[i]["name"]}",
                  style: GoogleFonts.workSans(
                    color: Color.fromRGBO(30, 155, 61, 1),
                    fontSize: 18,
                    letterSpacing: -2.24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "${categoryList[i]["price"]}",
                  style: GoogleFonts.workSans(
                    color: Color.fromRGBO(30, 155, 61, 1),
                    fontSize: 18,
                    letterSpacing: -2.24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
