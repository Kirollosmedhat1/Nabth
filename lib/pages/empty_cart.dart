import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Empty_Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF1FCF3),
        appBar: AppBar(
            backgroundColor: Color(0xffF1FCF3),
            leading: IconButton(
              onPressed: () {},
              icon: Image.asset(
                "images/back.png",
                height: 20,
              ),
            ),
            title: Text(
              "Cart",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(
                    0xff1B602D,
                  ),
                  fontSize: 25),
            )),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            color: Colors.white,
            child: Center(
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "0 Items in your cart",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff184F27)),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(children: [
                            Icon(Icons.add),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Add more",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff184F27)),
                            ),
                          ]),
                        )
                      ]),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Your Cart is Empty",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "WorkSans",
                              fontWeight: FontWeight.w500,
                              color: Color(0xff8E8E93)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 307,
                          width: 285,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(142.5),
                            border: Border.all(color: Colors.grey),
                            image: DecorationImage(
                                image: AssetImage(
                                    "images/Animation - 1713573574065.gif"),
                                fit: BoxFit.fill),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
