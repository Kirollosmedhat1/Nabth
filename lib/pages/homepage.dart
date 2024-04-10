import 'package:application5/pages/login.dart';
import 'package:application5/pages/store.dart';
import 'package:application5/widgets/myButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: 
        Column(
          children: [
            MyButton(lable: "",onPressed: ()async {
            
              await FirebaseAuth.instance.signOut();
              Get.off(LoginPage());
              
            },),
            MyButton(lable: "lable",onPressed: () {
              Get.to(Store());
            },)
          ],
        )
        
      ) ,
    );
  }
}