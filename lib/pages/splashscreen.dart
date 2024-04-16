import 'package:application5/controller/constant/imgs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/widgets.dart';
import 'package:type_text/type_text.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool firstAnimationCompleted = false;
  bool secondAnimationCompleted = false;
  bool textAnimationCompleted = false;

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Future.delayed(Duration(milliseconds: 5324), () {
          Navigator.of(context).pushReplacementNamed("onBoarding");
        });
      } else {
        Future.delayed(Duration(milliseconds: 5324), () {
          Navigator.of(context).pushReplacementNamed("bottombar");
        });
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1FCF3),
      body: Stack(
        children: <Widget>[
          if (!firstAnimationCompleted)
            Center(
              child: BounceInUp(
                animate: true,
                from: 500,
                duration: Duration(seconds: 3),
                child: Image(
                  image: AssetImage(logo),
                  width: 90,
                  height: 90,
                ),
                onFinish: (direction) {
                  setState(() {
                    firstAnimationCompleted = true;
                  });
                },
              ),
            ),
          if (firstAnimationCompleted) ...[
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              left: 138,
              top: MediaQuery.of(context).size.height / 2 - 24,
              child: Text("Agri",
                  style: GoogleFonts.lexendDeca(
                      textStyle: TextStyle(
                          fontSize: 40,
                          color: Color.fromRGBO(27, 96, 45, 1),
                          fontWeight: FontWeight.w600))),
              onEnd: () {
                setState(() {
                  textAnimationCompleted = true;
                });
              },
            ),
          ],
          if (firstAnimationCompleted && !secondAnimationCompleted) ...[
            AnimatedPositioned(
              duration: const Duration(seconds: 0),
              curve: Curves.easeInOut,
              left: 30,
              top: MediaQuery.of(context).size.height / 2 -
                  45, // Center vertically
              child: Image(
                image: AssetImage(logo),
                width: 90,
                height: 90,
              ),
              onEnd: () {
                setState(() {
                  secondAnimationCompleted = true;
                });
              },
            ),
            if (firstAnimationCompleted &&
                !secondAnimationCompleted &&
                !textAnimationCompleted) ...[
              AnimatedPositioned(
                left: 223,
                top: MediaQuery.of(context).size.height / 2 - 22,
                duration: Duration(seconds: 1),
                child: TypeText(
                  "Livia",
                  duration: Duration(seconds: 1),
                  style: TextStyle(
                      fontSize: 40,
                      color: Color.fromRGBO(44, 187, 80, 1),
                      fontWeight: FontWeight.w600),
                  onType: (progress) {
                    setState(() {});
                  },
                ),
              )
            ]
          ]
        ],
      ),
    );
  }
}
