// ignore_for_file: prefer_const_constructors
import 'package:application5/controller/cont/cart_controller.dart';
import 'package:application5/pages/2orders.dart';
import 'package:application5/pages/MyOrderss.dart';
import 'package:application5/pages/Payment_Page.dart';
import 'package:application5/pages/Payment_Page2.dart';
import 'package:application5/pages/Porfile_Page2.dart';
import 'package:application5/pages/Shipping_Process.dart';
import 'package:application5/pages/cart_page.dart';
import 'package:application5/pages/chat_page.dart';
import 'package:application5/pages/checkout.dart';
import 'package:application5/pages/community.dart';
import 'package:application5/pages/communtiy.dart';
import 'package:application5/pages/empty_cart.dart';
import 'package:application5/pages/homepage.dart';
import 'package:application5/pages/login.dart';
import 'package:application5/pages/onboarding.dart';
import 'package:application5/pages/scan.dart';
import 'package:application5/pages/signup.dart';
import 'package:application5/pages/splashscreen.dart';
import 'package:application5/pages/store.dart';
import 'package:application5/pages/success_page.dart';
import 'package:application5/pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // name: "flutterapplication4-2d098",
      options: const FirebaseOptions(
          apiKey: "AIzaSyDPVSJbwS4GpdmC1nsYDdT7Puv71DQs5Rw",
          appId: "1:1028160968707:android:af85f262e79b630bb39636",
          messagingSenderId: "1028160968707",
          projectId: "application5-3bcfb")
          );
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
      home: SplashScreen(),
      // BottomBar(selectedIndex: 0,),
      // FirebaseAuth.instance.currentUser != null &&
      //         FirebaseAuth.instance.currentUser!.emailVerified
      //     ? BottomBar(),
      //     : SplashScreen(),
      routes:{
        "porfile2": (context) => Porfile_Page2(),
        "login":(context) => LoginPage(),
        "SignUp": (context) => SignUp(),
        "store":(context) =>  Store(),
         "Scanpage":(context) => ScanPage(),
        "communitypage":(context) => CommunityPage(),
        "paymentpage":(context) => PaymentPage(),
        "paymentpage2":(context) => PaymentPage2(),
         "splash":(context) => SplashScreen(),
          "onBoarding":(context)=> OnBoarding(),
          "cartpage":(context)=> CartPage(),
          "checkout":(context)=> checkout(),
          "successpage":(context)=> PaymentSuccessPage(),
          "Shipping_Process":(context)=> Shipping_Process(),
          "Empty_Cart":(context)=>Empty_Cart(),
          "communtiy":(context) => Communtiy(),
          "ChatPage":(context) => ChatPage(),
          "OrdersPage":(context) =>OrdersPage(),
          "myorders":(context) =>MyOrderss(),
      },
      initialBinding: BindingsBuilder(() {
        Get.put(CartController());
      }),
      debugShowCheckedModeBanner: false,
    );
  }
}
