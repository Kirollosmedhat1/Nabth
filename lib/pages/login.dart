// ignore_for_file: prefer_const_constructors

import 'package:application5/widgets/myButton.dart';
import 'package:application5/widgets/myCircleButton.dart';
import 'package:application5/widgets/myHeading.dart';
import 'package:application5/widgets/myTextField.dart';
import 'package:application5/widgets/myTextFieldLable.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isloading = false;

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn().signIn().catchError((onError) {
      print("Error $onError");
    });
    if (googleUser == null) {
      return;
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context).pushReplacementNamed("bottombar");
  }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken?.token);

  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1B602D),
        // leading:
        //     IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios))
      ),
      body: ListView(
        children: [
          Container(
            color: Color(0xff1B602D),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyHeading(lable: "Welcome Back"),
                    MyHeading(lable: "Login to your Account"),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                padding: EdgeInsets.fromLTRB(45, 55, 44, 0),
                child: Form(
                  key: formState,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextFieldLable(lable: "Email Address"),
                        Container(height: 10),
                        MyTextFormField(
                          hintText: "xxxy@example.com",
                          mycontroller: email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field cannot be empty ";
                            }
                            return null;
                          },
                        ),
                        Container(height: 20),
                        MyTextFieldLable(lable: "Password"),
                        Container(height: 10),
                        MyTextFormField(
                          hintText: "************",
                          mycontroller: password,
                          validator: (val) {
                            if (val == "") {
                              return "This field cannot be empty ";
                            }
                            return null;
                          },
                        ),
                        InkWell(
                          onTap: () async {
                            if (email.text == "") {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.bottomSlide,
                                title: "Hi there",
                                desc:
                                    "Oops! It seems you forgot to enter your email address. Please provide your email so we can send you a password reset link. Thanks!",
                              ).show();
                              return;
                            }
                            try {
                              await FirebaseAuth.instance
                                  .sendPasswordResetEmail(email: email.text);
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.success,
                                animType: AnimType.bottomSlide,
                                title: "Hi there",
                                desc:
                                    " Forgot your password? No worries! we will send a reset link to your email. Check your inbox shortly. Thanks!",
                              ).show();
                            } catch (e) {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.bottomSlide,
                                title: "Hi there",
                                desc:
                                    " It looks like the email you entered doesn't match our records. Please double-check your email address and try again.",
                              ).show();
                              print(e);
                            }
                          },
                          child: Container(
                              margin: const EdgeInsets.only(top: 0, bottom: 20),
                              alignment: Alignment.centerRight,
                              child:
                                  MyTextFieldLable(lable: "Forget Password?")),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 50,
                            ),
                            Expanded(
                                child: MyButton(
                              lable: "login",
                              onPressed: () async {
                                if (formState.currentState!.validate()) {
                                  try {
                                    // isloading = true;
                                    setState(() {});
                                    final credential = await FirebaseAuth
                                        .instance
                                        .signInWithEmailAndPassword(
                                      email: email.text,
                                      password: password.text,
                                    );
                                    // isloading = false;
                                    setState(() {});
                                    if (credential.user!.emailVerified) {
                                      Navigator.of(context)
                                          .pushReplacementNamed("bottombar");
                                    } else {
                                      FirebaseAuth.instance.currentUser!
                                          .sendEmailVerification();
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.info,
                                        animType: AnimType.bottomSlide,
                                        title: "Verify Your Email to Continue",
                                        desc:
                                            "Please verify your email address before proceeding. We have sent an email with verification link. Click on the link to verify your email. Once verified, you'll be able to log in and access your account.",
                                      ).show();
                                    }
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      print('No user found for that email.');
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.error,
                                        animType: AnimType.bottomSlide,
                                        title: "Error",
                                        desc: "No user found for that email.",
                                      ).show();
                                    } else if (e.code == 'wrong-password') {
                                      print(
                                          'Wrong password provided for that user.');
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.error,
                                        animType: AnimType.bottomSlide,
                                        title: "Error",
                                        desc:
                                            "Wrong password provided for that user.",
                                      ).show();
                                    }
                                  }
                                } else {
                                  print("not valid");
                                }
                              },
                            )),
                            SizedBox(
                              width: 50,
                            )
                          ],
                        ),
                        Container(
                          height: 50,
                        ),
                        Row(children: [
                          Expanded(
                              child: Divider(
                            thickness: 1.5,
                            endIndent: 15,
                          )),
                          Text("Or Login with"),
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
                            MyCircleButton(
                              image: "images/facebook.png",
                              onPressed: () {},
                            ),
                            Container(
                              width: 50,
                            ),
                            MyCircleButton(
                              image: "images/google.png",
                              onPressed: () {
                                signInWithGoogle();
                              },
                            )
                          ],
                        ),
                        Container(height: 40),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "SignUp");
                            // Get.off(SignUp());
                          },
                          child: const Center(
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                text: "Don't Have An Account ? ",
                              ),
                              TextSpan(
                                  text: "Create new account",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ])),
                          ),
                        )
                      ]),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
