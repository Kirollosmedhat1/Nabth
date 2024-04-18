
// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
  
}
FirebaseAuth auth = FirebaseAuth.instance;
var googleSignIn = GoogleSignIn();
int kiro =0;
class _HomePageState extends State<HomePage> {
  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
    } catch (error) {}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("$kiro"),
      ),
    );
  }
}