import 'package:application5/pages/homepage.dart';
import 'package:application5/pages/login.dart';
import 'package:application5/pages/signup.dart';
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
    // Firebase.initializeApp();
    // // Get a reference to the app with the name "[DEFAULT]"
    // FirebaseApp app = Firebase.app('[DEFAULT]');
    // // Delete the app
    // app.delete();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      home: (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified)
          ? HomePage()
          : LoginPage(),
      routes:{
        "homepage":(context) => HomePage(),
        "login":(context) => LoginPage(),
        "SignUp": (context) => SignUp(),
        "store":(context) =>  Store(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
