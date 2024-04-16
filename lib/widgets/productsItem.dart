import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItemsWidget extends StatelessWidget {
  ProductItemsWidget(
      {super.key, required this.img, required this.name, required this.price});

  final String img;
  final String name;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xffD9D9D9), width: 1),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 7,
                offset: Offset(0, 3),
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    scale: 50,
                    image: NetworkImage(
                      img,
                    ))),
          ),
          Text(
            name,
            style: GoogleFonts.workSans(
              color: Color.fromRGBO(30, 155, 61, 1),
              fontSize: 18,
              letterSpacing: -2.24,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            price,
            style: GoogleFonts.workSans(
              color: Color.fromRGBO(30, 155, 61, 1),
              fontSize: 18,
              letterSpacing: -2.24,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Text(
              //   "${controller.seedlingsList[i]["cat"]}",
              //   style: GoogleFonts.workSans(
              //     color: Color.fromRGBO(30, 155, 61, 1),
              //     fontSize: 2,
              //     letterSpacing: -2.24,
              //     fontWeight: FontWeight.w400,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
