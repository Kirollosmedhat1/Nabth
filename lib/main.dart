// ignore_for_file: prefer_const_constructors
import 'package:application5/pages/Payment_Page.dart';
import 'package:application5/pages/Payment_Page2.dart';
import 'package:application5/pages/Porfile_Page.dart';
import 'package:application5/pages/Porfile_Page2.dart';
import 'package:application5/pages/bottomBar.dart';
import 'package:application5/pages/community.dart';
import 'package:application5/pages/homepage.dart';
import 'package:application5/pages/login.dart';
import 'package:application5/pages/onboarding.dart';
import 'package:application5/pages/scan.dart';
import 'package:application5/pages/signup.dart';
import 'package:application5/pages/splashscreen.dart';
import 'package:application5/pages/store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // name: "flutterapplication4-2d098",
      options: const FirebaseOptions(
          apiKey: "AIzaSyDPVSJbwS4GpdmC1nsYDdT7Puv71DQs5Rw",
          appId: "1:1028160968707:android:af85f262e79b630bb39636",
          messagingSenderId: "1028160968707",
          projectId: "application5-3bcfb"));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      home: BottomBar(),
      // FirebaseAuth.instance.currentUser != null &&
      //         FirebaseAuth.instance.currentUser!.emailVerified
      //     ? BottomBar(),
      //     : SplashScreen(),
      routes:{
        "porfile": (context) => Porfile_Page(),
        "porfile2": (context) => Porfile_Page2(),
        "bottombar":(context) => BottomBar(),
        "homepage":(context) => HomePage(),
        "login":(context) => LoginPage(),
        "SignUp": (context) => SignUp(),
        "store":(context) =>  Store(),
         "Scanpage":(context) => ScanPage(),
        "communitypage":(context) => CommunityPage(),
        "paymentpage":(context) => PaymentPage(),
        "paymentpage2":(context) => PaymentPage2(),
         "splash":(context) => SplashScreen(),
          "onBoarding":(context)=> OnBoarding(),
   
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
