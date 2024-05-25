// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';

import 'package:application5/controller/cont/authcontroller.dart';
import 'package:application5/pages/login.dart';
import 'package:application5/widgets/myButton.dart';
import 'package:application5/widgets/myCircleButton.dart';
import 'package:application5/widgets/myHeading.dart';
import 'package:application5/widgets/myTextField.dart';
import 'package:application5/widgets/myTextFieldLable.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final controller=Get.put(AuthController());
  final ImagePicker _picker = ImagePicker();

  void _getImage(ImageSource source) async {
    final XFile? pickedImage = await _picker.pickImage(source: source);
    if (pickedImage != null) {
      // Upload the image to Firebase Storage
      final imageUrl =
          await controller.uploadProfileImage(File(pickedImage.path));
      if (imageUrl != null) {
        // Update the profile photo in Firestore
        await controller.updateProfilePhoto(imageUrl);
      }
    }
  }

  void _getImageOptions() {
    showModalBottomSheet(
      context: Get.context!,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_enhance_sharp),
                title: const Text('Camera'),
                onTap: () {
                  _getImage(ImageSource.camera); // Open camera
                  Get.back(); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  _getImage(ImageSource.gallery); // Open gallery
                  Get.back(); // Close the bottom sheet
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1B602D),
      ),
      body: ListView(
        children: [

          Obx(() => CircleAvatar(
                              backgroundColor: const Color(0xffd9d9d9),
                              radius: 0,
                              backgroundImage: controller
                                      .displayUserPhoto.value.isNotEmpty
                                  ? NetworkImage(
                                      controller.displayUserPhoto.value)
                                  : const NetworkImage(
                                      'https://firebasestorage.googleapis.com/v0/b/medeasefinal.appspot.com/o/profiletest.jpg?alt=media&token=105b3a2a-708d-49e4-a3fd-bfaa5d103a76'),
                            )),


          Container(
            color: Color(0xff1B602D),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                   padding: EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyHeading(lable: "Hello there, Start "),
                    MyHeading(lable: "Create new Account"),
                    SizedBox(height: 20,)
                  ],
                ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))), 
                                         
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 0),
                      child: Form(
                        key: formState,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(height: 40),
                            MyTextFieldLable(
                              lable: "Username",
                            ),
                            Container(height: 5),
                            MyTextFormField(
                              hintText: "Enter your Name",
                              mycontroller: username,
                              validator: (val) {
                                if (val == "") {
                                  return "This field cannot be empty ";
                                }
                                return null;
                              },
                            ),
                            Container(height: 10),
                            MyTextFieldLable(
                              lable: "Email Address",
                            ),
                            Container(height: 5),
                            MyTextFormField(
                              hintText: "Enter your E-mail",
                               mycontroller: email,
                              validator: (val) {
                                if (val == "") {
                                  return "This field cannot be empty ";
                                }
                                return null;
                              },
                              ),
                
                            Container(height: 10),
                            MyTextFieldLable(
                              lable: "Password",
                            ),
                            Container(height: 5),
                            MyTextFormField(
                              hintText: "**********",
                              mycontroller: password,
                              validator: (val) {
                                if (val == "") {
                                  return "This field cannot be empty ";
                                }
                                return null;
                              },
                              ),
                            Container(height: 10),
                            MyTextFieldLable(
                              lable: "Confirm Password",
                            ),
                            Container(height: 5),
                            MyTextFormField(
                              hintText: "**********",
                              mycontroller: confirmPassword,
                              validator: (val) {
                                if (val == "") {
                                  return "This field cannot be empty ";
                                }
                                return null;
                              },
                              ),
                            Container(height: 30),
                            Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: 
                                  MyButton(
                                    lable: "Sign up", 
                                    onPressed: () async {
                                      controller.signUpUsingFirebase(email: email.text, password: password.text, name: username.text);
                          // if (formState.currentState!.validate()) {
                          //   try {
                          //     final credential = await FirebaseAuth.instance
                          //         .createUserWithEmailAndPassword(
                          //       email: email.text,
                          //       password: password.text,
                          //     );
                          //     FirebaseAuth.instance.currentUser!.sendEmailVerification();
                          //     Navigator.of(context).pushReplacementNamed("login");
                          //   } on FirebaseAuthException catch (e) {
                          //     if (e.code == 'weak-password') {
                          //       print('The password provided is too weak.');
                          //       AwesomeDialog(
                          //         context: context,
                          //         dialogType: DialogType.error,
                          //         animType: AnimType.bottomSlide,
                          //         title: "Error",
                          //         desc: "The password provided is too weak.",
                          //       ).show();
                          //     } else if (e.code == 'email-already-in-use') {
                          //       print('The account already exists for that email.');
                          //       AwesomeDialog(
                          //         context: context,
                          //         dialogType: DialogType.error,
                          //         animType: AnimType.bottomSlide,
                          //         title: "Error",
                          //         desc: "The account already exists for that email.",
                          //       ).show();
                          //     }
                          //   } catch (e) {
                          //     print(e);
                          //   }
                          // } else {
                          //   print("not valid");
                          // }


                        },
                                    )
                                    ),
                                SizedBox(
                                  width: 50,
                                )
                              ],
                            ),
                            Container(height: 30),
                            Row(children: [
                              Expanded(
                                  child: Divider(
                                thickness: 1.5,
                                endIndent: 15,
                              )),
                              Text("Or Create account with"),
                              Expanded(
                                  child: Divider(
                                thickness: 1.5,
                                indent: 15,
                              )),
                            ]),
                            Container(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyCircleButton(image: "images/facebook.png",onPressed: () {
                                  
                                },),
                                Container(
                                  width: 50,
                                ),
                                MyCircleButton(image: "images/google.png",onPressed: () {
                                  
                                },)
                              ],
                            ),
                            Container(height: 50),
                            InkWell(
                              onTap: () {
                                
                                Get.off(LoginPage());
                              },
                              child: const Center(
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text: "Already have existing account?",
                                  ),
                                  TextSpan(
                                      text: "Login Now",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ])),
                              ),
                            ),
                          ],
                        ),
                      )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
