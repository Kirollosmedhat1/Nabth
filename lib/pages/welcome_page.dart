import 'package:application5/pages/login.dart';
import 'package:application5/pages/signup.dart';
import 'package:application5/widgets/myButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/logo.png"), fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.only(left: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome To",
                    style: TextStyle(
                        color: Color(0xff1B602D),
                        fontSize: 27,
                        fontWeight: FontWeight.w900,
                        fontFamily: "WorkSans"),
                  ),
                  Text(
                    " Agri",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff184F27)),
                  ),
                  Text(
                    "livia",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff2CBB50)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Text(
              "Growing Greener, Virtually Planted.",
              style: TextStyle(
                  color: Color(0xff1A7431),
                  fontSize: 21,
                  fontWeight: FontWeight.w300,
                  fontFamily: "WorkSans"),
            ),
            SizedBox(
              height: 50,
            ),
            MyButton(
              lable: "Login",
              onPressed: () {
                Get.off(LoginPage());
              },
            ),
            SizedBox(
              height: 25,
            ),
            MyButton(
              lable: "Sign up",
              onPressed: () {
                Get.off(SignUp());
              },
            ),
          ],
        ),
      ),
    );
  }
}
