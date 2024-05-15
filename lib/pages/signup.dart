// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1B602D),
      ),
      body: ListView(
        children: [
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
                          if (formState.currentState!.validate()) {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: email.text,
                                password: password.text,
                              );
                              FirebaseAuth.instance.currentUser!.sendEmailVerification();
                              Navigator.of(context).pushReplacementNamed("login");
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                print('The password provided is too weak.');
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.bottomSlide,
                                  title: "Error",
                                  desc: "The password provided is too weak.",
                                ).show();
                              } else if (e.code == 'email-already-in-use') {
                                print('The account already exists for that email.');
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.bottomSlide,
                                  title: "Error",
                                  desc: "The account already exists for that email.",
                                ).show();
                              }
                            } catch (e) {
                              print(e);
                            }
                          } else {
                            print("not valid");
                          }
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
