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
              margin: const EdgeInsets.only(top: 30),
              height: 180,
              width: 180,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/logo.png"), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.only(left: 26),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
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
            const SizedBox(
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
            const SizedBox(
              height: 50,
            ),
            MyButton(
              lable: "Login",
              onPressed: () {
                Get.off(const LoginPage());
              },
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              lable: "Sign up",
              onPressed: () {
                Get.off(const SignUp());
              },
            ),
          ],
        ),
      ),
    );
  }
}
