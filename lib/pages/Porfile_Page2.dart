
import 'package:application5/controller/cont/cart_controller.dart';
import 'package:application5/pages/2orders.dart';
import 'package:application5/pages/MyOrderss.dart';
import 'package:application5/pages/success_page.dart';
import 'package:application5/widgets/myACCRow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Porfile_Page2 extends StatefulWidget {
  Porfile_Page2({super.key});
  


  @override
  State<Porfile_Page2> createState() => _Porfile_PageState();
}

class _Porfile_PageState extends State<Porfile_Page2> {
  int _selectedIndex = 0;
  final CartController _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1FCF3),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 800,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              Positioned(
                top: -50,
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("images/user.png"),
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      "Camelia Waheeb",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A7431)),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 150,
                left: -15,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyACCrow(
                            iconImage: "images/favourites.png",
                            title: "Favourites"),
                        SizedBox(height: 9),
                        Divider(
                          color: Color.fromARGB(255, 163, 204, 166),
                        ),
                        SizedBox(height: 9),
                        MyACCrow(
                          iconImage: "images/myorder.png",
                          title: "My Orders",
                          onPressed: () {
                           
                            Get.to(MyOrderss());
                          },
                        ),
                        Divider(
                          color: Color.fromARGB(255, 163, 204, 166),
                        ),
                        SizedBox(height: 9),
                        MyACCrow(
                          iconImage: "images/payment.png",
                          title: "Payment Method",
                          onPressed: () {
                            Get.off(PaymentSuccessPage());
                          },
                        ),
                        SizedBox(height: 9),
                        Divider(
                          color: Color.fromARGB(255, 163, 204, 166),
                        ),
                        SizedBox(height: 9),
                        MyACCrow(
                            iconImage: "images/support.png",
                            title: "Help & Support"),
                        SizedBox(height: 9),
                        Divider(
                          color: Color.fromARGB(255, 163, 204, 166),
                        ),
                        SizedBox(height: 9),
                        MyACCrow(
                            iconImage: "images/about.png", title: "About App"),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
